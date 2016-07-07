package service;

import po.User;

/**
 * Created by Koche on 2016/6/21.
 * An interface of services related to User
 */
public interface UserService {
    /**
     * 获取当前已登录的用户对象
     */
    User getCurrentUser();

    /**
     * 通过用户ID获取对应的用户对象
     */
    User get(int userId);

    /**
     * 校验用户Id和密码是否匹配
     */
    String login(String username, String password);

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

    User getUserByEmial(String email);


}
