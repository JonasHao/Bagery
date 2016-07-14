
package dao;

import org.hibernate.*;

import java.io.Serializable;
import java.util.List;

/**
 * encapsulate C(save) R(get) U(update) D(delete) operations
 */
public class Dao {
    private SessionFactory sessionFactory;

    public Serializable save(Object o) throws HibernateException {
        Session session = sessionFactory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        Serializable id = session.save(o);
        transaction.commit();
        return id;
    }

    public void saveM(List ts, String entityName) throws HibernateException {
        Session session = sessionFactory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        for (Object object : ts) {
            session.save(entityName, object);
        }
        transaction.commit();
    }


    public <T> T get(Class<T> entityType, Serializable id) throws HibernateException {
        Session session = sessionFactory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        T instance = session.get(entityType, id);
        return instance;
    }


    public Query query(String queryString) {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        return session.createQuery(queryString);
    }

    public Object update(Object o) throws HibernateException {
        Session session = sessionFactory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        session.update(o);
        transaction.commit();
        return o;
    }

    public void delete(Object o) throws HibernateException {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        session.delete(o);
        session.flush();
        session.getTransaction().commit();
    }

    public void refresh(Object o) throws HibernateException {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        session.refresh(o);
        session.flush();
        session.getTransaction().commit();
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}