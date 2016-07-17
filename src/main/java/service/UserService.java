package service;

import po.Address;
import po.CartItem;
import po.User;

import java.util.List;

/**
 * Created by Koche on 2016/6/21.
 * An interface of services related to User
 */
public interface UserService {
    /**
     * 获取当前已登录的用户对象
     */
    User getCurrentUser();

    boolean isLoggedIn();
    /**
     * 通过用户ID获取对应的用户对象
     */
    User get(int userId);

    /**
     * 校验用户Id和密码是否匹配
     */
    User login(String username, String password);

    boolean existUsername(String username);

    boolean existEmail(String email);

    String getUserGroup(String username);

    /**
     * 注册一个用户，注册之前应先校验用户名是否重复
     */
    void register(User user);

    /**
     * 更新user到持久化层
     */
    void update(User user);

    /**
     * 查看用户所在组
     */
    int checkUserGroup(int userId);

    User getUserByEmail(String email);

    String getMD5(byte[] source);


    void removeHistory(int historyId);

    void refresh(User user);

    List<CartItem> getCartItems(int userId);

    Address getDefaultAddress(User user);
}
