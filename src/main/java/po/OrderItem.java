package po;

import javax.persistence.*;

/**
 * Created by 41159 on 2016/6/29.
 */
@Entity
public class OrderItem {
    private int itemId;
    private int productId;
    private String productTitle;
    private int num;
    private double totalPriced;
    private int orderId;
    private Order order;
    private Product product;


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "item_id", nullable = false, insertable = false, updatable = false)
    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    @Basic
    @Column(name = "product_id", nullable = false, insertable = false, updatable = false)
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
    public double getTotalPriced() {
        totalPriced=num*product.getPriced().getSalePrice();
        return totalPriced;
    }

    public void setTotalPriced(double totalPriced) {
        this.totalPriced = totalPriced;
    }

    @Basic
    @Column(name = "order_id", nullable = false, insertable = false, updatable = false)
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

        OrderItem orderItem = (OrderItem) o;

        if (itemId != orderItem.itemId) return false;
        if (productId != orderItem.productId) return false;
        if (num != orderItem.num) return false;
        if (Double.compare(orderItem.totalPriced, totalPriced) != 0) return false;
        if (orderId != orderItem.orderId) return false;
        if (productTitle != null ? !productTitle.equals(orderItem.productTitle) : orderItem.productTitle != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = itemId;
        result = 31 * result + productId;
        result = 31 * result + (productTitle != null ? productTitle.hashCode() : 0);
        result = 31 * result + num;
        temp = Double.doubleToLongBits(totalPriced);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        result = 31 * result + orderId;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "order_id", referencedColumnName = "order_id", nullable = false)
    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    @ManyToOne
    @JoinColumn(name = "product_id", referencedColumnName = "product_id", nullable = false)
    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

}
