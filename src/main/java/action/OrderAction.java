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
//    private Orders orders;
    private User user;
    private List<Integer> itemIdList;
    private List<CartItem> cartItemList;
    private Collection<Address> addressList;
    private List<Integer> cartItemIdList;
//    private String address;

    private int userId;
    private int shipInfId;
    private int total;

    //结算
    public String balance() throws Exception{

        user = userService.getCurrentUser();
//        addressList = user.getAddressesByUserId();
        ActionContext.getContext().getSession().put("addressList", addressList);

        int itemId;
        CartItem cartItem;
        int size = itemIdList.size();
        for(int i=0; i<size; i++){
            itemId = itemIdList.get(i);
            cartItem = cartService.getCartItem(itemId);
            cartItemList.add(cartItem);
        }
        ActionContext.getContext().getSession().put("cartItemList", cartItemList);

        //计算总价
        double totalPriced = 0.0;
        int cartSize = cartItemList.size();
        for(int i=0; i<cartSize; i++){
            totalPriced += cartItemList.get(i).getTotalPriced();
        }
        ActionContext.getContext().getSession().put("totalPriced", totalPriced);

        return SUCCESS;
    }

    //生成订单
    public String addOrder() throws Exception{

        user = userService.getCurrentUser();
        userId = user.getUserId();

        Order order = new Order();
        order.setUserId(userId);
        order.setShipInfId(shipInfId);
        order.setTotal(total);
        order.setOrderStatus("0");
        orderService.addOrder(order, cartItemIdList);

        return SUCCESS;
    }

    //查看订单
    public String queryOrder() throws Exception{
        user = userService.getCurrentUser();
     return SUCCESS;

    }
}
