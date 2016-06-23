package po;

import javax.persistence.*;

/**
 * Created by 41159 on 2016/6/23.
 */
@Entity
public class Orderitem {
    private int itemId;
    private int productId;
    private String productTitle;
    private int num;
    private int totalPriced;
    private int orderId;
    private Orders ordersByOrderId;
    private Product productByProductId;

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
    @Column(name = "product_title", nullable = false, insertable = true, updatable = true, length = 50)
    public String getProductTitle() {
        return productTitle;
    }

    public void setProductTitle(String productTitle) {
        this.productTitle = productTitle;
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
        if (productTitle != null ? !productTitle.equals(orderitem.productTitle) : orderitem.productTitle != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = itemId;
        result = 31 * result + productId;
        result = 31 * result + (productTitle != null ? productTitle.hashCode() : 0);
        result = 31 * result + num;
        result = 31 * result + totalPriced;
        result = 31 * result + orderId;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "order_id", referencedColumnName = "order_id", nullable = false)
    public Orders getOrdersByOrderId() {
        return ordersByOrderId;
    }

    public void setOrdersByOrderId(Orders ordersByOrderId) {
        this.ordersByOrderId = ordersByOrderId;
    }

    @ManyToOne
    @JoinColumn(name = "product_id", referencedColumnName = "product_id", nullable = false)
    public Product getProductByProductId() {
        return productByProductId;
    }

    public void setProductByProductId(Product productByProductId) {
        this.productByProductId = productByProductId;
    }
}
