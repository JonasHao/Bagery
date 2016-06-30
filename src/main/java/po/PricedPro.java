package po;

import javax.persistence.*;

/**
 * Created by 41159 on 2016/6/29.
 */
@Entity
@Table(name = "priced_pro", schema = "", catalog = "bagery")
public class PricedPro {
    private int ppId;
    private int pricedId;
    private int proId;
    private Priced priced;
    private Property property;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "pp_id", nullable = false, insertable = false, updatable = false)
    public int getPpId() {
        return ppId;
    }

    public void setPpId(int ppId) {
        this.ppId = ppId;
    }

    @Basic
    @Column(name = "priced_id", nullable = false, insertable = true, updatable = true)
    public int getPricedId() {
        return pricedId;
    }

    public void setPricedId(int pricedId) {
        this.pricedId = pricedId;
    }

    @Basic
    @Column(name = "pro_id", nullable = false, insertable = true, updatable = true)
    public int getProId() {
        return proId;
    }

    public void setProId(int proId) {
        this.proId = proId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        PricedPro pricedPro = (PricedPro) o;

        if (ppId != pricedPro.ppId) return false;
        if (pricedId != pricedPro.pricedId) return false;
        if (proId != pricedPro.proId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = ppId;
        result = 31 * result + pricedId;
        result = 31 * result + proId;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "priced_id", referencedColumnName = "priced_id", nullable = false, insertable = false, updatable = false)
    public Priced getPriced() {
        return priced;
    }

    public void setPriced(Priced priced) {
        this.priced = priced;
    }

    @ManyToOne
    @JoinColumn(name = "pro_id", referencedColumnName = "pro_id", nullable = false, insertable = false, updatable = false)
    public Property getProperty() {
        return property;
    }

    public void setProperty(Property property) {
        this.property = property;
    }
}
