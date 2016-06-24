package po;

import javax.persistence.*;
import java.util.Collection;

/**
 * Created by 41159 on 2016/6/23.
 */
@Entity
public class Orders {
    private int orderId;
    private int userId;
    private int shipInfId;
    private Integer total;
    private String instruction;
    private String orderStatus;
    private String courierNumber;
    private String courierCompany;
    private Collection<Comment> commentsByOrderId;
    private Collection<OrderItem> orderItemsByOrderId;
    private User userByUserId;

    @Id
    @Column(name = "order_id", nullable = false, insertable = true, updatable = true)
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    @Basic
    @Column(name = "user_id", nullable = false, insertable = false, updatable = false)
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "ship_inf_id", nullable = false, insertable = false, updatable = false)
    public int getShipInfId() {
        return shipInfId;
    }

    public void setShipInfId(int shipInfId) {
        this.shipInfId = shipInfId;
    }

    @Basic
    @Column(name = "total", nullable = true, insertable = true, updatable = true, precision = 0)
    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    @Basic
    @Column(name = "instruction", nullable = true, insertable = true, updatable = true, length = 65535)
    public String getInstruction() {
        return instruction;
    }

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    @Basic
    @Column(name = "order_status", nullable = false, insertable = true, updatable = true, length = 9)
    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    @Basic
    @Column(name = "courier_number", nullable = true, insertable = true, updatable = true, length = 50)
    public String getCourierNumber() {
        return courierNumber;
    }

    public void setCourierNumber(String courierNumber) {
        this.courierNumber = courierNumber;
    }

    @Basic
    @Column(name = "courier_company", nullable = true, insertable = true, updatable = true, length = 20)
    public String getCourierCompany() {
        return courierCompany;
    }

    public void setCourierCompany(String courierCompany) {
        this.courierCompany = courierCompany;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Orders orders = (Orders) o;

        if (orderId != orders.orderId) return false;
        if (userId != orders.userId) return false;
        if (shipInfId != orders.shipInfId) return false;
        if (total != null ? !total.equals(orders.total) : orders.total != null) return false;
        if (instruction != null ? !instruction.equals(orders.instruction) : orders.instruction != null) return false;
        if (orderStatus != null ? !orderStatus.equals(orders.orderStatus) : orders.orderStatus != null) return false;
        if (courierNumber != null ? !courierNumber.equals(orders.courierNumber) : orders.courierNumber != null)
            return false;
        if (courierCompany != null ? !courierCompany.equals(orders.courierCompany) : orders.courierCompany != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = orderId;
        result = 31 * result + userId;
        result = 31 * result + shipInfId;
        result = 31 * result + (total != null ? total.hashCode() : 0);
        result = 31 * result + (instruction != null ? instruction.hashCode() : 0);
        result = 31 * result + (orderStatus != null ? orderStatus.hashCode() : 0);
        result = 31 * result + (courierNumber != null ? courierNumber.hashCode() : 0);
        result = 31 * result + (courierCompany != null ? courierCompany.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "ordersByOrderId")
    public Collection<Comment> getCommentsByOrderId() {
        return commentsByOrderId;
    }

    public void setCommentsByOrderId(Collection<Comment> commentsByOrderId) {
        this.commentsByOrderId = commentsByOrderId;
    }

    @OneToMany(mappedBy = "ordersByOrderId")
    public Collection<OrderItem> getOrderItemsByOrderId() {
        return orderItemsByOrderId;
    }

    public void setOrderItemsByOrderId(Collection<OrderItem> orderitemsByOrderId) {
        this.orderItemsByOrderId = orderitemsByOrderId;
    }

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "user_id", nullable = false)
    public User getUserByUserId() {
        return userByUserId;
    }

    public void setUserByUserId(User userByUserId) {
        this.userByUserId = userByUserId;
    }
}
