package po;

import javax.persistence.*;

/**
 * Created by 41159 on 2016/6/29.
 */
@Entity
public class FavoriteItem {
    private int itemId;
    private int pricedId;
    private int userId;
    private Priced priced;
    private User user;

    @Id
    @Column(name = "item_id", nullable = false, insertable = true, updatable = true)
    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    @Basic
    @Column(name = "priced_id", nullable = false, insertable = true, updatable = true)
    public int getPricedId() {
        return pricedId;
    }

    public void setPricedId(int pricedId) {
        this.pricedId = pricedId;
    }

    @Basic
    @Column(name = "user_id", nullable = false, insertable = true, updatable = true)
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        FavoriteItem that = (FavoriteItem) o;

        if (itemId != that.itemId) return false;
        if (pricedId != that.pricedId) return false;
        if (userId != that.userId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = itemId;
        result = 31 * result + pricedId;
        result = 31 * result + userId;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "priced_id", referencedColumnName = "priced_id", nullable = false)
    public Priced getPriced() {
        return priced;
    }

    public void setPriced(Priced priced) {
        this.priced = priced;
    }

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "user_id", nullable = false)
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
