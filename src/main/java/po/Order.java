package po;

import constant.OrderStatus;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Date;

/**
 * Created by 41159 on 2016/6/29.
 */
@Entity
@Table(name = "orders", schema = "bagery", catalog = "")
public class Order {
    private int orderId;
    private Integer userId;
    private int addressId;
    private Double total;
    private String orderStatus;
    private String instruction;
    private String courierNumber;
    private String courierCompany;
    private User user;
    private Address address;
    private Collection<Comment> comments;
    private Collection<OrderItem> orderItems;
    private Date createDate;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_id", nullable = false)
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    @Basic
    @Column(name = "user_id", nullable = true)
    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "ship_inf_id", nullable = false)
    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int shipInfId) {
        this.addressId = shipInfId;
    }

    @Basic
    @Column(name = "total", nullable = true, precision = 0)
    public Double getTotal() {
        total = 0.0;
        if (orderItems != null && orderItems.size() > 0) {
            for (OrderItem item : orderItems) {
                if (item != null) {
                    total += item.getTotalPrice();
                }
            }
        }
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
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
    @Column(name = "instruction", nullable = true, length = -1)
    public String getInstruction() {
        return instruction;
    }

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    @Basic
    @Column(name = "courier_number", nullable = true, length = 50)
    public String getCourierNumber() {
        return courierNumber;
    }

    public void setCourierNumber(String courierNumber) {
        this.courierNumber = courierNumber;
    }

    @Basic
    @Column(name = "courier_company", nullable = true, length = 20)
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

        Order order = (Order) o;

        if (orderId != order.orderId) return false;
        if (addressId != order.addressId) return false;
        if (userId != null ? !userId.equals(order.userId) : order.userId != null) return false;
        if (total != null ? !total.equals(order.total) : order.total != null) return false;
        if (instruction != null ? !instruction.equals(order.instruction) : order.instruction != null) return false;
        if (courierNumber != null ? !courierNumber.equals(order.courierNumber) : order.courierNumber != null)
            return false;
        if (courierCompany != null ? !courierCompany.equals(order.courierCompany) : order.courierCompany != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = orderId;
        result = 31 * result + (userId != null ? userId.hashCode() : 0);
        result = 31 * result + addressId;
        result = 31 * result + (total != null ? total.hashCode() : 0);
        result = 31 * result + (instruction != null ? instruction.hashCode() : 0);
        result = 31 * result + (courierNumber != null ? courierNumber.hashCode() : 0);
        result = 31 * result + (courierCompany != null ? courierCompany.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "order")
    public Collection<Comment> getComments() {
        return comments;
    }

    public void setComments(Collection<Comment> comment) {
        this.comments = comment;
    }

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "user_id", insertable = false, updatable = false)
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @OneToMany(mappedBy = "order", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    public Collection<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(Collection<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

    @Basic
    @Column(name = "create_date", nullable = true)
    @Temporal(TemporalType.TIMESTAMP)
    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    @Transient
    public boolean isNotCommented() {
        return orderStatus == null || orderStatus.equals(OrderStatus.COMPLETED) && (comments == null || comments.size() == 0);
    }

    @Transient
    public boolean isCommented() {
        return orderStatus.equals(OrderStatus.COMPLETED) && (comments != null && comments.size() > 0);
    }


    @ManyToOne
    @JoinColumn(name = "ship_inf_id", referencedColumnName = "ship_inf_id", nullable = false, insertable = false, updatable = false)
    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }


    @Transient
    public String getOrderStatusString() {
        switch (orderStatus) {
            case OrderStatus.UNPAID:
                return "待付款";
            case OrderStatus.UNSHIPPED:
                return "待发货";
            case OrderStatus.SHIPPED:
                return "已发货";
            case OrderStatus.COMPLETED:
                return "已收货";
            case OrderStatus.CANCELED:
                return "已取消";
            case OrderStatus.UNCOMMENT:
                return "待评价";
        }
        return "未知状态";
    }
}
