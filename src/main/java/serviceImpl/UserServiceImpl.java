package serviceImpl;

import po.User;
import service.UserService;

/**
 * Created by zhang on 2016/6/23.
 */
public class UserServiceImpl implements UserService {

    @Override
    public User getCurrentUser() {
        return null;
    }

    @Override
    public User getByUserId(int userId) {
        return null;
    }

    @Override
    public boolean login(int userId, String password) {
        return false;
    }

    @Override
    public User register(User user) {
        return null;
    }

    @Override
    public void update(User user) {

    }

    @Override
    public int checkUserGroup(int userId) {
        return 0;
    }
}
