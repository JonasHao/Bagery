package po;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by 41159 on 2016/6/29.
 */
@Entity
@Table(name = "user_priced_record", schema = "bagery", catalog = "")
public class HistoryRecord {
    private int userPricedId;
    private int userId;
    private int pricedId;
    private Timestamp recordDate;
    private Priced priced;
    private User user;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_priced_id", nullable = false)
    public int getUserPricedId() {
        return userPricedId;
    }

    public void setUserPricedId(int userPricedId) {
        this.userPricedId = userPricedId;
    }

    @Basic
    @Column(name = "user_id", nullable = false)
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "priced_id", nullable = false)
    public int getPricedId() {
        return pricedId;
    }

    public void setPricedId(int pricedId) {
        this.pricedId = pricedId;
    }

    @Basic
    @Column(name = "record_date", nullable = false)
    public Timestamp getRecordDate() {
        return recordDate;
    }

    public void setRecordDate(Timestamp recordDate) {
        this.recordDate = recordDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        HistoryRecord record = (HistoryRecord) o;

        if (userPricedId != record.userPricedId) return false;
        if (userId != record.userId) return false;
        if (pricedId != record.pricedId) return false;
        if (recordDate != null ? !recordDate.equals(record.recordDate) : record.recordDate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userPricedId;
        result = 31 * result + userId;
        result = 31 * result + pricedId;
        result = 31 * result + (recordDate != null ? recordDate.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "priced_id", referencedColumnName = "priced_id", nullable = false, insertable = false, updatable = false)
    public Priced getPriced() {
        return priced;
    }

    public void setPriced(Priced pricedByPricedId) {
        this.priced = pricedByPricedId;
    }

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "user_id", nullable = false, insertable = false, updatable = false)
    public User getUser() {
        return user;
    }

    public void setUser(User userByUserId) {
        this.user = userByUserId;
    }
}
