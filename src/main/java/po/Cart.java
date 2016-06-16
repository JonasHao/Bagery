package po;

import javax.persistence.*;
import java.util.Collection;

/**
 * Created by 41159 on 2016/6/16.
 */
@Entity
public class Cart {
    private int cartId;
    private int userId;
    private Integer total;
    private User userByUserId;
    private Collection<Cartitem> cartitemsByCartId;

    @Id
    @Column(name = "cart_id", nullable = false, insertable = true, updatable = true)
    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
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
    @Column(name = "total", nullable = true, insertable = true, updatable = true)
    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Cart cart = (Cart) o;

        if (cartId != cart.cartId) return false;
        if (userId != cart.userId) return false;
        if (total != null ? !total.equals(cart.total) : cart.total != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = cartId;
        result = 31 * result + userId;
        result = 31 * result + (total != null ? total.hashCode() : 0);
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

    @OneToMany(mappedBy = "cartByCartId")
    public Collection<Cartitem> getCartitemsByCartId() {
        return cartitemsByCartId;
    }

    public void setCartitemsByCartId(Collection<Cartitem> cartitemsByCartId) {
        this.cartitemsByCartId = cartitemsByCartId;
    }
}
