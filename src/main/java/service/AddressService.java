package service;


import po.ShipInformation;
import sun.java2d.pipe.ShapeSpanIterator;

public interface AddressService {
    /**
     * 新增一条收货地址
     */
    void add(ShapeSpanIterator shapeSpanIterator);

    /**
     * 修改收货地址后，更新到持久化层
     */
    void update(ShipInformation shipInformation);

    /**
     * 根据收货地址的主键获取一条收货地址记录
     */
    ShipInformation get(int shipInfId);

}
