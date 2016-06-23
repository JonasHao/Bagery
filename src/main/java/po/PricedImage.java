package po;

import javax.persistence.*;

/**
 * Created by 41159 on 2016/6/23.
 */
@Entity
@Table(name = "priced_image", schema = "", catalog = "bagery")
public class PricedImage {
    private int pricedImageId;
    private int pricedId;
    private String image;
    private Priced pricedByPricedId;

    @Id
    @Column(name = "priced_image_id", nullable = false, insertable = true, updatable = true)
    public int getPricedImageId() {
        return pricedImageId;
    }

    public void setPricedImageId(int pricedImageId) {
        this.pricedImageId = pricedImageId;
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
    @Column(name = "image", nullable = false, insertable = true, updatable = true, length = 100)
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        PricedImage that = (PricedImage) o;

        if (pricedImageId != that.pricedImageId) return false;
        if (pricedId != that.pricedId) return false;
        if (image != null ? !image.equals(that.image) : that.image != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = pricedImageId;
        result = 31 * result + pricedId;
        result = 31 * result + (image != null ? image.hashCode() : 0);
        return result;
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
