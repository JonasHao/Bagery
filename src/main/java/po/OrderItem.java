package po;

import javax.persistence.*;

/**
 * Created by 41159 on 2016/6/29.
 */
@Entity
@Table(name = "order_item", schema = "bagery", catalog = "")
public class OrderItem {
    private int itemId;
    private Integer productId;
    private String productTitle;
    private int num;
    private Double totalPrice;
    private int orderId;
    private Order order;
    private Product product;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "item_id", nullable = false)
    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    @Basic
    @Column(name = "product_id", nullable = true)
    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    @Basic
    @Column(name = "product_title", nullable = false, length = 50)
    public String getProductTitle() {
        return productTitle;
    }

    public void setProductTitle(String productTitle) {
        this.productTitle = productTitle;
    }

    @Basic
    @Column(name = "num", nullable = false)
    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    @Basic
    @Column(name = "total_priced", nullable = false, precision = 0)
    public Double getTotalPrice() {
//        if (product != null && product.getPriced() != null && product.getPriced().getSalePrice() != null) {
//            totalPrice = num * product.getPriced().getSalePrice();
//        }
        return totalPrice;
    }

    @PostLoad
    private void onLoad() {
        if (totalPrice == null || totalPrice == 0
                && (product != null && product.getPriced() != null && product.getPriced().getSalePrice() != null)) {
            totalPrice = num * product.getPriced().getSalePrice();
        }
    }

    public void setTotalPrice(Double totalPriced) {
        this.totalPrice = totalPriced;
    }

    @Basic
    @Column(name = "order_id", nullable = false)
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
        if (num != orderItem.num) return false;
        if (totalPrice != orderItem.totalPrice) return false;
        if (orderId != orderItem.orderId) return false;
        if (productId != null ? !productId.equals(orderItem.productId) : orderItem.productId != null) return false;
        if (productTitle != null ? !productTitle.equals(orderItem.productTitle) : orderItem.productTitle != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = itemId;
        result = 31 * result + (productId != null ? productId.hashCode() : 0);
        result = 31 * result + (productTitle != null ? productTitle.hashCode() : 0);
        result = 31 * result + num;
        result = 31 * result + orderId;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "order_id", referencedColumnName = "order_id", nullable = false, insertable = false, updatable = false)
    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    @ManyToOne
    @JoinColumn(name = "product_id", referencedColumnName = "product_id", insertable = false, updatable = false)
    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
