package service;


import po.*;

import java.util.List;
import java.util.Map;

public interface ProductService {
    /**
     * 保存一个商品对象
     */
    int addPriced(Priced priced);
    void addProduct(Product product);
    void addPricedPro(PricedPro pricedPro);

    /**
     * 更改商品对象信息
     */
    void updatePriced(Priced priced);
    void updateProduct(Product product);
    void updatePricedPro(PricedPro pricedPro);
    /**
     * 通过productID查找商品对象
     */
    Priced findPriced(int PricedID);
    Product findProduct(int ProductID);
    PricedPro findPricedPro(int pricedProID);

    /**
     * 获得全部商品列表
     */
    List<Priced>findAll();
    List<Priced> findAllAdmin();
    /**
     * 通过productID删除商品对象
     */
    void deletePriced(int pricedId);
    void deleteProduct(int productId);
    /**
     * 根据关键词获取商品列表
     */
    List<Priced>findPricedsByWord(String keyword);

    /**
     * 通过商品查找商品颜色
     */
    List<Product> findProductsByPriced(int pricedID);
    List<Product> findProductsByPricedAdmin(int pricedID);
    /**
     * 通过类别信息获取商品列表
     */
    List<Priced> findPricedsByProperty(List<Integer> pro1,List<Integer> pro2,List<Integer> pro3);
    /**
     * 通过用户ID找历史记录
     */
    List<UserPricedRecord> findHistoryRecord(int userID);

    List<Property> findProsByCategory(String category);

    List<Integer> findProIDsByPriced(int pricedID);
    void deleteProductsByPriced(int pricedID);
    void deletePricedProsByPriced(int pricedID);
    void addRecord(int userID,int pricedID);

    //List<Map<Integer,String>> getProNames();
    //List<List<Map<String,String>>> getProNames();

    String getProByProID(int proID);
    List<List<Property>> getPross();
}
