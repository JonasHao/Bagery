package service;


import po.Comment;
import po.Order;

import java.util.List;

public interface OrderService {
    /**
     * 创建订单
     */
    void addOrder(Order order, List<Integer> cartItemIdList);

    /**
     * 查询订单
     */
    Order getByOrderId(int orderId);

    /**
     * 在数据库中更新comment信息
     */
    void updateOrder(Order order);

    /**
     * 删除订单
     */
    void deleteOrder(int orderId);

    /**
     * 发货，填写物流单号和物流公司
     */
    void sendPackage(int orderId, String logisticsNum, String logisticsCompany);

    /**
     * 获取订单的物流信息
     */
    String getLogisticsStatus(int orderId);



}
