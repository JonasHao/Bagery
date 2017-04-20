package dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import po.*;

import java.util.List;

@SuppressWarnings("unchecked")
public class ProductDao extends Dao {
    SessionFactory sessionFactory;


    public List<Priced> all(boolean requireExist) {
        Session session = sessionFactory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        List<Priced> priceds;
        if (requireExist) {
            priceds = session.createQuery("from Priced where isExisted=1  order by pricedId DESC").list();

        } else {
            priceds = session.createQuery("from Priced order by pricedId DESC").list();

        }
        transaction.commit();
        return priceds;
    }

    public List<Product> ofPriced(int pricedID, boolean requireStock) {
        Session session = sessionFactory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        List<Product> products;
        if (requireStock) {
            products = session.createQuery("from Product where pricedId=? and stock >0 order by pricedId DESC ").setParameter(0, pricedID).list();
        } else {
            products = session.createQuery("from Product where pricedId=?  order by pricedId DESC").list();
        }
        transaction.commit();
        return products;
    }

    public List<Priced> findPricedsByWord(String keyword) {
        if (keyword == null || keyword.trim().length() == 0)
            return all(true);

        Session session = sessionFactory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        String hql = String.format("from Priced where isExisted=1 and title like '%%%%%s%%%%'", keyword);
        List<Priced> priceds = session.createQuery(hql).list();

        transaction.commit();
        return priceds;
    }

    public List<Property> ofCategory(String category) {
        Session session = sessionFactory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        List<Property> priceds = session.createQuery("from Property  where category=?").setParameter(0, category).list();
        transaction.commit();
        return priceds;
    }

    /**
     * 通过类别信息获取商品列表
     */
    public List<Integer> pricedIdOfProperty(List<Integer> propertyIds) {
        Session session = sessionFactory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        String hql = String.format("select pricedId from PricedPro where proId in %s", convertToStr(propertyIds));
        List<Integer> pricedIds = session.createQuery(hql).list();
        transaction.commit();
        return pricedIds;
    }

    /**
     * 获取过滤器对象列表
     */
    public List<PricedPro> pricedProsByPriced(int pricedID) {
        Session session = sessionFactory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        List<PricedPro> pricedPros = session.createQuery("from PricedPro where pricedId=?").setParameter(0, pricedID).list();
        transaction.commit();
        return pricedPros;
    }

    public List<Integer> findProIDsByPriced(int pricedID) {
        Session session = sessionFactory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        List<Integer> proIds = session.createQuery("select proId from PricedPro where pricedId=?").setParameter(0, pricedID).list();
        transaction.commit();
        return proIds;
    }

    public String getCategoryOfProperty(int proID) {
        Session session = sessionFactory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        List<String> category = session.createQuery("select category from Property where proId=?").setParameter(0, proID).list();
        transaction.commit();
        if (category != null && category.size() == 1) {
            return category.get(0);
        }
        return null;
    }

    public List<HistoryRecord> findHistoryRecord(int userID) {
        Session session = sessionFactory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        List<HistoryRecord> records = session.createQuery("from HistoryRecord where userId=?  order by recordDate DESC").setParameter(0, userID).list();
        transaction.commit();
        return records;
    }


    /**
     * 属性数组转SQL字符串
     */
    public String convertToStr(List<Integer> list) {
        StringBuilder sb = new StringBuilder("(");
        for (Integer i : list)
            sb.append(i).append(",");
        sb.deleteCharAt(sb.length() - 1);
        sb.append(")");
        return sb.toString();
    }

    @Override
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
