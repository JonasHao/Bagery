package serviceImpl;

import dao.Dao;
import po.*;
import service.ProductService;

import java.util.*;

@SuppressWarnings("unchecked")
public class ProductServiceImpl implements ProductService {
    public void setDao(Dao dao) {
        this.dao = dao;
    }

    private Dao dao;

    /**
     * 保存一个商品对象
     */
    public int addPriced(Priced priced) {
        return (int)dao.save(priced);
    }

    public void addProduct(Product product) {
        dao.save(product);
    }

    public void addPricedPro(PricedPro pricedPro) {
        dao.save(pricedPro);
    }

    /**
     * 更改商品对象信息
     */
    public void updatePriced(Priced priced) {
        dao.update(priced);
    }

    public void updateProduct(Product product) {
        dao.update(product);
    }

    public void updatePricedPro(PricedPro pricedPro) {
        dao.update(pricedPro);
    }

    /**
     * 通过productID查找商品对象
     */
    public Priced findPriced(int pricedID) {
        return dao.get(Priced.class, pricedID);
    }

    public Product findProduct(int productID) {
        return dao.get(Product.class, productID);
    }

    public PricedPro findPricedPro(int pricedProID) {
        return dao.get(PricedPro.class, pricedProID);
    }
    /**
     * 获得全部商品列表
     */
    public List<Priced> findAll() {
        return dao.query("from Priced where isExisted=1").list();
    }
    public List<Priced> findAllAdmin() {
        return dao.query("from Priced").list();
    }
    /**
     * 通过productID删除商品对象
     */
    public void deletePriced(int pricedId) {
        Priced priced = dao.get(Priced.class, pricedId);
        dao.delete(priced);
    }
    public void deleteProduct(int productId) {
        Product product = dao.get(Product.class, productId);
        dao.delete(product);
    }
    /**
     * 通过商品查找商品颜色
     */
    //考虑库存
    public List<Product> findProductsByPriced(int pricedID) {
        return dao.query("from Product where pricedId=? and stock >0").setParameter(0, pricedID).list();
    }
    //不考虑库存
    public List<Product> findProductsByPricedAdmin(int pricedID) {
        return dao.query("from Product where pricedId=?").setParameter(0, pricedID).list();
    }
    /**
     * 根据关键词获取商品列表
     */
    public List<Priced> findPricedsByWord(String keyword) {
        String hql= String.format("from Priced where isExisted=1 and title like '%%%s%%'",keyword);
        return dao.query(hql).list();
    }
    //属性数组转SQL字符串
    public String convertToStr(List<Integer> list) {
        StringBuilder sb = new StringBuilder("(");
        for (Integer i : list)
            sb.append(i + ",");
        sb.deleteCharAt(sb.length() - 1);
        sb.append(")");
        return sb.toString();
    }
    /**
     * 通过类别信息获取商品列表
     */
    public List<Priced> findPricedsByProperty(List<Integer> pro1, List<Integer> pro2, List<Integer> pro3) {
//        int t1= dao.query("from Property where category='品牌'").list().size();
//        int t2=dao.query("from Property where category='材质'").list().size()+t1;
//
//        for(int i=0;i<pro2.size();i++)
//            pro2.set(i,pro2.get(i)+t1);
//        for(int i=0;i<pro3.size();i++)
//            pro3.set(i,pro3.get(i)+t2);

        List<Integer> l1=new ArrayList<>();
        if(pro1.size()>0) {
            String hql= String.format("select pricedId from PricedPro where proId in %s",convertToStr(pro1));
            l1=dao.query(hql).list();
        }
        List<Integer> l2=new ArrayList<>();
        if(pro2.size()>0) {
            String hql= String.format("select pricedId from PricedPro where proId in %s",convertToStr(pro2));
            l2=dao.query(hql).list();
        }
        List<Integer> l3=new ArrayList<>();
        if(pro3.size()>0) {
            String hql= String.format("select pricedId from PricedPro where proId in %s",convertToStr(pro3));
            l3=dao.query(hql).list();
        }

        int use;
        if(pro1.size()>0) {
            use=1;
            if (pro2.size() > 0)
                l1.retainAll(l2);
            if (pro3.size() > 0)
                l1.retainAll(l3);
        }
        else if(pro2.size()>0) {
            use=2;
            if (pro3.size() > 0)
                l2.retainAll(l3);
        }
        else if(pro3.size()>0) {
            use=3;
        }
        else use=0;

        List<Priced> priceds=null;
        switch (use){
            case 1:
                priceds=new ArrayList<>(l1.size());
                for (Integer i:l1)
                    priceds.add(findPriced(i));
                break;
            case 2:
                priceds=new ArrayList<>(l2.size());
                for (Integer i:l2)
                    priceds.add(findPriced(i));
                break;
            case 3:
                priceds=new ArrayList<>(l3.size());
                for (Integer i:l3)
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
    public List<UserPricedRecord> findHistoryRecord(int userID) {
        return dao.query("from UserPricedRecord where userId=?").
                setParameter(0, userID).list();
    }

    /**
     * 通过分类找属性列表
     */
    public List<Property> findProsByCategory(String category) {
        return dao.query("from Property where category=?").setParameter(0, category).list();
    }


    public List<PricedPro> findPricedProByPriced(int pricedID)
    {
        return dao.query("from PricedPro where pricedId=?").setParameter(0, pricedID).list();
    }

    public List<Integer> findProIDsByPriced(int pricedID)
    {
        return dao.query("select pp.proId from PricedPro pp,Property p where pp.pricedId=? and pp.proId=p.proId ").setParameter(0, pricedID).list();
    }

    public void deleteProductsByPriced(int pricedID)
    {
        List<Product> products=findProductsByPriced(pricedID);
        for(Product product:products)
            dao.delete(product);
    }
    public void deletePricedProsByPriced(int pricedID)
    {
        List<PricedPro> pps=findPricedProByPriced(pricedID);
        for(PricedPro pp :pps)
            dao.delete(pp);
    }
    //添加浏览记录
    public void addRecord(int userID,int pricedID)
    {
        UserPricedRecord record=new UserPricedRecord();
        record.setUserId(userID);
        record.setPricedId(pricedID);
        dao.save(record);
    }
    //返回属性列表名称
    public List<Map<Integer, String>> getProNames() {
        int count=1;
        int t1= dao.query("from Property where category='品牌'").list().size();
        int t2=dao.query("from Property where category='材质'").list().size()+t1;
        int t3=dao.query("from Property where category='款式'").list().size()+t2;

        List<Map<Integer,String>> al=new ArrayList<Map<Integer,String>>(3);

        Map<Integer,String> m1=new HashMap<>();
        while(count<=t1) {
            String s= (String) dao.query("select description from Property where proId=?").setParameter(0,count).list().get(0);
            m1.put(count++, s);
        }
        Map<Integer,String> m2=new HashMap<>();
        while(count<=t2) {
            String s= (String) dao.query("select description from Property where proId=?").setParameter(0,count).list().get(0);
            m2.put(count++, s);
        }
        Map<Integer,String> m3=new HashMap<>();
        while(count<=t3) {
            String s= (String) dao.query("select description from Property where proId=?").setParameter(0,count).list().get(0);
            m3.put(count++, s);
        }

        al.add(m1);
        al.add(m2);
        al.add(m3);
        return al;
    }
    //
    public Property getPro(int proID)
    {
        return (Property) dao.query("from Property where proId=?").setParameter(0,proID).list().get(0);
    }
    //
    public String getProByProID(int proID)
    {
        return (String) dao.query("select category from Property where proId=?").setParameter(0,proID).list().get(0);
    }
    //
    public List<List<Property>> getPross(){
        List<List<Property>> pross=new ArrayList<List<Property>>();
        pross.add(findProsByCategory("品牌"));
        pross.add(findProsByCategory("材质"));
        pross.add(findProsByCategory("款式"));
        return pross;
    }

}