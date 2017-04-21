package action;

import com.opensymphony.xwork2.ActionContext;
import constant.Key;
import constant.UserGroup;
import org.apache.struts2.dispatcher.DefaultActionSupport;
import po.User;
import service.UserService;

public class UserAction extends DefaultActionSupport {
    private UserService userService;
    private User user;

    private String userId;
    private String username;
    private String password;
    private String realname;
    private String email;
    private String confirmpassword;
    private String isadmin;
    private String usergroup;
    private String src;

    public String login() {
        try {
            if (!userService.existUsername(username)) {
                addFieldError("username", "用户名不存在");
                return INPUT;
            }

            password = userService.getMD5(password.getBytes());
            user = userService.login(username, password);

            if (user == null) {
                addFieldError("password", "密码错误");
                return INPUT;
            }

            String group = user.getUserGroup();
            if (group != null) {
                switch (group) {
                    case UserGroup.ORDER_ADMIN:
                    case UserGroup.PRODUCT_ADMIN:
                    case UserGroup.ROOT:
                        return "admin";
                }
            }
            return SUCCESS;
        } catch (Exception e) {
            return ERROR;
        }
    }

    public String register() {
        try {
            if (userService.existUsername(username)) {
                addFieldError("username", "用户名已被注册");
                return INPUT;
            }
            if (userService.existEmail(email)) {
                addFieldError("email", "邮箱已被注册");
                return INPUT;
            }
            if (!password.equals(confirmpassword)) {
                addFieldError("confirmpassword", "两次密码输入不一致");
                return INPUT;
            }

            password = userService.getMD5(password.getBytes());

            user = new User();
            user.setUsername(username);
            user.setPassword(password);
            user.setRealName(realname);
            user.setEmail(email);
            user.setUserGroup("r");

            userService.register(user);

            return SUCCESS;
        } catch (Exception e) {
            return ERROR;
        }
    }

    @Override
    public void validate() {
        if (username == null || username.length() < 5 || username.length() > 12) {
            addFieldError("username", "用户名长度应为5-12位");
            return;
        }

        if (!username.matches("^[A-Za-z0-9]{5,12}$")) {
            addFieldError("username", "用户名只能包含字母和数字");
            return;
        }

        if (password == null || password.length() < 5 || password.length() > 20) {
            addFieldError("password", "密码长度应为5-20位");
            return;
        }

        if (!password.matches("^(\\w){5,20}$")) {
            addFieldError("password", "密码只能包含字母数字或下划线");
            return;
        }

        super.validate();
    }

    public void validateRegister() {
        // optional real name
        if (realname != null && realname.length() > 0) {
            if (realname.length() > 15) {
                addFieldError("realname", "姓名输入太长了");
                return;
            }
        }

        if (!email.matches("^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$")) {
            addFieldError("email", "邮箱格式不正确");
        }
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

    public UserService getUserService() {
        return userService;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public User getUser() {
        return user;
    }


    public String getSrc() {
        if (src == null || src.isEmpty()) {
            if (ActionContext.getContext() != null &&
                    ActionContext.getContext().getSession() != null &&
                    ActionContext.getContext().getSession().get(Key.GOING_TO_URL) != null) {
                src = (String) ActionContext.getContext().getSession().get(Key.GOING_TO_URL);
                ActionContext.getContext().getSession().remove(Key.GOING_TO_URL);
                if (src == null || src.isEmpty()) {
                    src = "index?message='登录成功'";
                }
            }
        }
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }
}
