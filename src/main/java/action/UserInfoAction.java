package action;

import com.opensymphony.xwork2.ActionContext;
import constant.Config;
import constant.Key;
import org.apache.struts2.dispatcher.DefaultActionSupport;
import org.hibernate.HibernateException;
import po.User;
import po.UserPricedRecord;
import service.UserService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static constant.Key.RESULT;

/**
 * Created by zhang on 2016/6/23.
 */
public class UserInfoAction extends DefaultActionSupport {
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
    private int historyId;

    private Map<String, Object> data = new HashMap<>();

    public String home() {
        try {
            user = userService.getCurrentUser();
            score = user.getScore();
            username = user.getUsername();
            userGroup = user.getUserGroup();
            img = user.getImg();
            if (userGroup.equals("r")) {
                group = 1;
            }
            if (userGroup.equals("cu")) {
                group = 2;
            }
            if (userGroup.equals("ag")) {
                group = 3;
            }
            return SUCCESS;
        } catch (HibernateException e) {
            e.printStackTrace();
            return ERROR;
        }
    }

    public String history() throws Exception {
        try {
            user = userService.getCurrentUser();
            historyList = user.getHistoryRecords();
            return SUCCESS;
        } catch (Exception e) {
            return ERROR;
        }
    }

    public String removeHistory() throws Exception {
        try {
            user = userService.getCurrentUser();
            userService.removeHistory(historyId);
            data.put(RESULT, SUCCESS);
        } catch (HibernateException e) {
            if (Config.DEBUG) {
                data.put(RESULT, SUCCESS);
            } else {
                data.put(RESULT, ERROR);
            }
        }
        return SUCCESS;
    }

    public String viewInfo() {
        user = userService.getCurrentUser();
        username = user.getUsername();
        email = user.getEmail();
        realname = user.getRealName();
        img = user.getImg();
        isActivate = user.getIsActivate();
        return SUCCESS;
    }

    public String update() {
        user = userService.getCurrentUser();
        user.setRealName(realname);
        userService.update(user);
        return SUCCESS;
    }

    public String openReset() {
        return SUCCESS;
    }

    public String resetPassword() {
        user = userService.getCurrentUser();
        confirmPassword = userService.getMD5(confirmPassword.getBytes());
        if (!confirmPassword.equals(user.getPassword())) {
            addFieldError("confirmPassword", "旧密码不正确");
            return INPUT;
        }
        if (!newPassword.equals(confirmNewPassword)) {
            addFieldError("newPassword", "验证密码不正确");
            return INPUT;
        }

        newPassword = userService.getMD5(newPassword.getBytes());
        user.setPassword(newPassword);
        userService.update(user);
        return SUCCESS;
    }

    public String openFind() {
        return SUCCESS;
    }

    public String sendConfirmCode() {
        if (!email.matches("^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$")) {
            data.put(Key.RESULT, INPUT);
            data.put(Key.ERROR_MESSAGE, "邮箱格式不正确");
            return SUCCESS;
        }

        user = userService.getUserByEmail(email);

        if (user == null) {
            data.put(Key.RESULT, INPUT);
            data.put(Key.ERROR_MESSAGE, "不存在的邮箱");
            return SUCCESS;
        }

        if (user.getIsActivate() == 0) {
            data.put(Key.RESULT, INPUT);
            data.put(Key.ERROR_MESSAGE, "未验证的邮箱");
            return SUCCESS;
        }

        code = (int) (Math.random() * 90000) + 10000;

        user.setPassword(userService.getMD5(Integer.toString(code).getBytes()));
        userService.update(user);

        data.put(Key.RESULT, SUCCESS);
        data.put("code", code);
        //发送邮件
        return SUCCESS;
    }

    public String confirmEmail() {
        try {
            user = userService.getUserByEmail(email);
            if (user == null) {
                data.put(Key.RESULT, INPUT);
                data.put(Key.ERROR_MESSAGE, "该邮箱不存在");
                return SUCCESS;
            }

            password = user.getPassword();
            confirmCode = userService.getMD5(confirmCode.getBytes());

            if (!confirmCode.equals(password)) {
                data.put(Key.RESULT, INPUT);
                data.put(Key.ERROR_MESSAGE, "验证码错误");
                return SUCCESS;
            }

            newPassword = userService.getMD5(newPassword.getBytes());
            user.setPassword(newPassword);
            userService.update(user);

            data.put(RESULT, SUCCESS);
            ActionContext.getContext().getSession().put(Key.USER, user.getUserId());
            return SUCCESS;

        } catch (Exception e) {
            e.printStackTrace();
            data.put(RESULT, ERROR);
        }
        return SUCCESS;
    }

    public String sendConfirm() {
        user = userService.getCurrentUser();
        code = (int) (Math.random() * 9000) + 1000;
        ActionContext.getContext().getSession().put("Code", code);
        //发送邮件
        return SUCCESS;
    }

    public String openConfirm() {
        return SUCCESS;
    }


    public String confirmCode() {
        if (Integer.parseInt(confirmCode) != (int) ActionContext.getContext().getSession().get("Code")) {
            addFieldError("confirmCode", "验证码不正确");
            return INPUT;
        }
        user = userService.getCurrentUser();
        user.setIsActivate((byte) 1);

        userService.update(user);
        user = userService.getCurrentUser();
        ActionContext.getContext().getSession().remove("Code");
        return SUCCESS;
    }

    public void validateResetPassword() {
        if (!newPassword.matches("^(\\w){5,20}$")) {
            addFieldError("newPassword", "密码只能包含字母数字或下划线");
        }
    }
//
//    public void validateSendConfirmCode() {
//
//    }

    public void validateConfirmEmail() {
        if (!newPassword.matches("^(\\w){5,20}$")) {
            addFieldError("newPassword", "密码只能包含字母数字或下划线");
        }
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

    public Map<String, Object> getData() {
        return data;
    }

    public void setData(Map<String, Object> data) {
        this.data = data;
    }

    public int getHistoryId() {
        return historyId;
    }

    public void setHistoryId(int historyId) {
        this.historyId = historyId;
    }
}
