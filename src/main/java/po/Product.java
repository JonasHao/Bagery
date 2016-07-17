package po;

import javax.persistence.*;
import java.util.Collection;

/**
 * Created by 41159 on 2016/6/29.
 */
@Entity
public class Product {
    private int productId;
    private int pricedId;
    private String color;
    private int stock;
    private Priced priced;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id", nullable = false)
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
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
    @Column(name = "color", nullable = false, length = 30)
    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    @Basic
    @Column(name = "stock", nullable = false)
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

    @Override
    public String toString() {
        return "" + productId;
    }

    @ManyToOne
    @JoinColumn(name = "priced_id", referencedColumnName = "priced_id", nullable = false, insertable = false, updatable = false)
    public Priced getPriced() {
        return priced;
    }

    public void setPriced(Priced priced) {
        this.priced = priced;
    }

}
