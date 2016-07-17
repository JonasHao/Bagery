package service;

import po.Comment;

import java.util.List;

/**
 * Created by 小怪兽的奥特曼酱 on 2016/6/23.
 */

public interface CommentService {
    /**
     * 根据评论ID获取一条评论
     */
    Comment getByCommentId(int commentId);

    /**
     * 根据订单Id和PricedId获取一条评论
     */
    Comment getByPricedIdAndOrderId(int pricedId, int orderId);

    /**
     * 根据pricedId获取一坨评论
     */
    List<Comment> getByPricedId(int pricedId);

    /**
     * 新增一条评论
     *
     * @param comment 确保comment已经设置好userId, PricedId，否则会报错
     */
    void addComment(Comment comment);

    void saveComments(List<Comment> comments);

    /**
     * 在数据库中更新comment信息
     */
    void updateComment(Comment comment);

    /**
     * 删除数据库的commentId 对应comment记录
     */
    void deleteComment(int commentId);

    void updateComments(List<Comment> commentList);
}
