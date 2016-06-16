package po;

import javax.persistence.*;
import java.util.Collection;

/**
 * Created by 41159 on 2016/6/16.
 */
@Entity
public class Priced {
    private int pricedId;
    private String title;
    private String description;
    private int unitPrice;
    private Integer salePrice;
    private Collection<Comment> commentsByPricedId;
    private Collection<PricedPro> pricedProsByPricedId;
    private Collection<Product> productsByPricedId;

    @Id
    @Column(name = "priced_id", nullable = false, insertable = true, updatable = true)
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
    @Column(name = "description", nullable = true, insertable = true, updatable = true, length = 65535)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "unit_price", nullable = false, insertable = true, updatable = true, precision = 0)
    public int getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(int unitPrice) {
        this.unitPrice = unitPrice;
    }

    @Basic
    @Column(name = "sale_price", nullable = true, insertable = true, updatable = true, precision = 0)
    public Integer getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(Integer salePrice) {
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
        if (description != null ? !description.equals(priced.description) : priced.description != null) return false;
        if (salePrice != null ? !salePrice.equals(priced.salePrice) : priced.salePrice != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = pricedId;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + unitPrice;
        result = 31 * result + (salePrice != null ? salePrice.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "pricedByPricedId")
    public Collection<Comment> getCommentsByPricedId() {
        return commentsByPricedId;
    }

    public void setCommentsByPricedId(Collection<Comment> commentsByPricedId) {
        this.commentsByPricedId = commentsByPricedId;
    }

    @OneToMany(mappedBy = "pricedByPricedId")
    public Collection<PricedPro> getPricedProsByPricedId() {
        return pricedProsByPricedId;
    }

    public void setPricedProsByPricedId(Collection<PricedPro> pricedProsByPricedId) {
        this.pricedProsByPricedId = pricedProsByPricedId;
    }

    @OneToMany(mappedBy = "pricedByPricedId")
    public Collection<Product> getProductsByPricedId() {
        return productsByPricedId;
    }

    public void setProductsByPricedId(Collection<Product> productsByPricedId) {
        this.productsByPricedId = productsByPricedId;
    }
}
