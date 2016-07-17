package serviceImpl;

import constant.Config;
import dao.Dao;
import dao.UserDao;
import org.hibernate.HibernateException;
import po.FavoriteItem;
import po.User;
import service.FavoriteService;
import service.UserService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by jinzil on 2016/6/27.
 */
public class FavoriteServiceImpl implements FavoriteService {
    private Dao dao;
    private UserDao userDao;
    private UserService userService;

    @Override
    public void favor(FavoriteItem favoriteItem) {
        dao.save(favoriteItem);
    }

    @Override
    public void unfavor(int priceId, int userId) {
        FavoriteItem favorite = userDao.favorite(userId, priceId);
        if (favorite != null)
            dao.delete(favorite);
    }

    public void setDao(Dao dao) {
        this.dao = dao;
    }

    public int isFavor(int priceId) {
        User user = userService.getCurrentUser();
        if (user == null) {
            return 0;
        }

        List<FavoriteItem> favoriteItemList = new ArrayList<>(user.getFavoriteItems());
        try {
            for (FavoriteItem item : favoriteItemList) {
                if (item.getPricedId() == priceId) {
                    return 1;
                }
            }
        } catch (HibernateException e) {
            e.printStackTrace();
            FavoriteItem item = userDao.favorite(user.getUserId(), priceId);
            return item == null ? 0 : 1;
        }

        return 0;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
