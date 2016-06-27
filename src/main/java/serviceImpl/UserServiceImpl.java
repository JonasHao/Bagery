package serviceImpl;

import po.User;
import service.UserService;
import dao.Dao;

/**
 * Created by zhang on 2016/6/23.
 */
public class UserServiceImpl implements UserService {

    private Dao dao;
    private User user;
    @Override
    public User getCurrentUser() {
        return null;
    }

    @Override
    public User get(int userId) {
        return null;
    }

    @Override
    public String login(String username, String password) {
        user=(User)dao.query("from User where username=?").setParameter(0,username);
        if(user.getPassword().equals(password))
        {
            if(user.getUserGroup().equals("product_admin")){
                return "product_admin_success";
            }
            else
            {
                if(user.getUserGroup().equals("order_admin")){
                    return "order_amdin_success";
                }
                else
                    return "user_success";
            }
        }
        else return "error";
    }

    @Override
    public boolean existUsername(String username) {
        user=(User)dao.query("from User where username=?").setParameter(0,username);
        return user.equals(null);
    }

    public String getUserGroup(String username){
        user=(User)dao.query("from User where username=?").setParameter(0,username);
        return user.getUserGroup();
    }
    @Override
    public boolean existEmail(String email) {
        user=(User)dao.query("from User where email=?").setParameter(0,email);
        return user.equals(null);
    }

    @Override
    public void register(User user) {
        dao.save(user);
    }

    @Override
    public void update(User user) {

    }

    @Override
    public int checkUserGroup(int userId) {
        return 0;
    }
}
