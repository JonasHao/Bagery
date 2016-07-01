package po;

import javax.persistence.*;

/**
 * Created by 41159 on 2016/6/29.
 */
@Entity
@Table(name = "ship_information", schema = "", catalog = "bagery")
public class Address {
    private int addressId;
    private int userId;
    private String receiver;
    private String mobile;
    private String addressProvince;
    private String addressCity;
    private String addressDistrict;
    private String addressDetail;
    private User user;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ship_inf_id", nullable = false, insertable = false, updatable = false)
    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int shipInfId) {
        this.addressId = shipInfId;
    }

    @Basic
    @Column(name = "user_id", nullable = false, insertable = true, updatable = true)
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "receicer", nullable = false, insertable = true, updatable = true, length = 30)
    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    @Basic
    @Column(name = "mobile", nullable = false, insertable = true, updatable = true, length = 30)
    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    @Basic
    @Column(name = "address_province", nullable = true, insertable = true, updatable = true, length = 45)
    public String getAddressProvince() {
        return addressProvince;
    }

    public void setAddressProvince(String addressProvince) {
        this.addressProvince = addressProvince;
    }

    @Basic
    @Column(name = "address_city", nullable = true, insertable = true, updatable = true, length = 45)
    public String getAddressCity() {
        return addressCity;
    }

    public void setAddressCity(String addressCity) {
        this.addressCity = addressCity;
    }

    @Basic
    @Column(name = "address_district", nullable = true, insertable = true, updatable = true, length = 45)
    public String getAddressDistrict() {
        return addressDistrict;
    }

    public void setAddressDistrict(String addressDistrict) {
        this.addressDistrict = addressDistrict;
    }

    @Basic
    @Column(name = "address_detail", nullable = true, insertable = true, updatable = true, length = 100)
    public String getAddressDetail() {
        return addressDetail;
    }

    public void setAddressDetail(String addressDetail) {
        this.addressDetail = addressDetail;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Address address = (Address) o;

        if (addressId != address.addressId) return false;
        if (userId != address.userId) return false;
        if (receiver != null ? !receiver.equals(address.receiver) : address.receiver != null) return false;
        if (mobile != null ? !mobile.equals(address.mobile) : address.mobile != null) return false;
        if (addressProvince != null ? !addressProvince.equals(address.addressProvince) : address.addressProvince != null)
            return false;
        if (addressCity != null ? !addressCity.equals(address.addressCity) : address.addressCity != null) return false;
        if (addressDistrict != null ? !addressDistrict.equals(address.addressDistrict) : address.addressDistrict != null)
            return false;
        if (addressDetail != null ? !addressDetail.equals(address.addressDetail) : address.addressDetail != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = addressId;
        result = 31 * result + userId;
        result = 31 * result + (receiver != null ? receiver.hashCode() : 0);
        result = 31 * result + (mobile != null ? mobile.hashCode() : 0);
        result = 31 * result + (addressProvince != null ? addressProvince.hashCode() : 0);
        result = 31 * result + (addressCity != null ? addressCity.hashCode() : 0);
        result = 31 * result + (addressDistrict != null ? addressDistrict.hashCode() : 0);
        result = 31 * result + (addressDetail != null ? addressDetail.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "user_id", nullable = false, insertable = false, updatable = false)
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
