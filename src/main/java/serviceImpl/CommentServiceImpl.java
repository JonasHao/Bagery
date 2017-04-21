package serviceImpl;

import dao.Dao;
import dao.OrderDao;
import po.Comment;
import service.CommentService;

import java.util.List;

public class CommentServiceImpl implements CommentService {
    private Dao dao;
    private OrderDao orderDao;

    @Override
    public Comment getByCommentId(int commentId) {
        return dao.get(Comment.class, commentId);
    }

    @Override
    @SuppressWarnings("unchecked")
    public Comment getByPricedIdAndOrderId(int pricedId, int orderId) {
        return orderDao.commentByPricedIdAndOrderId(pricedId, orderId);
    }

    @Override
    public List<Comment> getByPricedId(int pricedId) {
        return orderDao.commentByPricedId(pricedId);
    }

    @Override
    public void addComment(Comment comment) {
        dao.save(comment);
    }

    @Override
    public void saveComments(List<Comment> comments) {
        dao.saveM(comments, Comment.class.getSimpleName());
    }
    @Override
    public void updateComments(List<Comment> commentList) {
        dao.updateM(commentList, Comment.class.getSimpleName());
    }

    @Override
    public void updateComment(Comment comment) {
        dao.update(comment);
    }

    @Override
    public void deleteComment(int commentId) {
        dao.delete(dao.get(Comment.class, commentId));
    }

    public void setDao(Dao dao) {
        this.dao = dao;
    }

    public void setOrderDao(OrderDao orderDao) {
        this.orderDao = orderDao;
    }
}
