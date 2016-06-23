package service;


import po.Order;

public interface OrderService {
    /**
     * 创建订单
     */
    void add(Order order);

    /**
     * 查询订单
     */
    Order get(int orderId);

    /**
     * 删除订单
     */
    void delete(int orderId);

    /**
     * 发货，填写物流单号和物流公司
     */
    void sendPackage(int orderId, String logisticsNum, String logisticsCompany);

    /**
     * 获取订单的物流信息
     */
    String getLogiticsStatus(int orderId);

}
