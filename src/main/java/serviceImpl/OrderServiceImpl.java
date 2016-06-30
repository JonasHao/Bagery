package serviceImpl;

import dao.Dao;
import po.CartItem;
import po.OrderItem;
import po.Order;
import service.OrderService;

import java.util.ArrayList;
import java.util.List;


public class OrderServiceImpl implements OrderService {

    private Dao dao;

    /**
     * 创建订单
     */
    @Override
    public void addOrder(Order order, List<Integer> cartItemIdList){
        dao.save(order);
        List<OrderItem> orderItemList = new ArrayList<>();
        int size = cartItemIdList.size();
        int cartItemId;
        CartItem cartItem;
        OrderItem orderItem = new OrderItem();
        for(int i=0; i<size; i++){
            cartItemId = cartItemIdList.get(i);
            cartItem = dao.get(CartItem.class, cartItemId);

            orderItem.setProductId(cartItem.getProductId());
            orderItem.setProductTitle(cartItem.getProduct().getPriced().getTitle());
            orderItem.setNum(cartItem.getNum());
            orderItem.setTotalPriced(cartItem.getSubtotal());
            orderItem.setOrderId(order.getOrderId());
            orderItemList.add(orderItem);
        }
        dao.save(orderItemList);
    }


    /**
     * 查询订单
     */
    @Override
    public Order getByOrderId(int orderId){
        return dao.get(Order.class,orderId);
    }

    /**
     * 更新订单
     */
    @Override
    public void updateOrder(Order order){
        dao.update(order);
    }

    /**
     * 删除订单
     */
    @Override
    public void deleteOrder(int orderId) {
        dao.delete(orderId);
    }

    /**
     * 发货，填写物流单号和物流公司
     */
    @Override
    public void sendPackage(int orderId, String logisticsNum, String logisticsCompany){

        Order order = dao.get(Order.class, orderId);
        order.setCourierCompany(logisticsCompany);
        order.setCourierNumber(logisticsNum);
        dao.update(order);

    }

    /**
     * 获取订单的物流信息
     */
    @Override
    public String getLogisticsStatus(int orderId){
        Order order = dao.get(Order.class, orderId);
        String company = order.getCourierCompany();
        String number = order.getCourierNumber();
        return queryLogisticsAPI(company,number);
    }

    private String queryLogisticsAPI(String company, String number){
        String logistics = "锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷息锟斤拷";
        return logistics;
    }

    public void setDao(Dao dao) {
        this.dao = dao;
    }
}
