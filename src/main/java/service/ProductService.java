package service;


import po.Priced;
import po.Product;
import po.Property;

import java.util.List;

public interface ProductService {
    /**
     * 保存一个商品对象
     */
    void save(Product product);

    /**
     * 更改商品对象信息
     */
    void update(Product product);

    /**
     * 通过productID查找商品对象
     */
    Product find(int productId);

    /**
     * 获得全部商品列表
     */
    List<Priced>findAll();

    /**
     * 通过productID删除商品对象
     */
    void delete(int productId);

    /**
     * 根据关键词获取商品列表
     */
    List<Priced>findPricedsByWord(String keyword);

    /**
     * 通过商品查找商品颜色
     */
    List<Product> findProductsByPriced(int productID);

    /**
     * 通过类别信息获取商品列表
     */
    List<Priced> findPricedsByProperty(List<Property> pros);

}
