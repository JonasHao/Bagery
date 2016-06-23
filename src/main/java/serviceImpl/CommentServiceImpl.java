package serviceImpl;

import po.Comment;
import service.CommentService;

import java.util.List;

/**
 * Created by 41159 on 2016/6/23.
 */
public class CommentServiceImpl implements CommentService {

//    private

    @Override
    public Comment getByCommentId(int commentId) {

        return null;
    }

    @Override
    public Comment getByPricedIdAndOrderId(int pricedId, int orderId) {
        return null;
    }

    @Override
    public List<Comment> getByPricedId(int pricedId) {
        return null;
    }

    @Override
    public void addComment(Comment comment) {

    }

    @Override
    public void updateComment(Comment comment) {

    }

    @Override
    public void deleteComment(int commentId) {

    }
}
