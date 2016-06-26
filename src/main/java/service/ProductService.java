package service;


import po.*;

import java.util.List;

public interface ProductService {
    /**
     * 保存一个商品对象
     */
    void addPriced(Priced priced);
    void addProduct(Product product);

    /**
     * 更改商品对象信息
     */
    void updatePriced(Priced priced);
    void updateProduct(Product product);
    /**
     * 通过productID查找商品对象
     */
    Priced findPriced(int PricedID);
    Product findProduct(int ProductID);

    /**
     * 获得全部商品列表
     */
    List<Priced>findAll();

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

    /**
     * 通过类别信息获取商品列表
     */
    List<Priced> findPricedsByProperty(List<Property> pros);
    /**
     * 通过用户ID找历史记录
     */
    List<UserPricedRecord> findHistoryRecord(int userID);
}
