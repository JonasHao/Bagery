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
    private String username;

    @Override
    public void validate() {
        if(username==null || username.length()==0){
            addFieldError("username","用户名不能为空");
        }
        super.validate();
    }

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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
