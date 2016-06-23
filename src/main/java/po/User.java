package po;

import javax.persistence.*;
import java.util.Collection;

/**
 * Created by 41159 on 2016/6/23.
 */
@Entity
public class User {
    private int userId;
    private String username;
    private String password;
    private String realname;
    private String sex;
    private String email;
    private int score;
    private Integer defShipInfId;
    private String userGroup;
    private byte isAdmin;
    private Collection<Cartitem> cartitemsByUserId;
    private Collection<Comment> commentsByUserId;
    private Collection<Favoriteitem> favoriteitemsByUserId;
    private Collection<Orders> ordersesByUserId;
    private Collection<UserPricedRecord> userPricedRecordsByUserId;

    @Id
    @Column(name = "user_id", nullable = false, insertable = true, updatable = true)
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "username", nullable = false, insertable = true, updatable = true, length = 30)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "password", nullable = false, insertable = true, updatable = true, length = 100)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "realname", nullable = true, insertable = true, updatable = true, length = 30)
    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    @Basic
    @Column(name = "sex", nullable = true, insertable = true, updatable = true, length = 2)
    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    @Basic
    @Column(name = "email", nullable = true, insertable = true, updatable = true, length = 30)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "score", nullable = false, insertable = true, updatable = true)
    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    @Basic
    @Column(name = "def_ship_inf_id", nullable = true, insertable = true, updatable = true)
    public Integer getDefShipInfId() {
        return defShipInfId;
    }

    public void setDefShipInfId(Integer defShipInfId) {
        this.defShipInfId = defShipInfId;
    }

    @Basic
    @Column(name = "user_group", nullable = false, insertable = true, updatable = true, length = 14)
    public String getUserGroup() {
        return userGroup;
    }

    public void setUserGroup(String userGroup) {
        this.userGroup = userGroup;
    }

    @Basic
    @Column(name = "is_admin", nullable = false, insertable = true, updatable = true)
    public byte getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(byte isAdmin) {
        this.isAdmin = isAdmin;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        if (userId != user.userId) return false;
        if (score != user.score) return false;
        if (isAdmin != user.isAdmin) return false;
        if (username != null ? !username.equals(user.username) : user.username != null) return false;
        if (password != null ? !password.equals(user.password) : user.password != null) return false;
        if (realname != null ? !realname.equals(user.realname) : user.realname != null) return false;
        if (sex != null ? !sex.equals(user.sex) : user.sex != null) return false;
        if (email != null ? !email.equals(user.email) : user.email != null) return false;
        if (defShipInfId != null ? !defShipInfId.equals(user.defShipInfId) : user.defShipInfId != null) return false;
        if (userGroup != null ? !userGroup.equals(user.userGroup) : user.userGroup != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userId;
        result = 31 * result + (username != null ? username.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (realname != null ? realname.hashCode() : 0);
        result = 31 * result + (sex != null ? sex.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + score;
        result = 31 * result + (defShipInfId != null ? defShipInfId.hashCode() : 0);
        result = 31 * result + (userGroup != null ? userGroup.hashCode() : 0);
        result = 31 * result + (int) isAdmin;
        return result;
    }

    @OneToMany(mappedBy = "userByUserId")
    public Collection<Cartitem> getCartitemsByUserId() {
        return cartitemsByUserId;
    }

    public void setCartitemsByUserId(Collection<Cartitem> cartitemsByUserId) {
        this.cartitemsByUserId = cartitemsByUserId;
    }

    @OneToMany(mappedBy = "userByUserId")
    public Collection<Comment> getCommentsByUserId() {
        return commentsByUserId;
    }

    public void setCommentsByUserId(Collection<Comment> commentsByUserId) {
        this.commentsByUserId = commentsByUserId;
    }

    @OneToMany(mappedBy = "userByUserId")
    public Collection<Favoriteitem> getFavoriteitemsByUserId() {
        return favoriteitemsByUserId;
    }

    public void setFavoriteitemsByUserId(Collection<Favoriteitem> favoriteitemsByUserId) {
        this.favoriteitemsByUserId = favoriteitemsByUserId;
    }

    @OneToMany(mappedBy = "userByUserId")
    public Collection<Orders> getOrdersesByUserId() {
        return ordersesByUserId;
    }

    public void setOrdersesByUserId(Collection<Orders> ordersesByUserId) {
        this.ordersesByUserId = ordersesByUserId;
    }

    @OneToMany(mappedBy = "userByUserId")
    public Collection<UserPricedRecord> getUserPricedRecordsByUserId() {
        return userPricedRecordsByUserId;
    }

    public void setUserPricedRecordsByUserId(Collection<UserPricedRecord> userPricedRecordsByUserId) {
        this.userPricedRecordsByUserId = userPricedRecordsByUserId;
    }
}
