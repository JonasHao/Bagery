package action;

import com.opensymphony.xwork2.ActionSupport;
import constant.Config;
import org.hibernate.HibernateException;
import po.*;
import service.CartService;
import service.ProductService;
import service.UserService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static constant.Key.RESULT;

/**
 * Created by jinzil on 2016/6/27.
 */
public class CartAction extends ActionSupport {
    private int productId;
    private int num;
    private double totalPriced;
    private User user;
    private CartItem cartItem;
    private int itemId;
    private CartService cartService;
    private UserService userService;
    private ProductService productService;
    private String result = "login";
    private Map<String, Object> data = new HashMap<>();
    private List<CartItem> cartItemList = new ArrayList<CartItem>();

    public String queryCart() {
        user = userService.getCurrentUser();
        cartItemList = user.getCartItems();
        return SUCCESS;
    }

    public String addCart() {
        try {
            user = userService.getCurrentUser();
            cartItemList = user.getCartItems();
            // first to check if the product already in the cart
            for (CartItem item : cartItemList) {
                if (item.getProductId() == productId) {
                    item.setNum(item.getNum() + 1);
                    cartService.updateCart(item);
                    data.put(RESULT, SUCCESS);
                    return SUCCESS;
                }
            }
            cartItem = new CartItem();
            cartItem.setProductId(productId);
            cartItem.setUserId(user.getUserId());
            cartItem.setNum(1);
            cartService.addCart(cartItem);
            data.put(RESULT, SUCCESS);
        } catch (HibernateException e) {
            e.printStackTrace();
            data.put(RESULT, ERROR);
        }
        return SUCCESS;
    }

    public String deleteCart() {
        try {
            user = userService.getCurrentUser();
            cartService.deleteCart(user.getUserId(), itemId);
            data.put(RESULT, SUCCESS);
        } catch (HibernateException e) {
            if (Config.DEBUG) {
                data.put(RESULT, SUCCESS);
            } else {
                data.put(RESULT, ERROR);
            }
        }
        return SUCCESS;
    }

    public String updateCart() {
        try {
            cartItem = cartService.getCartItem(itemId);
            if (num > 0 && num <= cartItem.getProduct().getStock()) {
                cartItem.setNum(num);
                double salePrice = cartItem.getProduct().getPriced().getSalePrice();
                cartItem.setSubtotal(salePrice * num);
                cartService.updateCart(cartItem);
                data.put(RESULT, SUCCESS);
            } else {
                data.put(RESULT, INPUT);
            }

        } catch (HibernateException e) {
            if (Config.DEBUG) {
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

    public Map<String, Object> getData() {
        return data;
    }

    public void setData(Map<String, Object> data) {
        this.data = data;
    }

    public double getTotalPriced() {
        return totalPriced;
    }

    public void setTotalPriced(double totalPriced) {
        this.totalPriced = totalPriced;
    }

    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }
}
