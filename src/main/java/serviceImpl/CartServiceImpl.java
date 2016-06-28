package serviceImpl;

import dao.Dao;
import po.CartItem;
import service.CartService;

/**
 * Created by jinzil on 2016/6/27.
 */
public class CartServiceImpl implements CartService {
    private Dao dao;
    @Override
    public void addCart(CartItem cartItem) {
        dao.save(cartItem);
    }

    @Override
    public void updateCart(CartItem cartItem) {
        dao.update(cartItem);
    }

    @Override
    public void deleteCart(int userId, int itemId) {
        CartItem cartItem=getCartItem(itemId);
        if(cartItem.getUserId()==userId)
            dao.delete(cartItem);
    }

    @Override
    public CartItem getCartItem(int itemId) {
         return dao.get(CartItem.class,itemId);
    }

    public void setDao(Dao dao) {
        this.dao = dao;
    }
}
