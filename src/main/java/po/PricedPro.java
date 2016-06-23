package po;

import javax.persistence.*;

/**
 * Created by 41159 on 2016/6/23.
 */
@Entity
@Table(name = "priced_pro", schema = "", catalog = "bagery")
public class PricedPro {
    private int ppId;
    private Priced pricedByPricedId;

    @Id
    @Column(name = "pp_id", nullable = false, insertable = true, updatable = true)
    public int getPpId() {
        return ppId;
    }

    public void setPpId(int ppId) {
        this.ppId = ppId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        PricedPro pricedPro = (PricedPro) o;

        if (ppId != pricedPro.ppId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return ppId;
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
