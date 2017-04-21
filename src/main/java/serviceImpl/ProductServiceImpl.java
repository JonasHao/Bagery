package serviceImpl;

import dao.Dao;
import dao.ProductDao;
import po.*;
import service.ProductService;

import java.util.*;

@SuppressWarnings("unchecked")
public class ProductServiceImpl implements ProductService {
    private Dao dao;
    private ProductDao productDao;

    public void setDao(Dao dao) {
        this.dao = dao;
    }

    /**
     * 保存一个商品对象
     */
    public Product findProduct(int productId) {
        return dao.get(Product.class, productId);
    }

    public int addPriced(Priced priced) {
        return (int) dao.save(priced);
    }

    public void addProduct(Product product) {
        dao.save(product);
    }

    public void addPricedPro(PricedPro pricedPro) {
        dao.save(pricedPro);
    }

    /**
     * 添加浏览记录
     */
    public void addRecord(int userID, int pricedID) {
        HistoryRecord record = new HistoryRecord();
        record.setUserId(userID);
        record.setPricedId(pricedID);
        dao.save(record);
    }

    /**
     * 更改商品对象信息
     */
    public void updatePriced(Priced priced) {
        dao.update(priced);
    }

    public void updatePricedPro(PricedPro pricedPro) {
        dao.update(pricedPro);
    }

    /**
     * 通过pricedID查找商品对象
     */
    public Priced findPriced(int pricedID) {
        return dao.get(Priced.class, pricedID);
    }

    /**
     * 获得全部商品列表
     */
    public List<Priced> findAll() {
        return productDao.all(true);
    }

    public List<Priced> findAllAdmin() {
        return productDao.all(false);
    }

    /**
     * 通过商品查找商品颜色
     */
    public List<Product> findProductsByPriced(int pricedID) {
        return productDao.ofPriced(pricedID, true);
    }

    public List<Product> findProductsByPricedAdmin(int pricedID) {
        return productDao.ofPriced(pricedID, false);
    }

    /**
     * 根据关键词获取商品列表
     */
    public List<Priced> findPricedsByWord(String keyword) {
        return productDao.findPricedsByWord(keyword);
    }

    /**
     * 通过分类找属性列表
     */
    public List<Property> findProsByCategory(String category) {
        int start = 0;
        int end = 0;
        switch (category) {
            case "品牌":
                start = 1;
                end = 13;
                break;
            case "材质":
                start = 14;
                end = 23;
                break;
            case "款式":
                start = 24;
                end = 100;
        }


        List<Property> properties = productDao.ofCategory(category);

        return properties;
    }

    /**
     * 获取过滤器对象列表
     */
    public List<PricedPro> findPricedProByPriced(int pricedID) {
        return productDao.pricedProsByPriced(pricedID);
    }

    /**
     * 获取过滤器属性ID列表
     */
    public List<Integer> findProIDsByPriced(int pricedID) {
        return productDao.findProIDsByPriced(pricedID);
    }

    /**
     * 通过类别信息获取商品列表
     */
    public List<Priced> findPricedsByProperty(List<Integer> pro1, List<Integer> pro2, List<Integer> pro3) {
        List<Integer> l1 = new ArrayList<>();
        if (pro1.size() > 0) {
            l1 = productDao.pricedIdOfProperty(pro1);
        }
        List<Integer> l2 = new ArrayList<>();
        if (pro2.size() > 0) {
            l2 = productDao.pricedIdOfProperty(pro2);
        }
        List<Integer> l3 = new ArrayList<>();
        if (pro3.size() > 0) {
            l3 = productDao.pricedIdOfProperty(pro3);
        }

        int use;
        if (pro1.size() > 0) {
            use = 1;
            if (pro2.size() > 0)
                l1.retainAll(l2);
            if (pro3.size() > 0)
                l1.retainAll(l3);
        } else if (pro2.size() > 0) {
            use = 2;
            if (pro3.size() > 0)
                l2.retainAll(l3);
        } else if (pro3.size() > 0) {
            use = 3;
        } else use = 0;

        List<Priced> priceds = null;
        switch (use) {
            case 1:
                priceds = new ArrayList<>(l1.size());
                for (Integer i : l1)
                    priceds.add(findPriced(i));
                break;
            case 2:
                priceds = new ArrayList<>(l2.size());
                for (Integer i : l2)
                    priceds.add(findPriced(i));
                break;
            case 3:
                priceds = new ArrayList<>(l3.size());
                for (Integer i : l3)
                    priceds.add(findPriced(i));
                break;
            case 0:
                return findAll();
        }
        return priceds;
    }

