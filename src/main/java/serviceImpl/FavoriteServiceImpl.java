package serviceImpl;

import dao.Dao;
import po.FavoriteItem;
import service.FavoriteService;

import java.util.List;

/**
 * Created by jinzil on 2016/6/27.
 */
public class FavoriteServiceImpl implements FavoriteService {
    private Dao dao;

    @Override
    public void favor(FavoriteItem favoriteItem) {
        dao.save(favoriteItem);
    }

    @Override
    public void unfavor(int priceId, int userId) {
        List<FavoriteItem> favoriteItems=dao.query("from FavoriteItem where userId=? and pricedId=?").
                setParameter(0,userId).setParameter(1,priceId).list();
        if (favoriteItems.size()==1)
            dao.delete(favoriteItems.get(0));
    }
    public void setDao(Dao dao) {
        this.dao = dao;
    }
}
