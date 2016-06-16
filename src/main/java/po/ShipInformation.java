package po;

import javax.persistence.*;

/**
 * Created by 41159 on 2016/6/16.
 */
@Entity
@Table(name = "ship_information", schema = "", catalog = "bagery")
public class ShipInformation {
    private int shipInfId;
    private int userId;
    private String address;
    private String receicer;
    private String mobile;
    private User userByUserId;

    @Id
    @Column(name = "ship_inf_id", nullable = false, insertable = true, updatable = true)
    public int getShipInfId() {
        return shipInfId;
    }

    public void setShipInfId(int shipInfId) {
        this.shipInfId = shipInfId;
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
    @Column(name = "address", nullable = false, insertable = true, updatable = true, length = 100)
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Basic
    @Column(name = "receicer", nullable = false, insertable = true, updatable = true, length = 30)
    public String getReceicer() {
        return receicer;
    }

    public void setReceicer(String receicer) {
        this.receicer = receicer;
    }

    @Basic
    @Column(name = "mobile", nullable = false, insertable = true, updatable = true, length = 30)
    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ShipInformation that = (ShipInformation) o;

        if (shipInfId != that.shipInfId) return false;
        if (userId != that.userId) return false;
        if (address != null ? !address.equals(that.address) : that.address != null) return false;
        if (receicer != null ? !receicer.equals(that.receicer) : that.receicer != null) return false;
        if (mobile != null ? !mobile.equals(that.mobile) : that.mobile != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = shipInfId;
        result = 31 * result + userId;
        result = 31 * result + (address != null ? address.hashCode() : 0);
        result = 31 * result + (receicer != null ? receicer.hashCode() : 0);
        result = 31 * result + (mobile != null ? mobile.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "user_id", nullable = false)
    public User getUserByUserId() {
        return userByUserId;
    }

    public void setUserByUserId(User userByUserId) {
        this.userByUserId = userByUserId;
    }
}
