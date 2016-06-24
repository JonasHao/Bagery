package po;

import javax.persistence.*;
import java.util.Collection;

/**
 * Created by 41159 on 2016/6/23.
 */
@Entity
public class Product {
    private int productId;
    private int pricedId;
    private String color;
    private int stock;
    private Collection<CartItem> cartItemsByProductId;
    private Collection<OrderItem> orderItemsByProductId;
    private Priced pricedByPricedId;

    @Id
    @Column(name = "product_id", nullable = false, insertable = true, updatable = true)
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    @Basic
    @Column(name = "priced_id", nullable = false, insertable = false, updatable = false)
    public int getPricedId() {
        return pricedId;
    }

    public void setPricedId(int pricedId) {
        this.pricedId = pricedId;
    }

    @Basic
    @Column(name = "color", nullable = false, insertable = true, updatable = true, length = 30)
    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    @Basic
    @Column(name = "stock", nullable = false, insertable = true, updatable = true)
    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Product product = (Product) o;

        if (productId != product.productId) return false;
        if (pricedId != product.pricedId) return false;
        if (stock != product.stock) return false;
        if (color != null ? !color.equals(product.color) : product.color != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = productId;
        result = 31 * result + pricedId;
        result = 31 * result + (color != null ? color.hashCode() : 0);
        result = 31 * result + stock;
        return result;
    }

    @OneToMany(mappedBy = "productByProductId")
    public Collection<CartItem> getCartItemsByProductId() {
        return cartItemsByProductId;
    }

    public void setCartItemsByProductId(Collection<CartItem> cartitemsByProductId) {
        this.cartItemsByProductId = cartitemsByProductId;
    }

    @OneToMany(mappedBy = "productByProductId")
    public Collection<OrderItem> getOrderItemsByProductId() {
        return orderItemsByProductId;
    }

    public void setOrderItemsByProductId(Collection<OrderItem> orderitemsByProductId) {
        this.orderItemsByProductId = orderitemsByProductId;
    }

    @ManyToOne
    @JoinColumn(name = "priced_id", referencedColumnName = "priced_id", nullable = false)
    public Priced getPricedByPricedId() {
        return pricedByPricedId;
    }

    public void setPricedByPricedId(Priced pricedByPricedId) {
        this.pricedByPricedId = pricedByPricedId;
    }
}
