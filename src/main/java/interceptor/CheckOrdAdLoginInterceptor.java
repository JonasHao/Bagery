package interceptor;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import constant.Config;
import constant.Key;
import constant.UserGroup;
import service.UserService;
import serviceImpl.UserServiceImpl;

import java.util.Map;

/**
 * Created by zhang on 2016/6/29.
 */
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
            String userGroup = userService.get(userId).getUserGroup();
            if (userGroup.equals(UserGroup.ORDER_ADMIN) || userGroup.equals(UserGroup.ROOT)) {
                return invocation.invoke();
            } else
                return "invalid";
        }

    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
