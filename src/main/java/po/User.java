package po;

import constant.Path;
import constant.UserGroup;

import javax.persistence.*;
import java.util.List;

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
    private Integer defaultAddressId;
    private String userGroup;
    private byte isActivate;
    private List<CartItem> cartItems;
    private List<Comment> comments;
    private List<FavoriteItem> favoriteItems;
    private List<Order> orders;
    private List<Address> addresses;
    private List<UserPricedRecord> historyRecords;

    public User() {
        int avatar = (int) (Math.random() * 100) % 8;
        img = Path.avatars[avatar];
        userGroup = UserGroup.REGULAR;
        score = 0;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id", nullable = false, insertable = false, updatable = false)
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
        if (userGroup != null) {
            switch (userGroup) {
                case UserGroup.ROOT:
                case UserGroup.ORDER_ADMIN:
                case UserGroup.PRODUCT_ADMIN:
                    break;

                case UserGroup.REGULAR:
                    if (score > UserGroup.TONGPAI_THRESHOLD) {
                        userGroup = UserGroup.TONGPAI;
                    }
                    break;

                case UserGroup.TONGPAI:
                    if (score > UserGroup.YINPAI_THRESHOLD) {
                        userGroup = UserGroup.YINPAI;
                    }
                    break;

                case UserGroup.YINPAI:
                    if (score > UserGroup.JINPAI_THRESHOLD) {
                        userGroup = UserGroup.JINPAI;
                    }
                    break;
            }
        }
    }

    @Basic
    @Column(name = "def_ship_inf_id", nullable = true, insertable = true, updatable = true)
    public Integer getDefaultAddressId() {
        return defaultAddressId;
    }

    public void setDefaultAddressId(Integer defShipInfId) {
        this.defaultAddressId = defShipInfId;
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
        if (defaultAddressId != null ? !defaultAddressId.equals(user.defaultAddressId) : user.defaultAddressId != null)
            return false;
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
        result = 31 * result + (defaultAddressId != null ? defaultAddressId.hashCode() : 0);
        result = 31 * result + (userGroup != null ? userGroup.hashCode() : 0);
        result = 31 * result + (int) isActivate;
        return result;
    }

    @OneToMany(mappedBy = "user",fetch = FetchType.EAGER)
    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(List<CartItem> cartitemsByUserId) {
        this.cartItems = cartitemsByUserId;
    }

    @OneToMany(mappedBy = "user")
    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> commentsByUserId) {
        this.comments = commentsByUserId;
    }

    @OneToMany(mappedBy = "user")
    public List<FavoriteItem> getFavoriteItems() {
        return favoriteItems;
    }

    public void setFavoriteItems(List<FavoriteItem> favoriteitemsByUserId) {
        this.favoriteItems = favoriteitemsByUserId;
    }

    @OneToMany(mappedBy = "user")
    @OrderBy("orderId DESC")
    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> ordersesByUserId) {
        this.orders = ordersesByUserId;
    }

    @OneToMany(mappedBy = "user",fetch = FetchType.EAGER)
    public List<Address> getAddresses() {
        return addresses;
    }

    public void setAddresses(List<Address> shipInformationsByUserId) {
        this.addresses = shipInformationsByUserId;
    }

    @OneToMany(mappedBy = "user")
    @OrderBy("recordDate DESC")
    public List<UserPricedRecord> getHistoryRecords() {
        return historyRecords;
    }

    public void setHistoryRecords(List<UserPricedRecord> userPricedRecordsByUserId) {
        this.historyRecords = userPricedRecordsByUserId;
    }

    @Override
    public String toString() {
        return username + " " + password;
    }
}
