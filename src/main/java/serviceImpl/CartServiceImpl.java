package serviceImpl;

import dao.Dao;
import org.hibernate.HibernateException;
import po.CartItem;
import po.User;
import service.CartService;

import java.util.ArrayList;
import java.util.List;

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
        CartItem cartItem = getCartItem(itemId);
        if (cartItem == null) {
            //// TODO: 2016/7/1  
            return;
        }
        if (cartItem.getUserId() == userId)
            dao.delete(cartItem);
    }

    @Override
    public void delete(CartItem item) throws HibernateException {
        dao.delete(item);
    }

    @Override
    public CartItem getCartItem(int itemId) {
        return dao.get(CartItem.class, itemId);
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<CartItem> getCartItemsOfUser(User user) {
        try {
            return dao.query("from CartItem where userId=?").setParameter(0, user.getUserId()).list();
        } catch (HibernateException e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    public void setDao(Dao dao) {
        this.dao = dao;
    }
}
