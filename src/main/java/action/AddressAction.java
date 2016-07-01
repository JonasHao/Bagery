package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import po.Address;
import po.User;
import service.AddressService;
import service.UserService;

import java.util.List;

/**
 * Created by zhang on 2016/6/27.
 */
//todo: Update Address with Province, City, District and Detail
public class AddressAction extends ActionSupport {
    private UserService userService;
    private AddressService addressService;
    private Address address;
    private List<Address> addressList;

    private int addressId;

    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }

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
        addressList=user.getAddresses();
        return SUCCESS;
    }

    public String addAddress(){
        user=userService.getCurrentUser();
        //todo: ����ValidatorУ��
//        user= (User)ActionContext.getContext().getSession().get("User");

        address=new Address();
        address.setUserId(1);
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
        addressService.delete(addressService.get(addressId));
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
}
