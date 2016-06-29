package serviceImpl;

import dao.Dao;
import po.CartItem;
import po.OrderItem;
import po.Order;
import service.OrderService;

import java.util.List;


public class OrderServiceImpl implements OrderService {

    private Dao dao;
    private List<OrderItem> orderItemList;
    /**
     * ��������
     */
    @Override
    public void addOrder(Order order, List<Integer> cartItemIdList){
        dao.save(order);
        int size = cartItemIdList.size();
        int cartItemId;
        CartItem cartItem;
        OrderItem orderItem = new OrderItem();
        for(int i=0; i<size; i++){
            cartItemId = cartItemIdList.get(i);
            cartItem = dao.get(CartItem.class, cartItemId);

            orderItem.setProductId(cartItem.getProductId());
            orderItem.setProductTitle(cartItem.getProductByProductId().getPricedByPricedId().getTitle());
            orderItem.setNum(cartItem.getNum());
            orderItem.setTotalPriced(cartItem.getTotalPriced());
            orderItem.setOrderId(order.getOrderId());
            orderItemList.add(orderItem);
        }
        dao.save(orderItemList);
    }


    /**
     * ��ѯ����
     */
    public Order getOrder(int orderId){
        return dao.get(Order.class,orderId);
    }
//    @Override
//    public void updateOrder(Comment comment) {
//        dao.update(comment);
//    }

    /**
     * ɾ������
     */
    @Override
    public void deleteOrder(int commentId) {
        dao.delete(commentId);
    }

    /**
     * ��������д�������ź�������˾
     */
    public void sendPackage(int orderId, String logisticsNum, String logisticsCompany){

    }

    /**
     * ��ȡ������������Ϣ
     */
    public String getLogiticsStatus(int orderId){
        Order order = dao.get(Order.class,orderId);
        String company = order.getCourierCompany();
        String number = order.getCourierNumber();
        return queryLogisticsAPI(company,number);
    }

    private String queryLogisticsAPI(String company, String number){
        String logistics = "����������Ϣ��";
        return logistics;
    }

    public void setDao(Dao dao) {
        this.dao = dao;
    }
}
