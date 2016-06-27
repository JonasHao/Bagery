package action;

import com.opensymphony.xwork2.ActionSupport;
import po.FavoriteItem;
import po.User;
import service.FavoriteService;
import service.UserService;

import javax.faces.component.ActionSource;
import javax.swing.*;
import java.awt.*;
import java.util.List;

/**
 * Created by jinzil on 2016/6/27.
 */
public class FavoriteAction extends ActionSupport {
    private int priceId;
    private UserService userService;
    private FavoriteItem favoriteItem;
    private FavoriteService favoriteService;
    private int itemId;
    private User user;
    private List<FavoriteItem> favoriteItemList;

    public String favor() {
        user = userService.getCurrentUser();
        favoriteItem = new FavoriteItem();
        favoriteItem.setPricedId(priceId);
        favoriteItem.setUserId(user.getUserId());
        favoriteService.favar(favoriteItem);
        return SUCCESS;
    }

    public String unfavor() {
        user = userService.getCurrentUser();
        favoriteService.unfavor(itemId, user.getUserId());
        return SUCCESS;
    }

    public String queryFavorite() {
        user = userService.getCurrentUser();
        favoriteItemList = (List<FavoriteItem>) user.getFavoriteItemsByUserId();
        return SUCCESS;
    }

    @Override
    public String execute() throws Exception {
        user = userService.getCurrentUser();
        favoriteItemList = (List<FavoriteItem>) user.getFavoriteItemsByUserId();
        return SUCCESS;
    }

    public int getPriceId() {
        return priceId;
    }

    public void setPriceId(int priceId) {
        this.priceId = priceId;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }


    public List<FavoriteItem> getFavoriteItemList() {
        return favoriteItemList;
    }

    public void setFavoriteItemList(List<FavoriteItem> favoriteItemList) {
        this.favoriteItemList = favoriteItemList;
    }


    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public FavoriteItem getFavoriteItem() {
        return favoriteItem;
    }

    public void setFavoriteItem(FavoriteItem favoriteItem) {
        this.favoriteItem = favoriteItem;
    }


    public void setFavoriteService(FavoriteService favoriteService) {
        this.favoriteService = favoriteService;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
