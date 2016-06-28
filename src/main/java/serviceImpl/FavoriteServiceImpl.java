package serviceImpl;

import dao.Dao;
import po.FavoriteItem;
import service.FavoriteService;

/**
 * Created by jinzil on 2016/6/27.
 */
public class FavoriteServiceImpl implements FavoriteService {
    private Dao dao;

    @Override
    public void favar(FavoriteItem favoriteItem) {
        dao.save(favoriteItem);
    }

    @Override
    public void unfavor(int itemId, int userId) {
        FavoriteItem favoriteItem=dao.get(FavoriteItem.class,itemId);
        if(favoriteItem.getUserId()==userId)
            dao.delete(favoriteItem);
    }
    public void setDao(Dao dao) {
        this.dao = dao;
    }
}
