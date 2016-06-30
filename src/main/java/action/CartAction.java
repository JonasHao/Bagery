package action;

import com.opensymphony.xwork2.ActionSupport;
import constant.Config;
import org.hibernate.HibernateException;
import po.CartItem;
import po.Priced;
import po.Product;
import po.User;
import service.CartService;
import service.UserService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static constant.Key.RESULT;

/**
 * Created by jinzil on 2016/6/27.
 */
public class CartAction extends ActionSupport{
    private int productId;
    private int num;
    private User user;
    private CartItem cartItem;
    private int itemId;
    private CartService cartService;
    private UserService userService;
    private Map<String,Object> data=new HashMap<>();
    private List<CartItem> cartItemList=new ArrayList<CartItem>();
    public String queryCart(){
        user=userService.getCurrentUser();
        cartItemList= (List<CartItem>) user.getCartItems();
//        cartItem=new CartItem();
//        cartItem.setNum(2);
//        cartItem.setItemId(1);
//        cartItem.setSubtotal(9999.00);
//        Product product=new Product();
//        product.setColor("red");
//        Priced priced=new Priced();
//        priced.setTitle("TITLE TEST");
//        priced.setUnitPrice(10000.0);
//        priced.setSalePrice(9999.0);
//        product.setPricedByPricedId(priced);
//        cartItem.setProduct(product);
//        cartItemList.add(cartItem);
        return SUCCESS;
    }
    public String addCart(){
        try {
            user=userService.getCurrentUser();
            cartItem=new CartItem();
            cartItem.setProductId(productId);
            cartItem.setUserId(user.getUserId());
            cartItem.setNum(num);
            cartService.addCart(cartItem);
        } catch( HibernateException e){
        if(Config.DEBUG) {
            data.put(RESULT, SUCCESS);
        } else {
            data.put(RESULT, ERROR);
        }
    }
        return SUCCESS;
    }
    public String deleteCart(){
        try{
            user=userService.getCurrentUser();
            cartService.deleteCart(user.getUserId(),itemId);
        }catch( HibernateException e){
            if(Config.DEBUG) {
                data.put(RESULT, SUCCESS);
            } else {
                data.put(RESULT, ERROR);
            }
        }
        return SUCCESS;
    }
    public String updateCart(){
        try{
            cartItem=cartService.getCartItem(itemId);
            cartItem.setNum(num);
            cartService.updateCart(cartItem);
        }catch ( HibernateException e){
            if(Config.DEBUG) {
                data.put(RESULT, SUCCESS);
            } else {
                data.put(RESULT, ERROR);
            }
        }
        return SUCCESS;
    }
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public CartItem getCartItem() {
        return cartItem;
    }

    public void setCartItem(CartItem cartItem) {
        this.cartItem = cartItem;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public List<CartItem> getCartItemList() {
        return cartItemList;
    }

    public void setCartItemList(List<CartItem> cartItemList) {
        this.cartItemList = cartItemList;
    }

    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }
}
