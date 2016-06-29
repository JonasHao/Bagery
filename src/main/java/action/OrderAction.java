package action;

import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.dispatcher.DefaultActionSupport;
import po.Address;
import po.CartItem;
import po.Order;
import po.User;
import service.AddressService;
import service.CartService;
import service.OrderService;
import service.UserService;
import constant.OrderStatus;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * Created by 41159 on 2016/6/29.
 */
public class OrderAction extends DefaultActionSupport {

    private UserService userService;
    private OrderService orderService;
    private AddressService addressService;
    private CartService cartService;
    private Order order;
    private User user;
    private List<Integer> itemIdList;
    private List<CartItem> cartItemList;
    private Collection<Address> addressList;
    private Collection<Order> orderList;
    private List<Integer> cartItemIdList;

//    private String address;


    private int userId;
    private int shipInfId;
    private double total;
    private int orderId;
    private String logistics;
    private String logisticsNum;
    private String logisticsCompany;

    //����
    public String balance() throws Exception{

        user = userService.getCurrentUser();
        addressList = user.getShipInformationsByUserId();
        ActionContext.getContext().getSession().put("addressList", addressList);

        int itemId;
        CartItem cartItem;
        int size = itemIdList.size();
        cartItemList = new ArrayList<>();
        for(int i=0; i<size; i++){
            itemId = itemIdList.get(i);
            cartItem = cartService.getCartItem(itemId);
            cartItemList.add(cartItem);
        }
        ActionContext.getContext().getSession().put("cartItemList", cartItemList);

        //�����ܼ�
        double totalPriced = 0.0;
        int cartSize = cartItemList.size();
        for(int i=0; i<cartSize; i++){
            totalPriced += cartItemList.get(i).getTotalPriced();
        }
        ActionContext.getContext().getSession().put("totalPriced", totalPriced);

        return SUCCESS;
    }

    //���ɶ���
    public String addOrder() throws Exception{

        user = userService.getCurrentUser();
        userId = user.getUserId();

        order = new Order();
        order.setUserId(userId);
        order.setAddressId(shipInfId);
        order.setTotal(total);
        order.setOrderStatus("0");
        orderService.addOrder(order, cartItemIdList);

        return SUCCESS;
    }

    //�鿴����
    public String queryOrder() throws Exception{
        user = userService.getCurrentUser();
        orderList = user.getOrdersesByUserId();
        ActionContext.getContext().getSession().put("orderList", orderList);
     return SUCCESS;
    }

    //ɾ������
    public String deleteOrder() throws Exception{
        orderService.deleteOrder(orderId);
        return SUCCESS;
    }

    //ȡ������
    public String cancelOrder() throws Exception{
        order = orderService.getByOrderId(orderId);
        order.setOrderStatus(OrderStatus.CANCELED);
        orderService.updateOrder(order);
        return SUCCESS;
    }

    //֧������
    public String payment() throws Exception{
        order = orderService.getByOrderId(orderId);
        order.setOrderStatus(OrderStatus.UNSHIPED);
        orderService.updateOrder(order);
        return SUCCESS;
    }

    //ȷ���ջ�
    public String confirmReceive() throws Exception{
        user = userService.getCurrentUser();
        order = orderService.getByOrderId(orderId);
        order.setOrderStatus(OrderStatus.COMPLETED);
        orderService.updateOrder(order);
        return SUCCESS;
    }

    //�û��鿴������Ϣ
    public String getLogisticsStatus() throws Exception{
        user = userService.getCurrentUser();
        logistics = orderService.getLogiticsStatus(orderId);
        ActionContext.getContext().getSession().put("logistics", logistics);
        return SUCCESS;
    }

    //����Ա����
    public String sendPackage() throws Exception{
        orderService.sendPackage(orderId, logisticsNum, logisticsCompany);
        return SUCCESS;
    }

}
