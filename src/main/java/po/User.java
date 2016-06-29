package po;

import javax.persistence.*;
import java.util.Collection;

/**
 * Created by 41159 on 2016/6/29.
 */
@Entity
public class User {
    private int userId;
    private String username;
    private String password;
    private String realName;
    private String email;
    private String img;
    private int score;
    private Integer defShipInfId;
    private String userGroup;
    private byte isActivate;
    private Collection<CartItem> cartitemsByUserId;
    private Collection<Comment> commentsByUserId;
    private Collection<FavoriteItem> favoriteitemsByUserId;
    private Collection<Order> ordersesByUserId;
    private Collection<Address> shipInformationsByUserId;
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
    public String getRealName() {
        return realName;
    }

    public void setRealName(String realname) {
        this.realName = realname;
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
    @Column(name = "img", nullable = true, insertable = true, updatable = true, length = 65535)
    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
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
    @Column(name = "is_activate", nullable = false, insertable = true, updatable = true)
    public byte getIsActivate() {
        return isActivate;
    }

    public void setIsActivate(byte isActivate) {
        this.isActivate = isActivate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        if (userId != user.userId) return false;
        if (score != user.score) return false;
        if (isActivate != user.isActivate) return false;
        if (username != null ? !username.equals(user.username) : user.username != null) return false;
        if (password != null ? !password.equals(user.password) : user.password != null) return false;
        if (realName != null ? !realName.equals(user.realName) : user.realName != null) return false;
        if (email != null ? !email.equals(user.email) : user.email != null) return false;
        if (img != null ? !img.equals(user.img) : user.img != null) return false;
        if (defShipInfId != null ? !defShipInfId.equals(user.defShipInfId) : user.defShipInfId != null) return false;
        if (userGroup != null ? !userGroup.equals(user.userGroup) : user.userGroup != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userId;
        result = 31 * result + (username != null ? username.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (realName != null ? realName.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (img != null ? img.hashCode() : 0);
        result = 31 * result + score;
        result = 31 * result + (defShipInfId != null ? defShipInfId.hashCode() : 0);
        result = 31 * result + (userGroup != null ? userGroup.hashCode() : 0);
        result = 31 * result + (int) isActivate;
        return result;
    }

    @OneToMany(mappedBy = "user")
    public Collection<CartItem> getCartitemsByUserId() {
        return cartitemsByUserId;
    }

    public void setCartitemsByUserId(Collection<CartItem> cartitemsByUserId) {
        this.cartitemsByUserId = cartitemsByUserId;
    }

    @OneToMany(mappedBy = "user")
    public Collection<Comment> getCommentsByUserId() {
        return commentsByUserId;
    }

    public void setCommentsByUserId(Collection<Comment> commentsByUserId) {
        this.commentsByUserId = commentsByUserId;
    }

    @OneToMany(mappedBy = "user")
    public Collection<FavoriteItem> getFavoriteitemsByUserId() {
        return favoriteitemsByUserId;
    }

    public void setFavoriteitemsByUserId(Collection<FavoriteItem> favoriteitemsByUserId) {
        this.favoriteitemsByUserId = favoriteitemsByUserId;
    }

    @OneToMany(mappedBy = "user")
    public Collection<Order> getOrdersesByUserId() {
        return ordersesByUserId;
    }

    public void setOrdersesByUserId(Collection<Order> ordersesByUserId) {
        this.ordersesByUserId = ordersesByUserId;
    }

    @OneToMany(mappedBy = "user")
    public Collection<Address> getShipInformationsByUserId() {
        return shipInformationsByUserId;
    }

    public void setShipInformationsByUserId(Collection<Address> shipInformationsByUserId) {
        this.shipInformationsByUserId = shipInformationsByUserId;
    }

    @OneToMany(mappedBy = "userByUserId")
    public Collection<UserPricedRecord> getUserPricedRecordsByUserId() {
        return userPricedRecordsByUserId;
    }

    public void setUserPricedRecordsByUserId(Collection<UserPricedRecord> userPricedRecordsByUserId) {
        this.userPricedRecordsByUserId = userPricedRecordsByUserId;
    }
}
