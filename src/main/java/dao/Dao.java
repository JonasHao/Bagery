package dao;

import org.hibernate.*;

import java.io.Serializable;
import java.util.List;

public class Dao {
    private SessionFactory sessionFactory;
    private Session session;

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
        try {
            for (Object object : ts) {
                session.save(entityName, object);
            }
            transaction.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            transaction.rollback();
        }
    }

    public <T> T get(Class<T> entityType, Serializable id, boolean isInit) throws HibernateException {
        session = sessionFactory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        T instance = session.get(entityType, id);
        int repeat = 0;
        while (instance == null && repeat < 3) {
            try {
                session.clear();
                instance = session.get(entityType, id);
                repeat++;
            } catch (HibernateException e) {
                e.printStackTrace();
            }
        }

        if (isInit) {
            Hibernate.initialize(instance);
        }

        return instance;
    }

    public <T> T get(Class<T> entityType, Serializable id) throws HibernateException {
        return get(entityType, id, false);
    }

    public Query query(String queryString) {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        return session.createQuery(queryString);
    }

    public SQLQuery SQLQuery(String sql) {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        return session.createSQLQuery(sql);
    }

    public Object update(Object o) throws HibernateException {
        Session session = this.sessionFactory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        session.update(o);
        transaction.commit();
        return o;
    }

    public void updateM(List ts, String entityName) {
        Session session = sessionFactory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        try {
            for (Object object : ts) {
                session.update(entityName, object);
            }
            transaction.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            transaction.rollback();
        }
    }

    public void delete(Object o) throws HibernateException {
        if (o == null) {
            return;
        }
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        session.delete(o);
        session.getTransaction().commit();
    }

    public void refresh(Object o) throws HibernateException {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        session.refresh(o);
        Hibernate.initialize(o);
        session.flush();
        session.getTransaction().commit();
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Session getSession() {
        return session;
    }

}