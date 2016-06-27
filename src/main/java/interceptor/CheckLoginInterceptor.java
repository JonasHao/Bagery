package interceptor;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

import java.util.Map;


public class CheckLoginInterceptor implements Interceptor {

    @Override
    public void init() {

    }

    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
        Map session = ActionContext.getContext().getSession();
        String userName = (String) session.get("userName");
        if(userName!=null){
            return invocation.invoke();
        }
        return Action.LOGIN;
    }

    @Override
    public void destroy() {

    }

}
