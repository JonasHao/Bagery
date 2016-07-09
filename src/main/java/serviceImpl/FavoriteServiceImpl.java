package serviceImpl;

import constant.Config;
import dao.Dao;
import org.hibernate.HibernateException;
import po.FavoriteItem;
import po.User;
import service.FavoriteService;
import service.UserService;

import java.util.List;

/**
 * Created by jinzil on 2016/6/27.
 */
public class FavoriteServiceImpl implements FavoriteService {
    private Dao dao;
    private UserService userService;

    @Override
    public void favor(FavoriteItem favoriteItem) {
        dao.save(favoriteItem);
    }

    @Override
    public void unfavor(int priceId, int userId) {
        List<FavoriteItem> favoriteItems = dao.query("from FavoriteItem where userId=? and pricedId=?").
                setParameter(0, userId).setParameter(1, priceId).list();
        if (favoriteItems.size() == 1)
            dao.delete(favoriteItems.get(0));
    }

    public void setDao(Dao dao) {
        this.dao = dao;
    }

    public int isFavor(int priceId) {
        User user = userService.getCurrentUser();
        List<FavoriteItem> favoriteItemList = user.getFavoriteItems();
        for (FavoriteItem item : favoriteItemList) {
            if (item.getPricedId() == priceId) {
                return 1;
            }
        }
        return 0;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
