package interceptor;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import constant.Config;
import constant.Key;


import java.util.Map;

public class CheckLoginInterceptor implements Interceptor {



    @Override
    public void init() {

    }

    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
        if (Config.DEBUG) {
            return invocation.invoke();
        }

        Map session = ActionContext.getContext().getSession();
        int userId = (int) session.get(Key.USER);
        if (userId>0){
            return Action.SUCCESS;
        }
        return Action.LOGIN;
    }

    @Override
    public void destroy() {

    }

}
