package service;


import po.*;
import java.util.List;


public interface ProductService {
    /**
     * 保存一个商品对象
     */
     int addPriced(Priced priced);

     void addProduct(Product product);

     void addPricedPro(PricedPro pricedPro);
    /**
     * 添加浏览记录
     */
     void addRecord(int userID, int pricedID);
    /**
     * 更改商品对象信息
     */
     void updatePriced(Priced priced);

     void updatePricedPro(PricedPro pricedPro);
    /**
     * 通过pricedID查找商品对象
     */
     Priced findPriced(int pricedID);
    /**
     * 获得全部商品列表
     */
     List<Priced> findAll();

     List<Priced> findAllAdmin();
    /**
     * 通过商品查找商品颜色
     */
     List<Product> findProductsByPriced(int pricedID);

     List<Product> findProductsByPricedAdmin(int pricedID);
    /**
     * 根据关键词获取商品列表
     */
     List<Priced> findPricedsByWord(String keyword);
    /**
     * 通过分类找属性列表
     */
     List<Property> findProsByCategory(String category);
    /**
     * 获取过滤器对象列表
     */
     List<PricedPro> findPricedProByPriced(int pricedID);
    /**
     * 获取过滤器属性ID列表
     */
     List<Integer> findProIDsByPriced(int pricedID);
    /**
     * 通过类别信息获取商品列表
     */
     List<Priced> findPricedsByProperty(List<Integer> pro1, List<Integer> pro2, List<Integer> pro3);

    /**
     * 通过用户ID找历史记录
     */
     List<UserPricedRecord> findHistoryRecord(int userID);
    /**
     * 获取过滤器名称
     */
     String getProByProID(int proID);
    /**
     * 获取过滤器对象列表
     */
     List<List<Property>> getPross();
    /**
     * 删除priced对应全部商品
     */
     List<Product> deleteProductsByPriced(int pricedID);
    /**
     * 通过priceID删除商品对象
     */
     void deletePriced(int pricedId);
    /**
     * 属性数组转SQL字符串
     */
     String convertToStr(List<Integer> list);

    //List<Map<Integer,String>> getProNames();
    //List<List<Map<String,String>>> getProNames();
}
