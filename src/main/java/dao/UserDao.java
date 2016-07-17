package dao;

import org.hibernate.*;
import po.Address;
import po.CartItem;
import po.User;

import java.util.List;

@SuppressWarnings("unchecked")
public class UserDao extends Dao {
    SessionFactory sessionFactory;


    public List<Address> getAddressesOfUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createQuery("from Address where userId = ?").setParameter(0, user.getUserId());
        List<Address> addresses = query.list();
        transaction.commit();
        return addresses;
    }

    @Override
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public List<CartItem> getCartItemsByUserId(int userId) {
        Session session = sessionFactory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        session.clear();
        Query query = session.createQuery("from CartItem where userId = ?").setParameter(0, userId);
        List<CartItem> cartItems = query.list();
        transaction.commit();
        return cartItems;
    }

    public Address getDefaultAddress(int userId) {
        Address address = null;
        Session session = sessionFactory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        session.clear();
        Query query = session.createQuery("from Address where addressId = (select defaultAddressId from User where userId = ?) ").setParameter(0, userId);
        List<Address> addresses = query.list();
        if (addresses.size() == 1) {
            address = addresses.get(0);
        }
        transaction.commit();
        return address;
    }
}
