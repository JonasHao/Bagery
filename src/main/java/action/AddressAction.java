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
public class AddressAction extends ActionSupport {
    private UserService userService;
    private AddressService addressService;
    private Address address;
    private Collection<Address> addresses;
    private User user;

    private int shipInfId;

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

    public String getDizhi() {
        return dizhi;
    }

    public void setDizhi(String dizhi) {
        this.dizhi = dizhi;
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

    private int userId;
    private String dizhi;
    private String receiver;
    private String mobile;

    public String viewAddress(){
        user=userService.getCurrentUser();
        // todo: 分区省市区
        return SUCCESS;
    }

    public String addAddress(){
        user=userService.getCurrentUser();

        if(dizhi.equals(null)||receiver.equals(null)||mobile.equals(null))
            return INPUT;

        address=new Address();
        address.setUserId(user.getUserId());
        //todo 分省市区
        address.setReceiver(receiver);
        address.setMobile(mobile);
        addressService.add(address);
        return SUCCESS;
    }

    public String deleteAddress(){
        addressService.delete(addressService.get(shipInfId));
        return SUCCESS;
    }

    public String updateAddress(){
        if(dizhi.equals(null)||mobile.equals(null)||receiver.equals(null))
            return INPUT;

        address=addressService.get(shipInfId);
//        address.setAddress(dizhi);
        address.setMobile(mobile);
        address.setReceiver(receiver);

        addressService.update(address);
        return SUCCESS;
    }
}
