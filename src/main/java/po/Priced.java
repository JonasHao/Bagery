package po;

import javax.persistence.*;
import java.util.Collection;


@Entity
public class Priced {
    private int pricedId;
    private String title;
    private String img;
    private String description;
    private Double unitPrice;
    private Double salePrice;
    private Collection<Comment> comments;
    private Collection<FavoriteItem> favoriteItems;
    private Collection<PricedPro> pricedPros;
    private Collection<Product> products;
    private Collection<UserPricedRecord> userPricedRecords;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "priced_id", nullable = false, insertable = false, updatable = false)
    public int getPricedId() {
        return pricedId;
    }

    public void setPricedId(int pricedId) {
        this.pricedId = pricedId;
    }

    @Basic
    @Column(name = "title", nullable = false, insertable = true, updatable = true, length = 50)
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "img", nullable = true, insertable = true, updatable = true, length = 65535)
    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Basic
    @Column(name = "description", nullable = true, insertable = true, updatable = true, length = 65535)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "unit_price", nullable = false, insertable = true, updatable = true, precision = 0)
    public Double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Double unitPrice) {
        this.unitPrice = unitPrice;
    }

    @Basic
    @Column(name = "sale_price", nullable = true, insertable = true, updatable = true, precision = 0)
    public Double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(Double salePrice) {
        this.salePrice = salePrice;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Priced priced = (Priced) o;

        if (pricedId != priced.pricedId) return false;
        if (unitPrice != priced.unitPrice) return false;
        if (title != null ? !title.equals(priced.title) : priced.title != null) return false;
        if (img != null ? !img.equals(priced.img) : priced.img != null) return false;
        if (description != null ? !description.equals(priced.description) : priced.description != null) return false;
        if (salePrice != null ? !salePrice.equals(priced.salePrice) : priced.salePrice != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = pricedId;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (img != null ? img.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (unitPrice != null ? unitPrice.hashCode() : 0);
        result = 31 * result + (salePrice != null ? salePrice.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "priced")
    public Collection<Comment> getComments() {
        return comments;
    }

    public void setComments(Collection<Comment> commentsByPricedId) {
        this.comments = commentsByPricedId;
    }

    @OneToMany(mappedBy = "priced")
    public Collection<FavoriteItem> getFavoriteItems() {
        return favoriteItems;
    }

    public void setFavoriteItems(Collection<FavoriteItem> favoriteItemsByPricedId) {
        this.favoriteItems = favoriteItemsByPricedId;
    }

    @OneToMany(mappedBy = "priced")
    public Collection<PricedPro> getPricedPros() {
        return pricedPros;
    }

    public void setPricedPros(Collection<PricedPro> pricedProsByPricedId) {
        this.pricedPros = pricedProsByPricedId;
    }

    @OneToMany(mappedBy = "priced")
    public Collection<Product> getProducts() {
        return products;
    }

    public void setProducts(Collection<Product> productsByPricedId) {
        this.products = productsByPricedId;
    }

    @OneToMany(mappedBy = "priced")
    public Collection<UserPricedRecord> getUserPricedRecords() {
        return userPricedRecords;
    }

    public void setUserPricedRecords(Collection<UserPricedRecord> userPricedRecordsByPricedId) {
        this.userPricedRecords = userPricedRecordsByPricedId;
    }

    @Override
    public String toString() {
        return title + " " + description + " " + unitPrice + " " + salePrice;
    }
}
