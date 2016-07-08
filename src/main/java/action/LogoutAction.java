package action;

import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.dispatcher.DefaultActionSupport;

/**
 * Created by zhang on 2016/7/8.
 */
public class LogoutAction extends DefaultActionSupport {
    public String logout(){
        ActionContext.getContext().getSession().clear();
        return SUCCESS;
    }

    public String index(){
        return SUCCESS;
    }
}
