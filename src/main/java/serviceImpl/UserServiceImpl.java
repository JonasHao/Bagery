package serviceImpl;

import com.opensymphony.xwork2.Action;
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

    public User getCurrentUser() {
        if (Config.DEBUG) {
            user = dao.get(User.class, 1);
            return user;
        }
        int userId = (int) ActionContext.getContext().getSession().get(Key.USER);
        user = dao.get(User.class, userId);
        return user;
    }

    public boolean isLoggedIn(){
        return (int)ActionContext.getContext().getSession().get(Key.USER)>0;
    }

    @Override
    public User get(int userId) {
        user = (User) dao.query("from User where userId=?").setParameter(0, userId).list().get(0);
        return user;
    }

    @Override
    public String login(String username, String password) {
        user = (User) dao.query("from User where username=?").setParameter(0, username).list().get(0);

        if (user.getPassword().equals(password)) {
            ActionContext.getContext().getSession().put(Key.USER, user.getUserId());
            return user.getUserGroup();
        }
        else return "input";
    }

    @Override
    @SuppressWarnings("unchecked")
    public boolean existUsername(String username) {
        userList = dao.query("from User where username=?").setParameter(0, username).list();
        return userList.size() == 1;
    }

    @SuppressWarnings("unchecked")
    public String getUserGroup(String username) {
        userList = dao.query("from User where username=?").setParameter(0, username).list();
        if (userList.size() == 1)
            return userList.get(0).getUserGroup();
        else
            return null;
    }

    @Override
    @SuppressWarnings("unchecked")
    public boolean existEmail(String email) {
        userList = dao.query("from User where email=?").setParameter(0, email).list();
        return userList.size() == 1;
    }

    @SuppressWarnings("unchecked")
    public User getUserByEmail(String email) {
        userList = dao.query("from User where email=?").setParameter(0, email).list();
        if (userList.size() != 0) {
            return userList.get(0);
        } else
            return null;
    }

    @Override
    public void register(User user) {
        int id = (int) dao.save(user);
        ActionContext.getContext().getSession().put(Key.USER, id);
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
