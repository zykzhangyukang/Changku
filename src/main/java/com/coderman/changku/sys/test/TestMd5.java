package com.coderman.changku.sys.test;

import com.coderman.changku.sys.commons.Constast;
import org.apache.shiro.crypto.hash.Md5Hash;

/**
 * Created by zhangyukang on 2019/10/29 20:18
 */
public class TestMd5 {
    public static void main(String[] args){
        String password = new Md5Hash(Constast.DEFAULT_PASSWORD, "04A93C74C8294AA09A8B974FD1F4ECBB", Constast.MD5_TIME).toString();
        System.out.println(password);
    }
}
