package interceptor;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionProxy;
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

        ActionProxy ap = invocation.getProxy();
        if (ap.getNamespace().equals("/user")  && (ap.getMethod().equals("login") || ap.getMethod().equals("register"))) {
            return invocation.invoke();
        }

        Map session = ActionContext.getContext().getSession();
        Integer userId = (Integer) session.get(Key.USER);
        if (userId != null && userId > 0) {
            return invocation.invoke();
        }

        System.out.println("Not Logged in.");
        return Action.LOGIN;
    }

    @Override
    public void destroy() {

    }

}
