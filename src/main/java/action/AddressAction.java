package action;

import com.opensymphony.xwork2.ActionSupport;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import po.Address;
import po.User;
import service.AddressService;
import service.UserService;

import java.util.List;

/**
 * Created by zhang on 2016/6/27.
 */
public class AddressAction extends ActionSupport {
    private UserService userService;
    private AddressService addressService;
    private Address address;
    private List<Address> addressList;
    private User user;
    private int addressId;
    private int userId;
    private String receiver;
    private String mobile;
    private String addressProvince;
    private String addressCity;
    private String addressDistrict;
    private String addressDetail;
    private Integer defaultAddressId;
    private int add;

    public String viewAddress() {
        try {
            user = userService.getCurrentUser();
            addressList = user.getAddresses();
            defaultAddressId = user.getDefaultAddressId();
            return SUCCESS;
        }
        catch (HibernateException e){
            e.printStackTrace();
            return ERROR;
        }
    }

    public String addAddress() {
        try {
            user = userService.getCurrentUser();
            address = new Address();
            address.setUserId(user.getUserId());
            address.setReceiver(receiver);
            address.setMobile(mobile);
            address.setAddressProvince(addressProvince);
            address.setAddressCity(addressCity);
            address.setAddressDistrict(addressDistrict);
            address.setAddressDetail(addressDetail);

            addressService.add(address);
//        userService.update(user);
            user = userService.getCurrentUser();
            if (user.getAddresses().size() == 1) {
                user.setDefaultAddressId(user.getAddresses().get(0).getAddressId());
                userService.update(user);
            }
            return SUCCESS;
        }
        catch(HibernateException e){
            e.printStackTrace();
            return ERROR;
        }
    }

    public String deleteAddress() {
        try {
            addressService.deleteAddress(addressId);
            return SUCCESS;
        }
        catch(HibernateException e){
            e.printStackTrace();
            return ERROR;
        }
    }

    public String updateAddress() {
        try {
            address = addressService.get(addressId);
            if (address == null) {
                return ERROR;
            }

            address.setMobile(mobile);
            address.setReceiver(receiver);
            address.setAddressProvince(addressProvince);
            address.setAddressCity(addressCity);
            address.setAddressDistrict(addressDistrict);
            address.setAddressDetail(addressDetail);

            addressService.update(address);
            return SUCCESS;
        }
        catch (HibernateException e){
            e.printStackTrace();
            return ERROR;
        }
    }

    public String setDefaultAddress(){
        try {
            user = userService.getCurrentUser();
            user.setDefaultAddressId(defaultAddressId);
            userService.update(user);
            return SUCCESS;
        }
        catch (HibernateException e){
            e.printStackTrace();
            return ERROR;
        }
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Address> getAddresses() {
        return addressList;
    }

    public void setAddresses(List<Address> addressList) {
        this.addressList = addressList;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public AddressService getAddressService() {
        return addressService;
    }

    public void setAddressService(AddressService addressService) {
        this.addressService = addressService;
    }

    public String getAddressDistrict() {
        return addressDistrict;
    }

    public void setAddressDistrict(String addressDistrict) {
        this.addressDistrict = addressDistrict;
    }

    public String getAddressProvince() {
        return addressProvince;
    }

    public void setAddressProvince(String addressProvince) {
        this.addressProvince = addressProvince;
    }

    public String getAddressCity() {
        return addressCity;
    }

    public void setAddressCity(String addressCity) {
        this.addressCity = addressCity;
    }

    public String getAddressDetail() {
        return addressDetail;
    }

    public void setAddressDetail(String addressDetail) {
        this.addressDetail = addressDetail;
    }

    public List<Address> getAddressList() {
        return addressList;
    }

    public void setAddressList(List<Address> addressList) {
        this.addressList = addressList;
    }

    public Integer getDefaultAddressId() {
        return defaultAddressId;
    }

    public void setDefaultAddressId(Integer defaultAddressId) {
        this.defaultAddressId = defaultAddressId;
    }

    public int getAdd() {
        return add;
    }

    public void setAdd(int add) {
        this.add = add;
    }
}
