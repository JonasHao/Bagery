package po;

import javax.persistence.*;

/**
 * Created by 41159 on 2016/6/29.
 */
@Entity
@Table(name = "cart_item", schema = "bagery", catalog = "")
public class CartItem {
    private int itemId;
    private int productId;
    private int num;
    private Double subtotal;
    private int userId;
    private Product product;
    private User user;

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
    @Column(name = "product_id", nullable = false)
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
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
    @Column(name = "total_priced", nullable = true, precision = 0)
    public Double getSubtotal() {
        if (subtotal == null) {
            if (product != null && product.getPriced() != null && product.getPriced().getSalePrice() != null) {
                subtotal = num * product.getPriced().getSalePrice();
            }
        }
        return subtotal;
    }

    public void setSubtotal(Double totalPriced) {
        this.subtotal = totalPriced;
    }

    @Basic
    @Column(name = "user_id", nullable = false)
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
        if (subtotal != null ? !subtotal.equals(cartItem.subtotal) : cartItem.subtotal != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = itemId;
        result = 31 * result + productId;
        result = 31 * result + num;
        result = 31 * result + (subtotal != null ? subtotal.hashCode() : 0);
        result = 31 * result + userId;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "product_id", referencedColumnName = "product_id", nullable = false, insertable = false, updatable = false)
    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "user_id", nullable = false, insertable = false, updatable = false)
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
