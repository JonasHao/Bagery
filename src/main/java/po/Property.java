package po;

import javax.persistence.*;
import java.util.Collection;

/**
 * Created by 41159 on 2016/6/29.
 */
@Entity
public class Property {
    private int proId;
    private String category;
    private String description;
    private int selected;

    private Collection<PricedPro> pricedProsByProId;


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)    @Column(name = "pro_id", nullable = false)
    public int getProId() {
        return proId;
    }

    public void setProId(int proId) {
        this.proId = proId;
    }

    @Basic
    @Column(name = "description", nullable = false, length = 30)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    @Basic
    @Column(name = "category", nullable = false, insertable = true, updatable = true, length = 3)
    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }


    @Transient
    public int getSelected() {
        return selected;
    }

    public void setSelected(int selected) {
        this.selected = selected;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Property property = (Property) o;

        if (proId != property.proId) return false;
        if (description != null ? !description.equals(property.description) : property.description != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = proId;
        result = 31 * result + (description != null ? description.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "property")
    public Collection<PricedPro> getPricedProsByProId() {
        return pricedProsByProId;
    }

    public void setPricedProsByProId(Collection<PricedPro> pricedProsByProId) {
        this.pricedProsByProId = pricedProsByProId;
    }
}
