package po;

/**
 * Created by Koche on 2016/6/28.
 */
public class TestItem {
    private int id;
    private String tag;

    public TestItem() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    @Override
    public String toString() {
        return "id:" + id + "\ttag:" + tag;
    }
}
