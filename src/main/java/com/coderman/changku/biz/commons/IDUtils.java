package com.coderman.changku.biz.commons;

import java.util.UUID;

public class IDUtils
{
  public static String getUUID()
  {
    return UUID.randomUUID().toString();
  }
  
  public static String getGUID()
  {
    return getUUID().toUpperCase().replaceAll("-", "");
  }
  
  public static double getRandom()
  {
    return Math.random();
  }
  
  public static long getRandomLong()
  {
    double r = getRandom();
    long ins = Math.round(r * 1.0E8D);
    return ins;
  }
  
  public static void main(String[] args)
  {
    System.out.println(getUUID());
    for (int i = 0; i < 10; i++) {
      System.out.println(getGUID());
    }
    System.out.println(getRandomLong());
  }
}
