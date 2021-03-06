package serviceImpl;

import constant.OrderStatus;
import dao.Dao;
import dao.OrderDao;
import org.hibernate.HibernateException;
import po.*;
import service.OrderService;

import java.util.ArrayList;
import java.util.List;

public class OrderServiceImpl implements OrderService {
    private Dao dao;
    private OrderDao orderDao;

    /**
     * 创建订单
     */
    @Override
    public void addOrder(Order order, List<Integer> cartItemIdList) throws HibernateException {
        List<OrderItem> orderItemList = new ArrayList<>();
        CartItem cartItem;
        for (int cartItemId : cartItemIdList) {
            cartItem = dao.get(CartItem.class, cartItemId, true);
            OrderItem orderItem = new OrderItem();

            int stock = cartItem.getProduct().getStock();

            if (stock > 0) {
                Product product = cartItem.getProduct();
                product.setStock(stock - cartItem.getNum());
                orderItem.setProductId(cartItem.getProductId());
                orderItem.setProductTitle(cartItem.getProduct().getPriced().getTitle());
                orderItem.setProduct(product);
                orderItem.setNum(cartItem.getNum());
                orderItem.setTotalPrice(cartItem.getNum() * cartItem.getProduct().getPriced().getSalePrice());
                orderItemList.add(orderItem);
                dao.update(product);
            }
        }
        orderDao.saveOrder(order, orderItemList);
    }


    /**
     * 查询订单
     */
    @Override
    public Order getByOrderId(int orderId) throws HibernateException {
        return orderDao.getByID(orderId);
//        return dao.get(Order.class, orderId);
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Order> getAll() throws HibernateException {
        return orderDao.all();
    }

    /**
     * 更新订单
     */
    @Override
    public void updateOrder(Order order) throws HibernateException {
        dao.update(order);
    }

    /**
     * 删除订单
     */
    @Override
    public void deleteOrder(Order order) throws HibernateException {
        dao.delete(order);
    }

    /**
     * 发货，填写物流单号和物流公司
     */
    @Override
    public void sendPackage(int orderId, String logisticsNum, String logisticsCompany) throws HibernateException {
        Order order = dao.get(Order.class, orderId);
        order.setCourierCompany(logisticsCompany);
        order.setCourierNumber(logisticsNum);
        order.setOrderStatus(OrderStatus.SHIPPED);
        dao.update(order);
    }

    /**
     * 获取订单的物流信息
     */
    @Override
    public String getLogisticsStatus(int orderId) throws HibernateException {
        Order order = dao.get(Order.class, orderId);
        String company = order.getCourierCompany();
        String number = order.getCourierNumber();
        return queryLogisticsAPI(company, number);
    }

    @Override
    public List<Order> getStatusOf(String orderStatus) throws HibernateException {
        return orderDao.getStatusOf(orderStatus);
    }

    @Override
    public List<Order> getOrdersOfUser(User user) {
        try {
            return orderDao.getOrdersOfUser(user);
        } catch (HibernateException e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    private String queryLogisticsAPI(String company, String number) {
        return "物流公司：" + company +
                "<br/>物流单号：" + number +
                "<br/>2016-6-11 广东省集送中心" +
                "<br/>2016-6-12 广东省番禺区集送中心" +
                "<br/>2016-6-13 广东省番禺区大学城华南理工大学";
    }


    public void setDao(Dao dao) {
        this.dao = dao;
    }

    public void setOrderDao(OrderDao orderDao) {
        this.orderDao = orderDao;
    }
}
