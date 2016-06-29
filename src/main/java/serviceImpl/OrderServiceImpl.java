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
     * ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
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
            orderItem.setProductTitle(cartItem.getProduct().getPricedByPricedId().getTitle());
            orderItem.setNum(cartItem.getNum());
            orderItem.setTotalPriced(cartItem.getTotalPriced());
            orderItem.setOrderId(order.getOrderId());
            orderItemList.add(orderItem);
        }
        dao.save(orderItemList);
    }


    /**
     * ï¿½ï¿½Ñ¯ï¿½ï¿½ï¿½ï¿½
     */
    @Override
    public Order getByOrderId(int orderId){
        return dao.get(Order.class,orderId);
    }

    /**
     * ¸üÐÂ¶©µ¥
     */
    @Override
    public void updateOrder(Order order){
        dao.update(order);
    }

    /**
     * É¾ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
     */
    @Override
    public void deleteOrder(int orderId) {
        dao.delete(orderId);
    }

    /**
     * ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ð´ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Åºï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ë¾
     */
    @Override
    public void sendPackage(int orderId, String logisticsNum, String logisticsCompany){

    }

    /**
     * ï¿½ï¿½È¡ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ï¢
     */
    @Override
    public String getLogiticsStatus(int orderId){
        Order order = dao.get(Order.class,orderId);
        String company = order.getCourierCompany();
        String number = order.getCourierNumber();
        return queryLogisticsAPI(company,number);
    }

    private String queryLogisticsAPI(String company, String number){
        String logistics = "ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ï¢ï¿½ï¿½";
        return logistics;
    }

    public void setDao(Dao dao) {
        this.dao = dao;
    }
}
