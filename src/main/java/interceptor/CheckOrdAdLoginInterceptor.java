package interceptor;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import constant.Config;
import constant.Key;
import serviceImpl.UserServiceImpl;

import java.util.Map;

/**
 * Created by zhang on 2016/6/29.
 */
public class CheckOrdAdLoginInterceptor implements Interceptor{
    @Override
    public void destroy() {

    }

    @Override
    public void init() {

    }

    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
        if (Config.DEBUG) {
            return invocation.invoke();
        }

        Map session = ActionContext.getContext().getSession();
        String username=(String)session.get(Key.USER);

        //todo: Try to use Spring to inject dependence with Services
        UserServiceImpl userService=new UserServiceImpl();

        if(username.equals(null))
            return Action.LOGIN;
        else
        {
            String  usergroup=userService.getUserGroup(username);
            if(usergroup.equals("ORDER_ADMIN"))
            {
                return Action.SUCCESS;
            }
            else
                return Action.ERROR;
        }
    }
}
