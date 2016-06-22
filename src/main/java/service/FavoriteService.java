package service;

import po.Favoriteitem;

public interface FavoriteService {
    /**
     * 往数据库增加一条favoriteitem信息
     */
    void favar(Favoriteitem favoriteitem);

    /**
     * 删除数据库的一条favoriteitem信息
     */
    void unfavor(Favoriteitem favoriteitem);
}
