package serviceImpl;

import constant.OrderStatus;
import dao.Dao;
import dao.OrderDao;
import org.hibernate.HibernateException;
import po.CartItem;
import po.OrderItem;
import po.Order;
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
        OrderItem orderItem = new OrderItem();
        for (int cartItemId : cartItemIdList) {
            cartItem = dao.get(CartItem.class, cartItemId);
            orderItem.setProductId(cartItem.getProductId());
            orderItem.setProductTitle(cartItem.getProduct().getPriced().getTitle());
            orderItem.setNum(cartItem.getNum());
            orderItemList.add(orderItem);
        }
        orderDao.saveOrder(order, orderItemList);
    }


    /**
     * 查询订单
     */
    @Override
    public Order getByOrderId(int orderId) throws HibernateException {
        return dao.get(Order.class, orderId);
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Order> getAll() throws HibernateException {
        return dao.query("from Order").list();
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
    public void deleteOrder(int orderId) throws HibernateException {
        dao.delete(dao.get(Order.class, orderId));
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

    private String queryLogisticsAPI(String company, String number) {
        return "物流公司：" + company +
                "\n物流单号：" + number +
                "\n2016-6-11 广东省集送中心" +
                "\n2016-6-12 广东省番禺区集送中心" +
                "\n2016-6-13 广东省番禺区大学城华南理工大学";
    }


    public void setDao(Dao dao) {
        this.dao = dao;
    }

    public void setOrderDao(OrderDao orderDao) {
        this.orderDao = orderDao;
    }
}
