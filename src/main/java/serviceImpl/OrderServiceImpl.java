package serviceImpl;

import dao.Dao;
import dao.OrderDao;
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
    public void addOrder(Order order, List<Integer> cartItemIdList) {
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
//        dao.saveM(orderItemList, CartItem.class.getSimpleName());
    }


    /**
     * 查询订单
     */
    @Override
    public Order getByOrderId(int orderId) {
        return dao.get(Order.class, orderId);
    }

    /**
     * 更新订单
     */
    @Override
    public void updateOrder(Order order) {
        dao.update(order);
    }

    /**
     * 删除订单
     */
    @Override
    public void deleteOrder(int orderId) {
        dao.delete(dao.get(Order.class, orderId));
    }

    /**
     * 发货，填写物流单号和物流公司
     */
    @Override
    public void sendPackage(int orderId, String logisticsNum, String logisticsCompany) {
        Order order = dao.get(Order.class, orderId);
        order.setCourierCompany(logisticsCompany);
        order.setCourierNumber(logisticsNum);
        dao.update(order);
    }

    /**
     * 获取订单的物流信息
     */
    @Override
    public String getLogisticsStatus(int orderId) {
        Order order = dao.get(Order.class, orderId);
        String company = order.getCourierCompany();
        String number = order.getCourierNumber();
        return queryLogisticsAPI(company, number);
    }

    private String queryLogisticsAPI(String company, String number) {
        String logistics = "锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷息锟斤拷";
        return logistics;
    }


    public void setDao(Dao dao) {
        this.dao = dao;
    }

    public void setOrderDao(OrderDao orderDao) {
        this.orderDao = orderDao;
    }
}
