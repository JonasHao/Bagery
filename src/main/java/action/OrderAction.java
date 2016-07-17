package action;

import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.dispatcher.DefaultActionSupport;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import po.*;
import service.*;
import constant.OrderStatus;

import java.util.*;

import static constant.Key.RESULT;

/**
 * Created by 41159 on 2016/6/29.
 */
public class OrderAction extends DefaultActionSupport {

    private UserService userService;
    private OrderService orderService;
    private AddressService addressService;
    private CartService cartService;
    private CommentService commentService;
    private Order order;
    private User user;
    private Address defaultAddress;
    private int productId;

    private double totalPrice;

    private List<Integer> itemIdList = new ArrayList<>();
    private List<CartItem> cartItemList = new ArrayList<>();
    private Collection<Address> addressList = new ArrayList<>();
    private Collection<Order> orderList = new ArrayList<>();
    private List<Integer> cartItemIdList = new ArrayList<>();
    private List<OrderItem> orderItemList = new ArrayList<>();
    private List<Comment> commentList = new ArrayList<>();

    private int userId;
    private int shipInfId;
    private double total;
    private int orderId;
    private String logistics;
    private String logisticsNum;
    private String logisticsCompany;
    private String status;
    private String instruction;
    private String message;

    private Map<String, Object> data = new HashMap<>();

