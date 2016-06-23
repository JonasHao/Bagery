package po;

import javax.persistence.*;

/**
 * Created by 41159 on 2016/6/23.
 */
@Entity
@Table(name = "user_priced_record", schema = "", catalog = "bagery")
public class UserPricedRecord {
    private int userPricedId;
    private int userId;
    private int pricedId;
    private Priced pricedByPricedId;
    private User userByUserId;

    @Id
    @Column(name = "user_priced_id", nullable = false, insertable = true, updatable = true)
    public int getUserPricedId() {
        return userPricedId;
    }

    public void setUserPricedId(int userPricedId) {
        this.userPricedId = userPricedId;
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
    @Column(name = "priced_id", nullable = false, insertable = true, updatable = true)
    public int getPricedId() {
        return pricedId;
    }

    public void setPricedId(int pricedId) {
        this.pricedId = pricedId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserPricedRecord that = (UserPricedRecord) o;

        if (userPricedId != that.userPricedId) return false;
        if (userId != that.userId) return false;
        if (pricedId != that.pricedId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userPricedId;
        result = 31 * result + userId;
        result = 31 * result + pricedId;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "priced_id", referencedColumnName = "priced_id", nullable = false)
    public Priced getPricedByPricedId() {
        return pricedByPricedId;
    }

    public void setPricedByPricedId(Priced pricedByPricedId) {
        this.pricedByPricedId = pricedByPricedId;
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
