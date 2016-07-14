package service;


import org.hibernate.HibernateException;
import po.CartItem;
import po.User;

import java.util.List;

public interface CartService {
    /**
     * 将一件商品添加到购物车
     */
    void addCart(CartItem cartItem);

    /**
     * 更新购物车中的商品的数量
     */
    void updateCart(CartItem cartItem);

    /**
     * 删除购物车中的一项
     */
    void deleteCart(int userId,int itemId) throws HibernateException;

    void delete(CartItem item);

    void refresh(CartItem item);

    CartItem getCartItem(int itemId);

    List<CartItem> getCartItemsOfUser(User user);
}
