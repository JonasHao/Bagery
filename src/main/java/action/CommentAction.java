package action;

import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.dispatcher.DefaultActionSupport;
import po.Comment;
import service.CommentService;

import java.util.List;

public class CommentAction extends DefaultActionSupport {

    private CommentService commentService;
    //�������ݿ�CRUD�Ķ���
    private List<Comment> comments;
    private Comment comment;

    private int commentId;
    private int pricedId;
    private int orderId;

    private String content1;
    private int star;
    private String content2;
    private String adminContent;

    //�û�/�ÿͲ鿴����
    public String viewComment() throws Exception {
        comments = commentService.getByPricedId(pricedId);
        ActionContext.getContext().getSession().put("comments", comments);
        return SUCCESS;
    }



    //�û�׷������
    public String appendComment() {
        comment = commentService.getByPricedIdAndOrderId(pricedId, orderId);
        comment.setContent2(content1);
        commentService.updateComment(comment);
        return SUCCESS;
    }


    //����Աɾ������
    public String deleteComment() {
        commentService.deleteComment(commentId);
        return SUCCESS;
    }

    //����Ա�ظ�����
    public String replyComment() {
        comment = commentService.getByCommentId(commentId);
        comment.setAdminContent(adminContent);
        commentService.updateComment(comment);
        return SUCCESS;
    }


    public CommentService getCommentService() {
        return commentService;
    }

    public void setCommentService(CommentService commentService) {
        this.commentService = commentService;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public int getPricedId() {
        return pricedId;
    }

    public void setPricedId(int pricedId) {
        this.pricedId = pricedId;
    }

    public String getAdminContent() {
        return adminContent;
    }

    public void setAdminContent(String adminContent) {
        this.adminContent = adminContent;
    }

    public String getContent1() {
        return content1;
    }

    public void setContent1(String content1) {
        this.content1 = content1;
    }

    public String getContent2() {
        return content2;
    }

    public void setContent2(String content2) {
        this.content2 = content2;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }


}
