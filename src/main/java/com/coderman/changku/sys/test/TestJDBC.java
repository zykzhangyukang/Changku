package com.coderman.changku.sys.test;

import com.coderman.changku.sys.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest
public class TestJDBC {
    @Autowired
  private UserService userService;

    @Test
    public void test(){
        System.out.println(userService);
    }
}
