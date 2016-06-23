package service;

import po.Comment;

import java.util.List;

/**
 * Created by Koche on 2016/6/23.
 */
public interface CommentService {
    /**
     * 根据评论ID获取一条评论
     */
    Comment get(int commentId);

    /**
     * 根据订单Id和PricedId获取一条评论
     */
    Comment get(int orderId, int pricedId);

    /**
     * 新增一条评论
     * @param comment 确保comment已经设置好userId, PricedId，否则会报错
     */
    void add(Comment comment);

    /**
     * 在数据库中更新comment信息
     */
    void update(Comment comment);

    /**
     * 删除数据库的commentId 对应comment记录
     */
    void delete(int commentId);


}
