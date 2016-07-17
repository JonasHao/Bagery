package serviceImpl;

import dao.Dao;
import dao.UserDao;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import po.Address;
import po.User;
import service.AddressService;
import service.UserService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by zhang on 2016/6/27.
 */
public class AddressServiceImpl implements AddressService {
    private Dao dao;
    private UserDao userDao;
    private Address address;
    private UserService userService;

    @Override
    public void add(Address address) {
        dao.save(address);
    }

    @Override
    public void update(Address address) {
        dao.update(address);
    }

    @Override
    public Address get(int addressId) {
        return dao.get(Address.class, addressId);
    }

    @Override
    public void deleteAddress(int addressId) {
        address = dao.get(Address.class, addressId);
        User user = userService.getCurrentUser();
        try {
            if (address != null) {
                if (user != null && user.getDefaultAddressId() == addressId) {
                    user.setDefaultAddressId(0);
                    dao.update(user);
                }
                dao.delete(address);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteAddress(Address address) {
        dao.delete(address);
    }

    @Override
    public List<Address> getAddressesOfUser(User user) {
        try {
            return userDao.getAddressesOfUser(user);
        } catch (HibernateException e) {
            return new ArrayList<>();
        }
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public void setDao(Dao dao) {
        this.dao = dao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
}
