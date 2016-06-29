package po;

import javax.persistence.*;
import java.util.Collection;

/**
 * Created by 41159 on 2016/6/29.
 */
@Entity
@Table(name="propertity")
public class Property {
    private int proId;
    private String category;
    private String description;
    private Collection<PricedPro> pricedProsByProId;

    @Id
    @Column(name = "pro_id", nullable = false, insertable = true, updatable = true)
    public int getProId() {
        return proId;
    }

    public void setProId(int proId) {
        this.proId = proId;
    }

    @Basic
    @Column(name = "category", nullable = false, insertable = true, updatable = true, length = 3)
    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Basic
    @Column(name = "description", nullable = false, insertable = true, updatable = true, length = 30)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Property that = (Property) o;

        if (proId != that.proId) return false;
        if (category != null ? !category.equals(that.category) : that.category != null) return false;
        if (description != null ? !description.equals(that.description) : that.description != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = proId;
        result = 31 * result + (category != null ? category.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "getProperty")
    public Collection<PricedPro> getPricedProsByProId() {
        return pricedProsByProId;
    }

    public void setPricedProsByProId(Collection<PricedPro> pricedProsByProId) {
        this.pricedProsByProId = pricedProsByProId;
    }
}
