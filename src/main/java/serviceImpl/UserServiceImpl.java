package serviceImpl;

import com.opensymphony.xwork2.ActionContext;
import constant.Config;
import constant.Key;
import po.User;
import service.UserService;
import dao.Dao;

import java.util.List;

/**
 * Created by zhang on 2016/6/23.
 */
public class UserServiceImpl implements UserService {

    private Dao dao;
    private User user;
    private List<User> userList;
    private int userId;
    @Override
    public User getCurrentUser() {
        if(Config.DEBUG){
            user = dao.get(User.class,1);
            return user;
        }
        user=(User)ActionContext.getContext().getSession().get(Key.USER);
        userId=user.getUserId();
        return null;
    }

    @Override
    public User get(int userId) {
        user=(User)dao.query("from User where userId=?").setParameter(0,userId).list().get(0);
        return user;
    }

    @Override
    public String login(String username, String password) {
        user=(User)dao.query("from User where username=?").setParameter(0,username).list().get(0);

        if(user.getPassword().equals(password))
        {
            ActionContext.getContext().getSession().put("User",user);
            if(user.getUserGroup().equals("product_admin")){
                return "success";
            }
            else
            {
                if(user.getUserGroup().equals("order_admin")){
                    return "success";
                }
                else
                    return "success";
            }
        }
        else return "input";
    }

    @Override
    public boolean existUsername(String username) {
        userList=dao.query("from User where username=?").setParameter(0,username).list();
        if(userList.size()==1)
            return true;
        else
            return false;
    }

    public String getUserGroup(String username){
        userList=dao.query("from User where username=?").setParameter(0,username).list();
        if(userList.size()==1)
            return userList.get(0).getUserGroup();
        else
            return null;
    }
    @Override
    public boolean existEmail(String email) {
        userList=dao.query("from User where email=?").setParameter(0,email).list();
        if(userList.size()==1)
            return true;
        else
            return false;
    }

    @Override
    public void register(User user) {
        dao.save(user);
    }

    @Override
    public void update(User user) {
        dao.update(user);
    }

    @Override
    public int checkUserGroup(int userId) {
        return 0;
    }

    public void setDao(Dao dao) {
        this.dao = dao;
    }
}
