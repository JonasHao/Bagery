package serviceImpl;

import dao.Dao;
import po.*;
import service.ProductService;

import java.util.List;


public class ProductServiceImpl implements ProductService {
    public void setDao(Dao dao) {
        this.dao = dao;
    }

    private Dao dao;

    /**
     * 保存一个商品对象
     */
    public void addPriced(Priced priced)
    {
    	dao.save(priced);
    }
    public void addProduct(Product product)
    {
    	dao.save(product);
    }
    /**
     * 更改商品对象信息
     */
    public void updatePriced(Priced priced)
    {
    	dao.update(priced);
    }
    public  void updateProduct(Product product){dao.update(product);}
    /**
     * 通过productID查找商品对象
     */
    public Priced findPriced(int PricedID){
        return dao.get(Priced.class, PricedID);
    }
    public Product findProduct(int ProductID){
        return dao.get(Product.class, ProductID);
    }

    /**
     * 获得全部商品列表
     */
    public List<Priced> findAll(){
        return dao.query("from Priced").list();
    }

    /**
     * 通过productID删除商品对象
     */
    public void deletePriced(int pricedId){
        Priced priced=dao.get(Priced.class,pricedId);
        dao.delete(priced);
    }
    public void deleteProduct(int productId){
        Product product=dao.get(Product.class,productId);
        dao.delete(product);
    }
    /**
     * 根据关键词获取商品列表
     */
    public List<Priced>findPricedsByWord(String keyword)
    {
        return dao.query("from Priced where Priced.title like '%?%'").setParameter(0,keyword).list();

    }
    /**
     * 通过商品查找商品颜色
     */
    public List<Product> findProductsByPriced(int pricedID)
    {
        return dao.query("from Product where pricedId=?").setParameter(0,pricedID).list();
    }

    /**
     * 通过类别信息获取商品列表
     */
    public List<Priced> findPricedsByProperty(List<Property> pros){
        return null;
    }
    /**
     * 通过用户ID找历史记录
     */
    public List<UserPricedRecord> findHistoryRecord(int userID)
    {
        return dao.query("from UserPricedRecord where userId=?").
                setParameter(0, userID).list();
    }



}