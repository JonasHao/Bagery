package Test;

import service.UserService;
import serviceImpl.UserServiceImpl;

/**
 * Created by zhang on 2016/6/28.
 */
public class TestUser {
    public void main(String[] args){
        UserServiceImpl userService=new UserServiceImpl();
        System.out.println(userService.existUsername("cc"));
    }
}
