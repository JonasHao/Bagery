package service;

import org.hibernate.HibernateException;
import po.Order;

import java.util.List;

public interface OrderService {
    /**
     * 创建订单
     */
    void addOrder(Order order, List<Integer> cartItemIdList) throws HibernateException;

    /**
     * 查询订单
     */
    Order getByOrderId(int orderId) throws HibernateException;

    List<Order> getAll() throws HibernateException;

    /**
     * 更新订单
     */
    void updateOrder(Order order) throws HibernateException;

    /**
     * 删除订单
     */
    void deleteOrder(Order order) throws HibernateException;

    /**
     * 发货，填写物流单号和物流公司
     */
    void sendPackage(int orderId, String logisticsNum, String logisticsCompany) throws HibernateException;

    /**
     * 获取订单的物流信息
     */
    String getLogisticsStatus(int orderId);


}
