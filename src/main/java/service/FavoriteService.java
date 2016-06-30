package service;

import po.FavoriteItem;

public interface FavoriteService {
    /**
     * 往数据库增加一条favoriteItem信息
     */
    void favor(FavoriteItem favoriteItem);

    /**
     * 删除数据库的一条favoriteItem信息
     */
    void unfavor(int itemId,int userId);
}
