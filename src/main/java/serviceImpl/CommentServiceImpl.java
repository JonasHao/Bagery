package serviceImpl;

import dao.Dao;
import po.Comment;
import service.CommentService;

import java.util.List;


public class CommentServiceImpl implements CommentService {

    private Dao dao;

    @Override
    public Comment getByCommentId(int commentId) {
        return dao.get(Comment.class, commentId);
    }

    @Override
    @SuppressWarnings("unchecked")
    public Comment getByPricedIdAndOrderId(int pricedId, int orderId) {
        List<Comment> comments = dao.query("from Comment where pricedId=? and orderId=?")
                .setParameter(0, pricedId).setParameter(1, orderId).list();
        if (comments.size() != 1) {
            return null;
        }
        return comments.get(0);
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
    public void saveComments(List<Comment> comments) {
        dao.saveM(comments, Comment.class.getSimpleName());
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
}
