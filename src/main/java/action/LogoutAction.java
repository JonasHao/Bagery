package action;

import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.dispatcher.DefaultActionSupport;

public class LogoutAction extends DefaultActionSupport {
    public String logout(){
        try {
            ActionContext.getContext().getSession().clear();
            return SUCCESS;
        }
        catch(Exception e){
            return ERROR;
        }
    }

    public String index(){
        return SUCCESS;
    }
}
