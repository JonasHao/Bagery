package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.hibernate.HibernateException;
import po.User;
import po.UserPricedRecord;
import service.UserService;

import java.util.List;
import java.util.Random;

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

    private int group;

    private int code;
    private String confirmCode;

    private String confirmPassword;//密码找回时，输入密码验证身份
    private String newPassword;//新密码
    private String confirmNewPassword;//重新输入新密码

    private List<UserPricedRecord> historyList;

    public String home(){
        try {
            user = userService.getCurrentUser();
            score = user.getScore();
            username=user.getUsername();
            userGroup=user.getUserGroup();
            if(userGroup.equals("r")){
                group=1;
            }
            if(userGroup.equals("cu")){
                group=2;
            }
            if(userGroup.equals("ag")){
                group=3;
            }
            return SUCCESS;
        }catch (HibernateException e){
            e.printStackTrace();
            return ERROR;
        }
    }

    public String history() throws Exception {
        try{
            user = userService.getCurrentUser();
            historyList = user.getHistoryRecords();
            return SUCCESS;
        }catch (Exception e){
            return ERROR;
        }
    }

    public String viewInfo(){
        user=userService.getCurrentUser();
        username=user.getUsername();
        email=user.getEmail();
        realname=user.getRealName();
        isActivate=user.getIsActivate();
        return SUCCESS;
    }

    public String update() {
        user=userService.getCurrentUser();
        user.setRealName(realname);
        userService.update(user);
        return SUCCESS;
    }

    public String resetPassword(){
        user=userService.getCurrentUser();
        if(!confirmPassword.equals(user.getPassword())){
            addFieldError("confirmPassword","旧密码不正确");
            return INPUT;
        }
        if(!newPassword.equals(confirmNewPassword)){
            addFieldError("newPassword","验证密码不正确");
            return INPUT;
        }

        user.setPassword(newPassword);
        userService.update(user);
        return SUCCESS;
    }

    public String openReset(){
        return SUCCESS;
    }

    public String openFind(){
        return SUCCESS;
    }

    public String sendConfirmCode(){
        user=userService.getUserByEmial(email);

        if(user==null) {
            addFieldError("email","不存在的邮箱");
            return INPUT;
        }

        if(user.getIsActivate()==0) {
            addFieldError("email","未验证的邮箱不可找回密码");
            return INPUT;
        }

        code=(int)(Math.random()*9000)+1000;
        ActionContext.getContext().getSession().put("Code",code);
        ActionContext.getContext().getSession().put("User",user);
        ActionContext.getContext().getSession().put("Email",email);

        //发送邮件
        addActionMessage("验证码已发送");
        return SUCCESS;
    }

    public String confirmEmail(){
        if(Integer.parseInt(confirmCode)!=(int)ActionContext.getContext().getSession().get("Code")) {
            addFieldError("confirmCode","验证码错误");
            return INPUT;
        }

        if(!newPassword.equals(confirmNewPassword)){
            addFieldError("confirmNewPassword","确认密码错误");
            return INPUT;
        }

        user=userService.getCurrentUser();

        user.setPassword(newPassword);

        userService.update(user);

        ActionContext.getContext().getSession().remove("Code");
        ActionContext.getContext().getSession().remove("User");
        ActionContext.getContext().getSession().remove("Email");
        ActionContext.getContext().getSession().put("User",user);
        return SUCCESS;
    }

    public String openConfirm(){
        user=userService.getCurrentUser();
        code=(int)(Math.random()*9000)+1000;
        ActionContext.getContext().getSession().put("Code",code);
        //发送邮件
        return SUCCESS;
    }

    public String confirmCode(){
        if(Integer.parseInt(confirmCode)!=(int)ActionContext.getContext().getSession().get("Code")) {
            addFieldError("confirmCode","验证码不正确");
            return INPUT;
        }
        user=userService.getCurrentUser();
        user.setIsActivate((byte)1);

        userService.update(user);
        user=userService.getCurrentUser();
        ActionContext.getContext().getSession().remove("Code");
        return SUCCESS;
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

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getConfirmNewPassword() {
        return confirmNewPassword;
    }

    public void setConfirmNewPassword(String confirmNewPassword) {
        this.confirmNewPassword = confirmNewPassword;
    }

    public String getConfirmCode() {
        return confirmCode;
    }

    public void setConfirmCode(String confirmCode) {
        this.confirmCode = confirmCode;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public int getGroup() {
        return group;
    }

    public void setGroup(int group) {
        this.group = group;
    }
    public List<UserPricedRecord> getHistoryList() {
        return historyList;
    }

    public void setHistoryList(List<UserPricedRecord> historyList) {
        this.historyList = historyList;
    }
}
