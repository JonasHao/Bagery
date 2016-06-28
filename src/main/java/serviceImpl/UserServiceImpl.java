package serviceImpl;

import com.opensymphony.xwork2.ActionContext;
import constant.Config;
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
        if(Config.DEBUG){
            User user = new User();
            user.setUserId(1);
            user.setUsername("Bagery");
            return user;
        }
        return null;
    }

    @Override
    public User get(int userId) {
        return null;
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
