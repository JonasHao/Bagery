package action;

import com.opensymphony.xwork2.ActionSupport;
import po.CartItem;
import po.User;
import service.CartService;
import service.UserService;

import java.util.List;

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
    private List<CartItem> cartItemList;
    public String queryCart(){
        user=userService.getCurrentUser();
        cartItemList= (List<CartItem>) user.getCartItemsByUserId();
        return SUCCESS;
    }
    public String addCart(){
        user=userService.getCurrentUser();
        cartItem=new CartItem();
        cartItem.setProductId(productId);
        cartItem.setUserId(user.getUserId());
        cartItem.setNum(num);
        cartService.addCart(cartItem);
        return SUCCESS;
    }
    public String deleteCart(){
        user=userService.getCurrentUser();
        cartService.deleteCart(user.getUserId(),itemId);
        return SUCCESS;
    }
    public String updateCart(){
        cartItem=cartService.getCartItem(itemId);
        cartItem.setNum(num);
        cartService.updateCart(cartItem);
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
