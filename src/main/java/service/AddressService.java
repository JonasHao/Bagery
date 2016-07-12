package service;


import po.Address;

public interface AddressService {
    /**
     * 新增一条收货地址
     */
    void add(Address address);
    /**
     * 修改收货地址后，更新到持久化层
     */
    void update(Address address);

    /**
     * 根据收货地址的主键获取一条收货地址记录
     */
    Address get(int addressId);

    void deleteAddress(int addressId);

    void deleteAddress(Address address);

}
