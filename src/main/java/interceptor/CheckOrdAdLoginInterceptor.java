package interceptor;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import constant.Config;
import constant.Key;
import constant.UserGroup;
import org.hibernate.HibernateException;
import service.UserService;

import java.util.Map;

public class CheckOrdAdLoginInterceptor implements Interceptor {
    private UserService userService;

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
        Integer userId = (Integer) session.get(Key.USER);

        if (userId == null)
            return Action.LOGIN;
        else {
            String userGroup = null;
            try {
                userGroup = userService.get(userId).getUserGroup();
            } catch (HibernateException e) {
                e.printStackTrace();
            }
            if (userGroup != null && (userGroup.equals(UserGroup.ORDER_ADMIN) || userGroup.equals(UserGroup.ROOT))) {
                return invocation.invoke();
            } else
                return "invalid";
        }

    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
