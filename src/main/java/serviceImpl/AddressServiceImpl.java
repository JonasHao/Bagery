package serviceImpl;

import dao.Dao;
import po.Address;
import service.AddressService;

/**
 * Created by zhang on 2016/6/27.
 */
public class AddressServiceImpl implements AddressService {
    private Dao dao;
    @Override
    public void add(Address address) {
        dao.save(address);
    }

    @Override
    public void update(Address address) {
        dao.update(address);
    }

    @Override
    public Address get(int shipInfId) {
        return (Address)dao.query("from ShipInformation where shipInfId=?").setParameter(0,shipInfId).list().get(0);
    }

    @Override
    public void delete(Address address) {
        dao.delete(address);
    }


    public void setDao(Dao dao) {
        this.dao = dao;
    }
}
