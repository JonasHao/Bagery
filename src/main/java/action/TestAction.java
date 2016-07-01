package action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.dispatcher.DefaultActionSupport;
import po.User;

/**
 * Created by Koche on 2016/6/30.
 */
public class TestAction extends DefaultActionSupport {
    private User user;

    @Override
    @Action(value = "/test", results = {
            @Result(name = "success", location = "/tag_attr_test.jsp")
    })
    public String execute() throws Exception {
        user=new User();
        user.setUserId(1);
        user.setUsername("Koche");
        return super.execute();
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
