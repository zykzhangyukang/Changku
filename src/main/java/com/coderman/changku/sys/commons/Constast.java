package com.coderman.changku.sys.commons;

/**
 * 常量
 */
public interface Constast {
    /**
     * 状态码
     */
    public static  final Integer OK=200;
    public static  final Integer ERROR=-1;
    /**
     * 菜单类型
     */
    public static final  String MENU_TYPE="menu";
    public static final  String PERMISSION_TYPE="permission";
    /**
     * 可用类型
     */
    Integer AVAILABLE_TRUE = 1;
    Integer AVAILABLE_FALSE = 0;
    /**
     * 展开类型
     */
    Integer OPEN_TRUE = 1;
    /**
     * 用户类型
     */
    Integer USER_TYPE = 1;
    /**
     * IP
     */
    String IP_ADDRESS = "本机IP";

    /**
     * 用户的默认密码
     */
    Object DEFAULT_PASSWORD = "123456";
    /**
     * 加密的次数
     */
    int MD5_TIME = 1024;
}
