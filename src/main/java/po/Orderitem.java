package po;

import javax.persistence.*;

/**
 * Created by 41159 on 2016/6/16.
 */
@Entity
public class Orderitem {
    private int itemId;
    private int productId;
    private int num;
    private int totalPriced;
    private int orderId;
    private Order orderByOrderId;

    @Id
    @Column(name = "item_id", nullable = false, insertable = true, updatable = true)
    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    @Basic
    @Column(name = "product_id", nullable = false, insertable = true, updatable = true)
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
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
    @Column(name = "total_priced", nullable = false, insertable = true, updatable = true, precision = 0)
    public int getTotalPriced() {
        return totalPriced;
    }

    public void setTotalPriced(int totalPriced) {
        this.totalPriced = totalPriced;
    }

    @Basic
    @Column(name = "order_id", nullable = false, insertable = true, updatable = true)
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Orderitem orderitem = (Orderitem) o;

        if (itemId != orderitem.itemId) return false;
        if (productId != orderitem.productId) return false;
        if (num != orderitem.num) return false;
        if (totalPriced != orderitem.totalPriced) return false;
        if (orderId != orderitem.orderId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = itemId;
        result = 31 * result + productId;
        result = 31 * result + num;
        result = 31 * result + totalPriced;
        result = 31 * result + orderId;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "order_id", referencedColumnName = "order_id", nullable = false)
    public Order getOrderByOrderId() {
        return orderByOrderId;
    }

    public void setOrderByOrderId(Order orderByOrderId) {
        this.orderByOrderId = orderByOrderId;
    }
}
