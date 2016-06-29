package po;

import javax.persistence.*;

/**
 * Created by 41159 on 2016/6/29.
 */
@Entity
public class Comment {
    private int commentId;
    private String content1;
    private String content2;
    private String adminContent;
    private Integer star;
    private int pricedId;
    private int userId;
    private int orderId;
    private User userByUserId;
    private Priced pricedByPricedId;
    private Order orderByOrderId;

    @Id
    @Column(name = "comment_id", nullable = false, insertable = true, updatable = true)
    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    @Basic
    @Column(name = "content1", nullable = true, insertable = true, updatable = true, length = 65535)
    public String getContent1() {
        return content1;
    }

    public void setContent1(String content1) {
        this.content1 = content1;
    }

    @Basic
    @Column(name = "content2", nullable = true, insertable = true, updatable = true, length = 65535)
    public String getContent2() {
        return content2;
    }

    public void setContent2(String content2) {
        this.content2 = content2;
    }

    @Basic
    @Column(name = "admin_content", nullable = true, insertable = true, updatable = true, length = 65535)
    public String getAdminContent() {
        return adminContent;
    }

    public void setAdminContent(String adminContent) {
        this.adminContent = adminContent;
    }

    @Basic
    @Column(name = "star", nullable = true, insertable = true, updatable = true)
    public Integer getStar() {
        return star;
    }

    public void setStar(Integer star) {
        this.star = star;
    }

    @Basic
    @Column(name = "priced_id", nullable = false, insertable = true, updatable = true)
    public int getPricedId() {
        return pricedId;
    }

    public void setPricedId(int pricedId) {
        this.pricedId = pricedId;
    }

    @Basic
    @Column(name = "user_id", nullable = false, insertable = true, updatable = true)
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "order_id", nullable = false, insertable = true, updatable = true)
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Comment comment = (Comment) o;

        if (commentId != comment.commentId) return false;
        if (pricedId != comment.pricedId) return false;
        if (userId != comment.userId) return false;
        if (orderId != comment.orderId) return false;
        if (content1 != null ? !content1.equals(comment.content1) : comment.content1 != null) return false;
        if (content2 != null ? !content2.equals(comment.content2) : comment.content2 != null) return false;
        if (adminContent != null ? !adminContent.equals(comment.adminContent) : comment.adminContent != null)
            return false;
        if (star != null ? !star.equals(comment.star) : comment.star != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = commentId;
        result = 31 * result + (content1 != null ? content1.hashCode() : 0);
        result = 31 * result + (content2 != null ? content2.hashCode() : 0);
        result = 31 * result + (adminContent != null ? adminContent.hashCode() : 0);
        result = 31 * result + (star != null ? star.hashCode() : 0);
        result = 31 * result + pricedId;
        result = 31 * result + userId;
        result = 31 * result + orderId;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "user_id", nullable = false)
    public User getUserByUserId() {
        return userByUserId;
    }

    public void setUserByUserId(User userByUserId) {
        this.userByUserId = userByUserId;
    }

    @ManyToOne
    @JoinColumn(name = "priced_id", referencedColumnName = "priced_id", nullable = false)
    public Priced getPricedByPricedId() {
        return pricedByPricedId;
    }

    public void setPricedByPricedId(Priced pricedByPricedId) {
        this.pricedByPricedId = pricedByPricedId;
    }

    @ManyToOne
    @JoinColumn(name = "order_id", referencedColumnName = "order_id", nullable = false)
    public Order getOrderByOrderId() {
        return orderByOrderId;
    }

    public void setOrderByOrderId(Order orderByOrderId) {
        this.orderByOrderId = orderByOrderId;
    }
}