    /**
     * 通过用户ID找历史记录
     */
    public List<HistoryRecord> findHistoryRecord(int userID) {
        return productDao.findHistoryRecord(userID);
    }

    /**
     * 获取过滤器名称
     */
    public String getCategoryOfProperty(int proID) {
        return productDao.getCategoryOfProperty(proID);
    }

    /**
     * 获取过滤器对象列表
     */
    public List<List<Property>> getPross() {
        List<List<Property>> pross = new ArrayList<>();
        pross.add(findProsByCategory("品牌"));
        pross.add(findProsByCategory("材质"));
        pross.add(findProsByCategory("款式"));
        return pross;
    }

    /**
     * 删除priced对应全部商品
     */
    public List<Product> deleteProductsByPriced(int pricedID) {
        List<Product> products = findProductsByPricedAdmin(pricedID);
        for (Product product : products)
            dao.delete(product);
        return products;
    }

    /**
     * 通过priceID删除商品对象
     */
    public void deletePriced(int pricedId) {
        Priced priced = dao.get(Priced.class, pricedId);
        dao.delete(priced);
    }


        /*
    //返回属性列表名称
    public List<Map<String, String>> getProNames() {
        int count=1;
        int t1 = dao.query("from Property where category='品牌'").list().size();
        int t2 = dao.query("from Property where category='材质'").list().size()+t1;
        int t3 = dao.query("from Property where category='款式'").list().size()+t2;

        List<Map<String,String>> al=new ArrayList<>(3);

        Map<String,String> m1=new HashMap<>();
        while(count<=t1) {
            String s= (String) dao.query("select description from Property where proId=?").setParameter(0,count).list().get(0);
            count++;
            m1.put(String.valueOf(count), s);
        }
        Map<String,String> m2=new HashMap<>();
        while(count<=t2) {
            String s= (String) dao.query("select description from Property where proId=?").setParameter(0,count).list().get(0);
            count++;
            m2.put(String.valueOf(count), s);
        }
        Map<String,String> m3=new HashMap<>();
        while(count<=t3) {
            String s= (String) dao.query("select description from Property where proId=?").setParameter(0,count).list().get(0);
            count++;
            m3.put(String.valueOf(count), s);
        }

        al.add(m1);
        al.add(m2);
        al.add(m3);
        return al;
    }

    public List<List<Map<String, String>>> getProNames() {
        int count=1;
        int t1 = dao.query("from Property where category='品牌'").list().size();
        int t2 = dao.query("from Property where category='材质'").list().size()+t1;
        int t3 = dao.query("from Property where category='款式'").list().size()+t2;

        List<List<Map<String, String>>> al=new ArrayList<List<Map<String, String>>>(3);

        List<Map<String, String>> l1=new ArrayList<Map<String, String>>();
        List<Map<String, String>> l2=new ArrayList<Map<String, String>>();
        List<Map<String, String>> l3=new ArrayList<Map<String, String>>();

        while(count<=t1) {
            String s= (String) dao.query("select description from Property where proId=?").setParameter(0,count).list().get(0);
            Map<String,String> m1=new HashMap<>();
            m1.put("key",String.valueOf(count++));
            m1.put("value", s);
            l1.add(m1);
        }
        while(count<=t2) {
            String s= (String) dao.query("select description from Property where proId=?").setParameter(0,count).list().get(0);
            Map<String,String> m1=new HashMap<>();
            m1.put("key",String.valueOf(count++));
            m1.put("value", s);
            l2.add(m1);
        }
        while(count<=t3) {
            String s= (String) dao.query("select description from Property where proId=?").setParameter(0,count).list().get(0);
            Map<String,String> m1=new HashMap<>();
            m1.put("key",String.valueOf(count++));
            m1.put("value", s);
            l3.add(m1);
        }

        al.add(l1);
        al.add(l2);
        al.add(l3);
        return al;
    }
        */

    public void setProductDao(ProductDao productDao) {
        this.productDao = productDao;
    }
}