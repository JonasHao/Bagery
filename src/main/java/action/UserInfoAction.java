package action;

import com.opensymphony.xwork2.ActionSupport;
import po.User;
import service.UserService;

/**
 * Created by zhang on 2016/6/23.
 */
public class UserInfoAction extends ActionSupport {
    private UserService userService;
    private User user;

    private String userId;
    private String username;
    private String password;
    private String realname;
    private String email;
    private String img;
    private int score;
    private Integer defaultAddressId;
    private String userGroup;
    private byte isActivate;
    private String confirmpassword;

    public String viewInfo(){
        user=userService.getCurrentUser();
        return SUCCESS;
    }

    public String update() {
        user=userService.getCurrentUser();
        user.setRealName(realname);
        userService.update(user);
        return null;
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getConfirmpassword() {
        return confirmpassword;
    }

    public void setConfirmpassword(String confirmpassword) {
        this.confirmpassword = confirmpassword;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public Integer getDefaultAddressId() {
        return defaultAddressId;
    }

    public void setDefaultAddressId(Integer defaultAddressId) {
        this.defaultAddressId = defaultAddressId;
    }

    public String getUserGroup() {
        return userGroup;
    }

    public void setUserGroup(String usergroup) {
        this.userGroup = usergroup;
    }

    public byte getIsActivate() {
        return isActivate;
    }

    public void setIsActivate(byte isActivate) {
        this.isActivate = isActivate;
    }
}
