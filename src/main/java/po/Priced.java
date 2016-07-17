package po;

import javax.persistence.*;
import java.util.Collection;

/**
 * Created by 41159 on 2016/6/29.
 */
@Entity
public class Priced {
    private int pricedId;
    private String title;
    private String img;
    private String description;
    private int isExisted;
    private Double unitPrice;
    private Double salePrice;
    private Collection<Comment> comments;
    private Collection<PricedPro> pricedPros;
    private Collection<Product> products;
    private Collection<HistoryRecord> historyRecords;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)    @Column(name = "priced_id", nullable = false)
    public int getPricedId() {
        return pricedId;
    }

    public void setPricedId(int pricedId) {
        this.pricedId = pricedId;
    }

    @Basic
    @Column(name = "title", nullable = false, length = 50)
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "img", nullable = true, length = -1)
    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Basic
    @Column(name = "description", nullable = true, length = -1)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "is_existed", nullable = false)
    public int getIsExisted() {
        return isExisted;
    }

    public void setIsExisted(int isExisted) {
        this.isExisted = isExisted;
    }

    @Basic
    @Column(name = "unit_price", nullable = false, precision = 0)
    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    @Basic
    @Column(name = "sale_price", nullable = true, precision = 0)
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
        if (isExisted != priced.isExisted) return false;
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
        result = 31 * result + isExisted;
        result = 31 * result + (salePrice != null ? salePrice.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "priced")
    public Collection<Comment> getComments() {
        return comments;
    }

    public void setComments(Collection<Comment> comments) {
        this.comments = comments;
    }

    @OneToMany(mappedBy = "priced")
    public Collection<PricedPro> getPricedPros() {
        return pricedPros;
    }

    public void setPricedPros(Collection<PricedPro> pricedPros) {
        this.pricedPros = pricedPros;
    }

    @OneToMany(mappedBy = "priced")
    public Collection<Product> getProducts() {
        return products;
    }

    public void setProducts(Collection<Product> products) {
        this.products = products;
    }

    @OneToMany(mappedBy = "priced")
    public Collection<HistoryRecord> getHistoryRecords() {
        return historyRecords;
    }

    public void setHistoryRecords(Collection<HistoryRecord> historyRecords) {
        this.historyRecords = historyRecords;
    }

}
