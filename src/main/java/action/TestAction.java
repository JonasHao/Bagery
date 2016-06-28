package action;

import org.apache.struts2.dispatcher.DefaultActionSupport;
import po.TestItem;

import java.util.ArrayList;
import java.util.List;


public class TestAction extends DefaultActionSupport{
    private List<TestItem> itemList = new ArrayList<>();

    @Override
    public String execute() throws Exception {
        System.out.println("Get Lists:");
        itemList.forEach(System.out::println);
        return super.execute();
    }

    public List<TestItem> getItemList() {
        return itemList;
    }

    public void setItemList(List<TestItem> itemList) {
        this.itemList = itemList;
    }
}
