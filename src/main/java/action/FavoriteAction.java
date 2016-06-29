package action;

import com.opensymphony.xwork2.ActionSupport;
import constant.Config;
import org.hibernate.HibernateException;
import po.FavoriteItem;
import po.Priced;
import po.User;
import service.FavoriteService;
import service.UserService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static constant.Key.RESULT;

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
    private List<FavoriteItem> favoriteItemList=new ArrayList<FavoriteItem>();

    private Map<String,Object> data=new HashMap<>();

    /**
     * 异步加载的action
     */
    public String favor() {
        try {
            user = userService.getCurrentUser();
            favoriteItem = new FavoriteItem();
            favoriteItem.setPricedId(priceId);
            favoriteItem.setUserId(user.getUserId());
            favoriteService.favar(favoriteItem);
            data.put(RESULT, SUCCESS);
        }catch( HibernateException  e){
            if(Config.DEBUG) {
                data.put(RESULT, SUCCESS);
            } else {
                data.put(RESULT, ERROR);
            }
        }
        return SUCCESS;
    }

    public String unfavor() {
        try {
            user = userService.getCurrentUser();
            favoriteService.unfavor(itemId, user.getUserId());
            data.put(RESULT, SUCCESS);
        } catch (HibernateException e) {
            if (Config.DEBUG) {
                data.put(RESULT, SUCCESS);
            } else {
                data.put(RESULT, ERROR);
            }
        }
        return SUCCESS;
    }

    public String queryFavorite() {
//        user = userService.getCurrentUser();
//        favoriteItemList = (List<FavoriteItem>) user.getFavoriteItemsByUserId();
        FavoriteItem item = new FavoriteItem();
        item.setItemId(1);
        Priced priced = new Priced();
        priced.setTitle("TITLE TEST");
        priced.setUnitPrice(999);
        item.setPriced(priced);
        item.setPricedId(1);

        FavoriteItem favoriteItem1 = new FavoriteItem();
        favoriteItem1.setItemId(1);
        Priced P2 = new Priced();
        P2.setTitle("TITLE TEST2");
        P2.setUnitPrice(999);
        favoriteItem1.setPricedId(2);
        favoriteItem1.setPriced(P2);


        favoriteItemList.add(item);
        favoriteItemList.add(favoriteItem1);
        return SUCCESS;
    }

    @Override
    public String execute() throws Exception {
        user = userService.getCurrentUser();
        favoriteItemList = (List<FavoriteItem>) user.getFavoriteItems();
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

    public Map<String, Object> getData() {
        return data;
    }

    public void setData(Map<String, Object> data) {
        this.data = data;
    }
}
