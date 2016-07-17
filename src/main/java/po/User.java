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
    private String userGroup;
    private String email;
    private String img;
    private int score;
    private Integer defaultAddressId;
    private byte isActivate;
    private Address defaultAddress;
    private Collection<Comment> comments;
    private Collection<Order> orders;
    private Collection<Address> Addresses;
    private Collection<HistoryRecord> historyRecords;
    private Collection<CartItem> cartItems;
    private Collection<FavoriteItem> favoriteItems;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id", nullable = false)
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "username", nullable = false, length = 30)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "password", nullable = false, length = 100)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "realname", nullable = true, length = 30)
    public String getRealName() {
        return realName;
    }

    public void setRealName(String realname) {
        this.realName = realname;
    }

    @Basic
    @Column(name = "email", nullable = true, length = 30)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "img", nullable = true, length = -1)
    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
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
    @Column(name = "score", nullable = false)
    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
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
    @Column(name = "is_activate", nullable = false)
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
        result = 31 * result + isActivate;
        return result;
    }

    @OneToMany(mappedBy = "user")
    public Collection<Comment> getComments() {
        return comments;
    }

    public void setComments(Collection<Comment> comments) {
        this.comments = comments;
    }

    @OneToMany(mappedBy = "user")
    @OrderBy("orderId DESC")
    public Collection<Order> getOrders() {
        return orders;
    }

    public void setOrders(Collection<Order> orders) {
        this.orders = orders;
    }

    @OneToMany(mappedBy = "user")
    @OrderBy("addressId DESC")
    public Collection<Address> getAddresses() {
        return Addresses;
    }

    public void setAddresses(Collection<Address> addresses) {
        Addresses = addresses;
    }

    @ManyToOne
    @JoinColumn(name = "def_ship_inf_id", referencedColumnName = "ship_inf_id", insertable = false, updatable = false)
    public Address getDefaultAddress() {
        return defaultAddress;
    }

    public void setDefaultAddress(Address defaultAddress) {
        this.defaultAddress = defaultAddress;
    }

    @OneToMany(mappedBy = "user")
    @OrderBy("")
    public Collection<HistoryRecord> getHistoryRecords() {
        return historyRecords;
    }

    public void setHistoryRecords(Collection<HistoryRecord> historyRecords) {
        this.historyRecords = historyRecords;
    }

    @OneToMany(mappedBy = "user")
    @OrderBy("itemId DESC")
    public Collection<CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(Collection<CartItem> cartItems) {
        this.cartItems = cartItems;
    }

    @OneToMany(mappedBy = "user")
    public Collection<FavoriteItem> getFavoriteItems() {
        return favoriteItems;
    }

    public void setFavoriteItems(Collection<FavoriteItem> favoriteItems) {
        this.favoriteItems = favoriteItems;
    }
}
