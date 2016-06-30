package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.convention.annotation.Action;
import po.User;
import service.UserService;

/**
 * Created by zhang on 2016/6/23.
 */
public class UserAction extends ActionSupport {
    private UserService userService;
    private User user;

    private String username;
    private String password;
    private String realname;
    private String email;
    private String confirmpassword;
    private String isadmin;
    private String usergroup;
    private String msg;

    @Action("logout")
    public String logout() {
        ActionContext.getContext().getSession().clear();
        return SUCCESS;
    }

    @Action("login")
    public String login() {
        //todo: use validator to validate columns
        if (!userService.existUsername(username)) {
            addFieldError("username","用户名不存在");
            return INPUT;
        }

        msg=userService.login(username,password);

        if(msg.equals("input")) {
            addFieldError("password", "密码错误");
            return INPUT;
        }
        else
            return SUCCESS;
    }

    @Action("register")
    public String register() {
        if (userService.existUsername(username)) {
            addFieldError("username","Exist UserName,Please Input Again");
            return INPUT;
        }
        if (userService.existEmail(email)) {
            addFieldError("email","Exist Email,Please Input Again");
            return INPUT;
        }
        if (!password.equals(confirmpassword)) {
            addFieldError("confirmpassword","Wrong Password,Please Confirm it");
            return INPUT;
        }

        user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setRealName(realname);
        user.setEmail(email);
        user.setUserGroup("r");

        userService.register(user);
        ActionContext.getContext().getSession().put("User", user);
        return SUCCESS;
    }

    public void setUsergroup(String usergroup) {
        this.usergroup = usergroup;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setConfirmpassword(String confirmpassword) {
        this.confirmpassword = confirmpassword;
    }

    public void setIsadmin(String isadmin) {
        this.isadmin = isadmin;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getRealname() {
        return realname;
    }

    public String getEmail() {
        return email;
    }

    public String getConfirmpassword() {
        return confirmpassword;
    }

    public String getIsadmin() {
        return isadmin;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getUsergroup() {
        return usergroup;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
