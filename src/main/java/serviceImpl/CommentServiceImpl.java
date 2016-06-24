package serviceImpl;

import dao.Dao;
import po.Comment;
import service.CommentService;

import java.util.List;

/**
 * Created by Ð¡¹ÖÊÞµÄ°ÂÌØÂü½´ on 2016/6/23.
 */
public class CommentServiceImpl implements CommentService {

    private Dao dao;

    @Override
    public Comment getByCommentId(int commentId) {
        return dao.get(Comment.class, commentId);
    }

    @Override
    public Comment getByPricedIdAndOrderId(int pricedId, int orderId) {
        return (Comment)dao.query("from Comment where pricedId=? and orderId=?")
                .setParameter(0, pricedId).setParameter(1, orderId).list().get(0);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Comment> getByPricedId(int pricedId) {
        return dao.query("from Comment where pricedId=?").setParameter(0, pricedId).list();
    }

    @Override
    public void addComment(Comment comment) {
        dao.save(comment);

    }

    @Override
    public void updateComment(Comment comment) {
        dao.update(comment);

    }

    @Override
    public void deleteComment(int commentId) {
        dao.delete(commentId);

    }
}
