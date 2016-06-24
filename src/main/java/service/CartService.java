package service;


import po.CartItem;

public interface CartService {
    /**
     * 将一件商品添加到购物车
     */
    void addToCart(CartItem cartItem);

    /**
     * 更新购物车中的商品的数量
     */
    void updateCartItem(CartItem cartItem);

    /**
     * 删除购物车中的一项
     */
    void deleteFromCart(CartItem cartItem);

}
