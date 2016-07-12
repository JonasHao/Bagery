package serviceImpl;

import dao.Dao;
import po.Address;
import service.AddressService;

/**
 * Created by zhang on 2016/6/27.
 */
public class AddressServiceImpl implements AddressService {
    private Dao dao;
    private Address address;

    @Override
    public void add(Address address) {
        dao.save(address);
    }

    @Override
    public void update(Address address) {
        dao.update(address);
    }

    @Override
    public Address get(int addressId) {
        return dao.get(Address.class, addressId);
    }

    @Override
    public void deleteAddress(int addressId) {
        address = dao.get(Address.class, addressId);
        if (address != null)
            dao.delete(address);
    }

    @Override
    public void deleteAddress(Address address) {
        dao.delete(address);
    }


    public void setDao(Dao dao) {
        this.dao = dao;
    }
}
