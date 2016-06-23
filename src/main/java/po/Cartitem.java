package po;

import javax.persistence.*;

/**
 * Created by 41159 on 2016/6/23.
 */
@Entity
public class Cartitem {
    private int itemId;
    private int num;
    private Integer totalPriced;
    private Cart cartByCartId;

    @Id
    @Column(name = "item_id", nullable = false, insertable = true, updatable = true)
    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    @Basic
    @Column(name = "num", nullable = false, insertable = true, updatable = true)
    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    @Basic
    @Column(name = "total_priced", nullable = true, insertable = true, updatable = true, precision = 0)
    public Integer getTotalPriced() {
        return totalPriced;
    }

    public void setTotalPriced(Integer totalPriced) {
        this.totalPriced = totalPriced;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Cartitem cartitem = (Cartitem) o;

        if (itemId != cartitem.itemId) return false;
        if (num != cartitem.num) return false;
        if (totalPriced != null ? !totalPriced.equals(cartitem.totalPriced) : cartitem.totalPriced != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = itemId;
        result = 31 * result + num;
        result = 31 * result + (totalPriced != null ? totalPriced.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "cart_id", referencedColumnName = "cart_id", nullable = false)
    public Cart getCartByCartId() {
        return cartByCartId;
    }

    public void setCartByCartId(Cart cartByCartId) {
        this.cartByCartId = cartByCartId;
    }
}
