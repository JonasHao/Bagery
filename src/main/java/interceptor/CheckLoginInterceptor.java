package interceptor;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionProxy;
import com.opensymphony.xwork2.interceptor.Interceptor;
import constant.Config;
import constant.Key;
import org.apache.struts2.StrutsStatics;


import javax.servlet.http.HttpServletRequest;
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
        if (ap.getNamespace().equals("/user") && (ap.getMethod().equals("login") || ap.getMethod().equals("register"))) {
            return invocation.invoke();
        }

        ActionContext actionContext = invocation.getInvocationContext();

        Map<String, Object> session = actionContext.getSession();
        Integer userId = (Integer) session.get(Key.USER);
        if (userId != null && userId > 0) {
            return invocation.invoke();
        }
        HttpServletRequest request = (HttpServletRequest) actionContext.get(StrutsStatics.HTTP_REQUEST);
        String queryString = request.getQueryString();
        if (queryString == null) {
            queryString = "";
        }
        String realPath = request.getRequestURI() + "?" + queryString;
        System.out.println(realPath + " realPath");
        session.put(Key.GOING_TO_URL, realPath);
        return Action.LOGIN;
    }

    @Override
    public void destroy() {

    }

}
