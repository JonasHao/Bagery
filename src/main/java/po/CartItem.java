package po;

import javax.persistence.*;


/**
 * Created by 41159 on 2016/6/29.
 */
@Entity
public class CartItem {
    private int itemId;
    private int productId;
    private int num;
    private Double totalPriced;
    private int userId;
    private Product product;
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
    @Column(name = "total_priced", nullable = true, insertable = true, updatable = true, precision = 0)
    public Double getTotalPriced() {
        return totalPriced;
    }

    public void setTotalPriced(Double totalPriced) {
        this.totalPriced = totalPriced;
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

        CartItem cartItem = (CartItem) o;

        if (itemId != cartItem.itemId) return false;
        if (productId != cartItem.productId) return false;
        if (num != cartItem.num) return false;
        if (userId != cartItem.userId) return false;
        if (totalPriced != null ? !totalPriced.equals(cartItem.totalPriced) : cartItem.totalPriced != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = itemId;
        result = 31 * result + productId;
        result = 31 * result + num;
        result = 31 * result + (totalPriced != null ? totalPriced.hashCode() : 0);
        result = 31 * result + userId;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "product_id", referencedColumnName = "product_id", nullable = false)
    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
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
