package action;

import com.opensymphony.xwork2.ActionSupport;
import po.Address;
import po.User;
import service.AddressService;
import service.UserService;

import java.util.Collection;
import java.util.List;

/**
 * Created by zhang on 2016/6/27.
 */
//todo: Update Address with Province, City, District and Detail
public class AddressAction extends ActionSupport {
    private UserService userService;
    private AddressService addressService;
    private Address address;
    private Collection<Address> addresses;
    private User user;

    private int shipInfId;
    private int userId;
    private String receiver;
    private String mobile;
    private String addressProvince;
    private String addressCity;
    private String addressDistrict;
    private String addressDetail;

    public String viewAddress(){
        user=userService.getCurrentUser();
        //todo: update address
        return SUCCESS;
    }

    public String addAddress(){
        user=userService.getCurrentUser();
        //todo: ����ValidatorУ��

        address=new Address();
        address.setUserId(user.getUserId());
        //todo ��ʡ����
        address.setReceiver(receiver);
        address.setMobile(mobile);
        address.setAddressProvince(addressProvince);
        address.setAddressCity(addressCity);
        address.setAddressDistrict(addressDistrict);
        address.setAddressDetail(addressDetail);

        addressService.add(address);
        return SUCCESS;
    }

    public String deleteAddress(){
        addressService.delete(addressService.get(shipInfId));
        return SUCCESS;
    }

    public String updateAddress(){
        //todo: ����ValidatorУ��
        address=addressService.get(shipInfId);

        address.setMobile(mobile);
        address.setReceiver(receiver);
        address.setAddressProvince(addressProvince);
        address.setAddressCity(addressCity);
        address.setAddressDistrict(addressDistrict);
        address.setAddressDetail(addressDetail);

        addressService.update(address);
        return SUCCESS;
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

    public int getShipInfId() {
        return shipInfId;
    }

    public void setShipInfId(int shipInfId) {
        this.shipInfId = shipInfId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Collection<Address> getAddresses() {
        return addresses;
    }

    public void setAddresses(Collection<Address> addresses) {
        this.addresses = addresses;
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
}
