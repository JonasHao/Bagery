package po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by 41159 on 2016/6/23.
 */
@Entity
public class Favoriteitem {
    private int itemId;

    @Id
    @Column(name = "item_id", nullable = false, insertable = true, updatable = true)
    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Favoriteitem that = (Favoriteitem) o;

        if (itemId != that.itemId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return itemId;
    }
}
