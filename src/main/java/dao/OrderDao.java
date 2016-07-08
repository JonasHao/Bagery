package dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import po.Order;
import po.OrderItem;

import java.util.Collection;

/**
 * Created by Koche on 2016/7/8.
 */
public class OrderDao extends Dao {
    private SessionFactory sessionFactory;

    public void saveOrder(Order order, Collection<OrderItem> orderItems) {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        int pk = (int)session.save(order);
        for (OrderItem orderItem : orderItems) {
            orderItem.setOrderId(pk);
            session.save(orderItem);
        }
        session.getTransaction().commit();
    }

    @Override
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
