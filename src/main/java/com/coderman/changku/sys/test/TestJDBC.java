package com.coderman.changku.sys.test;

import com.coderman.changku.sys.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest
public class TestJDBC {
    @Autowired
  private UserService userService;


    @Test
    public void testString(){
        String str="1-2-3-5-6-7-8";
        List<Integer> pids=new ArrayList<>();
        if(str.contains("-")){
            Integer roleId=Integer.parseInt(str.split("-")[0]);
            String substring = str.substring(1, -1);
            System.out.println(substring);
            System.out.println(roleId);
        }
    }

    @Test
    public void test(){
        System.out.println(userService);
    }
}
