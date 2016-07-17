package dao;

import org.hibernate.*;
import po.Address;
import po.CartItem;
import po.FavoriteItem;
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
        Query query = session.createQuery("from CartItem where userId = ?").setCacheable(false).setParameter(0, userId);
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

    public User getByUserName(String username) {
        Session session = sessionFactory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        User user = null;
        session.clear();
        Query query = session.createQuery("from User where username = ? ").setParameter(0, username);
        List<User> users = query.list();
        if (users.size() == 1) {
            user = users.get(0);
        }
        transaction.commit();
        return user;
    }

    public User getByEmail(String email) {
        Session session = sessionFactory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        User user = null;
        session.clear();
        Query query = session.createQuery("from User where email = ? ").setParameter(0, email);
        List<User> users = query.list();
        if (users.size() == 1) {
            user = users.get(0);
        }
        transaction.commit();
        return user;
    }


    public FavoriteItem favorite(int userId, int priceId) {
        Session session = sessionFactory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        FavoriteItem item = null;
        session.clear();
        Query query = session.createQuery("from FavoriteItem where userId = ? and pricedId=? ")
                .setParameter(0, userId).setParameter(1, priceId).setCacheable(false);
        List<FavoriteItem> favoriteItems = query.list();
        if (favoriteItems.size() == 1) {
            item = favoriteItems.get(0);
        }
        transaction.commit();
        return item;

    }
}
