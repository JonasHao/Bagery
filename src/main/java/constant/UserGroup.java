package constant;

/**
 * Created by 41159 on 2016/6/29.
 */
public class UserGroup {

    public static final String PRODUCT_ADMIN = "product_admin"; //商品管理员
    public static final String ORDER_ADMIN = "order_admin"; //订单管理员
    public static final String REGULAR = "r";  //普通用户
    public static final String TONGPAI = "cu";  //铜牌用户
    public static final String YINPAI = "ag"; //银牌用户
    public static final String JINPAI = "au"; //金牌用户
    public static final String ROOT = "d"; //超级管理员

    public static final int TONGPAI_THRESHOLD = 1000;
    public static final int YINPAI_THRESHOLD= 10000;
    public static final int JINPAI_THRESHOLD= 100000;

}
