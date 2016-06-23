package service;

import po.Favoriteitem;

public interface FavoriteService {
    /**
     * 往数据库增加一条favoriteItem信息
     */
    void favar(Favoriteitem favoriteItem);

    /**
     * 删除数据库的一条favoriteItem信息
     */
    void unfavor(Favoriteitem favoriteItem);
}
