package service;


import po.Cartitem;

public interface CartService {
    /**
     * 将一件商品添加到购物车
     */
    void addToCart(Cartitem cartItem);

    /**
     * 更新购物车中的商品的数量
     */
    void updateCartItem(Cartitem cartItem);

    /**
     * 删除购物车中的一项
     */
    void deleteFromCart(Cartitem cartItem);

}
