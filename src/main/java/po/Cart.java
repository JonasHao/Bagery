package po;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by 41159 on 2016/6/23.
 */
@Entity
public class Cart {
    private int cartId;
    private Integer total;

    @Id
    @Column(name = "cart_id", nullable = false, insertable = true, updatable = true)
    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
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
        if (total != null ? !total.equals(cart.total) : cart.total != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = cartId;
        result = 31 * result + (total != null ? total.hashCode() : 0);
        return result;
    }
}
