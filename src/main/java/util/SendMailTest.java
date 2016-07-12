package util;

/**
 * Created by Vincent on 7/12/2016.
 */
public class SendMailTest {
    public static void main(String[] args){
        try {
            SendMail.sendOneMail("title","contetn","707119577@qq.com");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
