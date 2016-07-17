package dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import po.Comment;
import po.Order;
import po.OrderItem;
import po.User;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;

@SuppressWarnings("unchecked")
public class OrderDao extends Dao {
    private SessionFactory sessionFactory;

    public void saveOrder(Order order, Collection<OrderItem> orderItems) {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        int pk = (int) session.save(order);

        for (OrderItem item : orderItems) {
            item.setOrderId(pk);
            session.save(item);
        }
        session.getTransaction().commit();
    }

    @Override
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public List<Order> all() {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        List<Order> orders = session.createQuery("from Order ").setCacheable(false).list();
        session.getTransaction().commit();
        return orders;
    }

    public List<Order> getStatusOf(String orderStatus) {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        List<Order> orders = session.createQuery("from Order where orderStatus = ?").setParameter(0, orderStatus).setCacheable(false).list();
        session.getTransaction().commit();
        return orders;
    }

    public List<Order> getOrdersOfUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        List<Order> orders = session.createQuery("from Order where userId = ?").setParameter(0, user.getUserId()).setCacheable(false).list();
        session.getTransaction().commit();
        return orders;
    }

    public Comment commentByPricedIdAndOrderId(int pricedId, int orderId) {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        List<Comment> comments = session.createQuery("from Comment where pricedId=? and orderId=?")
                .setParameter(0, pricedId).setParameter(1, orderId).setCacheable(false).list();
        session.getTransaction().commit();
        if (comments == null || comments.size() != 1) {
            return null;
        }
        return comments.get(0);
    }

    public List<Comment> commentByPricedId(int pricedId) {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        List<Comment> comments = session.createQuery("from Comment where pricedId=?")
                .setParameter(0, pricedId).setCacheable(false).list();
        session.getTransaction().commit();
        return comments;
    }

    public Order getByID(int orderId) {
        Session session = sessionFactory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        List<Order> orders = session.createQuery("from Order where orderId=?")
                .setParameter(0, orderId).setCacheable(false).list();
        transaction.commit();
        return orders.get(0);
    }
}