    //����
    public String balance() throws Exception {
        try {
            user = userService.getCurrentUser();
            Hibernate.initialize(user);

            addressList = user.getAddresses();
            addressList.forEach(System.out::println);

            Integer defaultAddressId = user.getDefaultAddressId();

            if (defaultAddressId != null) {
                defaultAddress = addressService.get(user.getDefaultAddressId());
            }

            if (cartItemIdList == null || cartItemIdList.size() == 0) {
                return INPUT;
            }

            for (Integer itemId : cartItemIdList) {
                CartItem cartItem = cartService.getCartItem(itemId);
                cartItemList.add(cartItem);
            }

            for (CartItem item : cartItemList) {
                totalPrice += item.getSubtotal();
                if (item.getProduct() == null) {
                    cartService.refresh(item);
                }
            }

            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ERROR;
    }

    public String instanceBuy() throws Exception {
        try {
            user = userService.getCurrentUser();
            cartItemList = new ArrayList<>(user.getCartItems());
            Hibernate.initialize(cartItemList);
            try {
                int size = cartItemList.size();
            } catch (HibernateException e) {
                cartItemList = cartService.getCartItemsOfUser(user);
            }

            CartItem cartItem = null;
            for (CartItem item : cartItemList) {
                if (item.getProductId() == productId) {
                    cartItem = item;
                    cartItem.setNum(1);
                    Hibernate.initialize(cartItem.getProduct());
                    cartService.updateCart(cartItem);
                    break;
                }
            }
            if (cartItem == null) {
                cartItem = new CartItem();
                cartItem.setProductId(productId);
                cartItem.setUserId(user.getUserId());
                cartItem.setNum(1);
                cartService.addCart(cartItem);
            }

            addressList = user.getAddresses();
            try {
                addressList.forEach(System.out::println);
            } catch (HibernateException e) {
                addressList = addressService.getAddressesOfUser(user);
            }


            defaultAddress = userService.getDefaultAddress(user);

            cartItemList = new ArrayList<>(1);
            cartItemList.add(cartItem);
            if (cartItem.getSubtotal() != null) {
                totalPrice = cartItem.getSubtotal();
            }
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }


    //��������
    public String addOrder() throws Exception {
        if (cartItemIdList == null || cartItemIdList.size() == 0) {
            return INPUT;
        }

        try {
            user = userService.getCurrentUser();
            userId = user.getUserId();

            Integer defaultAddressId = user.getDefaultAddressId();

            if (defaultAddressId == null || defaultAddressId <= 0) {
                message = "请选择收件人";
                return "address";
            }

            order = new Order();
            order.setUserId(userId);
            order.setAddressId(defaultAddressId);
            order.setInstruction(instruction);
            order.setOrderStatus(OrderStatus.UNPAID);
            order.setCreateDate(new Date());
            orderService.addOrder(order, cartItemIdList);

            Double newScore = 0.0;

            for (Integer id : cartItemIdList) {
                CartItem item = cartService.getCartItem(id);
                if (item != null) {
                    newScore += item.getSubtotal();
                }
                cartService.delete(item);
            }

            if (newScore != null) {
                int score = (int) (user.getScore() + newScore);
                user.setScore(score);
                userService.update(user);
            }


            return SUCCESS;
        } catch (HibernateException | NullPointerException e) {
            e.printStackTrace();
        }
        return ERROR;

    }

    //�鿴����
    public String queryOrder() throws Exception {
        try {
            user = userService.getCurrentUser();
            orderList = user.getOrders();
            int size = orderList.size();
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            orderList = orderService.getOrdersOfUser(user);
            if (orderList != null) {
                return SUCCESS;
            }
        }
        return ERROR;
    }

    public String adminQueryOrder() throws Exception {
        try {
            orderList = orderService.getAll();
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ERROR;
    }

    public String QueryOrderFilter() throws Exception {
        try {
            orderList = orderService.getStatusOf(OrderStatus.UNSHIPPED);
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ERROR;
    }

    //ɾ������
    public String deleteOrder() throws Exception {
        try {
            order = orderService.getByOrderId(orderId);
            if (order == null) {
                data.put(RESULT, ERROR);
                return SUCCESS;
            }
            switch (order.getOrderStatus()) {
                case OrderStatus.CANCELED:
                case OrderStatus.UNPAID:
                case OrderStatus.COMPLETED:
                    orderService.deleteOrder(order);
                    data.put(RESULT, SUCCESS);
                    break;
                default:
                    data.put(RESULT, INPUT);
            }
        } catch (Exception e) {
            data.put(RESULT, ERROR);
        }
        return SUCCESS;
    }

    //ȡ������
    public String cancelOrder() throws Exception {
        try {
            order = orderService.getByOrderId(orderId);
            if (order == null) {
                return ERROR;
            }
            switch (order.getOrderStatus()) {
                case OrderStatus.UNPAID:
                    order.setOrderStatus(OrderStatus.CANCELED);
                    orderService.updateOrder(order);
                    break;
                default:
                    data.put(RESULT, INPUT);
            }
        } catch (Exception e) {
            data.put(RESULT, ERROR);
        }
        return SUCCESS;
    }


    //֧��
    public String payment() throws Exception {
        try {
            order = orderService.getByOrderId(orderId);
            if (order == null) {
                return ERROR;
            }
            if (!order.getOrderStatus().equals(OrderStatus.UNPAID)) {
                return INPUT;
            }
            order.setOrderStatus(OrderStatus.UNSHIPPED);
            orderService.updateOrder(order);
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ERROR;
    }

    //ȷ���ջ�
    public String confirmReceive() throws Exception {
        try {
            user = userService.getCurrentUser();
            order = orderService.getByOrderId(orderId);
            if (order == null) {
                return ERROR;
            }
            order.setOrderStatus(OrderStatus.COMPLETED);
            orderService.updateOrder(order);
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ERROR;
    }

    //�鿴������Ϣ
    public String getLogisticsStatus() throws Exception {
        try {
            user = userService.getCurrentUser();
            logistics = orderService.getLogisticsStatus(orderId);
            ActionContext.getContext().getSession().put("logistics", logistics);
            return SUCCESS;
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return ERROR;
    }

    //�̼ҷ���
    public String sendPackage() throws Exception {
        try {
            orderService.sendPackage(orderId, logisticsNum, logisticsCompany);
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ERROR;
    }

    public String toAddOrderComment() throws Exception {
        order = orderService.getByOrderId(orderId);

        if (order != null && order.isNotCommented() && order.getOrderItems() != null) {
            fillComment();
            return SUCCESS;
        }
        return ERROR;
    }

    private void fillComment() {
        orderItemList = new ArrayList<>(order.getOrderItems());
        for (OrderItem item : orderItemList) {
            Comment comment = commentService.getByPricedIdAndOrderId(item.getProduct().getPricedId(), orderId);
            if (comment == null) {
                comment = new Comment();
                comment.setPricedId(item.getProduct().getPriced().getPricedId());
                comment.setPriced(item.getProduct().getPriced());
                comment.setOrderId(order.getOrderId());
                comment.setOrder(order);
            }
            commentList.add(comment);
        }
    }

    public String toAppendComment() throws Exception {
        order = orderService.getByOrderId(orderId);

        if (order != null && order.isCommented() && order.getOrderItems() != null) {
            fillComment();
            return SUCCESS;
        }
        return ERROR;
    }


    public String addComment() throws Exception {
        user = userService.getCurrentUser();
        int userId = user.getUserId();
        if (commentList.size() > 0) {
            Order order = orderService.getByOrderId(commentList.get(0).getOrderId());
            if (order.isNotCommented()) {
                for (Comment comment : commentList) {
                    comment.setUserId(userId);
                }
                commentService.saveComments(commentList);
                return SUCCESS;
            }
        }
        return SUCCESS;
    }

    public String appendComment() throws Exception {
        user = userService.getCurrentUser();

        for (Comment comment : commentList) {
            comment.setUserId(user.getUserId());
        }

        commentService.updateComments(commentList);
        return SUCCESS;
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public OrderService getOrderService() {
        return orderService;
    }

    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    public AddressService getAddressService() {
        return addressService;
    }

    public void setAddressService(AddressService addressService) {
        this.addressService = addressService;
    }

    public CartService getCartService() {
        return cartService;
    }

    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Integer> getItemIdList() {
        return itemIdList;
    }

    public void setItemIdList(List<Integer> itemIdList) {
        this.itemIdList = itemIdList;
    }

    public List<CartItem> getCartItemList() {
        return cartItemList;
    }

    public void setCartItemList(List<CartItem> cartItemList) {
        this.cartItemList = cartItemList;
    }

    public Collection<Address> getAddressList() {
        return addressList;
    }

    public void setAddressList(Collection<Address> addressList) {
        this.addressList = addressList;
    }

    public Collection<Order> getOrderList() {
        return orderList;
    }

    public void setOrderList(Collection<Order> orderList) {
        this.orderList = orderList;
    }

    public List<Integer> getCartItemIdList() {
        return cartItemIdList;
    }

    public void setCartItemIdList(List<Integer> cartItemIdList) {
        this.cartItemIdList = cartItemIdList;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getShipInfId() {
        return shipInfId;
    }

    public void setShipInfId(int shipInfId) {
        this.shipInfId = shipInfId;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getLogistics() {
        return logistics;
    }

    public void setLogistics(String logistics) {
        this.logistics = logistics;
    }

    public String getLogisticsNum() {
        return logisticsNum;
    }

    public void setLogisticsNum(String logisticsNum) {
        this.logisticsNum = logisticsNum;
    }

    public String getLogisticsCompany() {
        return logisticsCompany;
    }

    public void setLogisticsCompany(String logisticsCompany) {
        this.logisticsCompany = logisticsCompany;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Address getDefaultAddress() {
        return defaultAddress;
    }

    public void setDefaultAddress(Address defaultAddress) {
        this.defaultAddress = defaultAddress;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Map<String, Object> getData() {
        return data;
    }

    public void setData(Map<String, Object> data) {
        this.data = data;
    }

    public List<OrderItem> getOrderItemList() {
        return orderItemList;
    }

    public void setOrderItemList(List<OrderItem> orderItemList) {
        this.orderItemList = orderItemList;
    }

    public String getInstruction() {
        return instruction;
    }

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public void setCommentService(CommentService commentService) {
        this.commentService = commentService;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
