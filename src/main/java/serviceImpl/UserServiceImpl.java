package serviceImpl;

import com.opensymphony.xwork2.ActionContext;
import constant.Config;
import constant.Key;
import dao.UserDao;
import po.Address;
import po.CartItem;
import po.HistoryRecord;
import po.User;
import service.UserService;
import dao.Dao;

import java.security.NoSuchAlgorithmException;
import java.util.List;

public class UserServiceImpl implements UserService {
    private Dao dao;
    private UserDao userDao;
    private User user;
    private List<User> userList;

    public User getCurrentUser() {
        if (Config.DEBUG) {
            user = dao.get(User.class, 1);
            return user;
        }
        Integer userId = (Integer) ActionContext.getContext().getSession().get(Key.USER);
        if (userId != null) {
            User user = dao.get(User.class, userId);
            return user;
        }
        return null;
    }

    public boolean isLoggedIn() {
        return (int) ActionContext.getContext().getSession().get(Key.USER) > 0;
    }

    @Override
    public User get(int userId) {
        user = dao.get(User.class, userId);
        return user;
    }

    @Override
    public User login(String username, String password) {

        user = userDao.getByUserName(username);

        if (user.getPassword().equals(password)) {
            ActionContext.getContext().getSession().put(Key.USER, user.getUserId());
            return user;
        }

        return null;
    }

    @Override
    @SuppressWarnings("unchecked")
    public boolean existUsername(String username) {
        User user = userDao.getByUserName(username);
        return user != null;
    }

    @SuppressWarnings("unchecked")
    public String getUserGroup(String username) {
        user = userDao.getByUserName(username);
        if (user != null)
            return user.getUserGroup();
        else
            return null;
    }

    @Override
    @SuppressWarnings("unchecked")
    public boolean existEmail(String email) {
        user = userDao.getByEmail(email);
        return user != null;
    }

    @SuppressWarnings("unchecked")
    public User getUserByEmail(String email) {
        return userDao.getByEmail(email);
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

    public String getMD5(byte[] source) {
        String s = null;
        char hexDigits[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
        try {
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
            md.update(source);
            byte tmp[] = md.digest();
            char str[] = new char[16 * 2];
            int k = 0;
            for (int i = 0; i < 16; i++) {
                byte byte0 = tmp[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            s = new String(str);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return s;
    }

    @Override
    public void removeHistory(int historyId) {
        HistoryRecord record = dao.get(HistoryRecord.class, historyId);
        dao.delete(record);
    }

    @Override
    public void refresh(User user) {
        dao.refresh(user);
    }

    @Override
    public List<CartItem> getCartItems(int userId) {
        return userDao.getCartItemsByUserId(userId);
    }

    @Override
    public Address getDefaultAddress(User user) {
        return userDao.getDefaultAddress(user.getUserId());
    }

    @Override
    public int checkUserGroup(int userId) {
        return 0;
    }

    public void setDao(Dao dao) {
        this.dao = dao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    public static void main(String[] args){
        System.out.println(new UserServiceImpl().getMD5("12345678".getBytes()));
    }
}
