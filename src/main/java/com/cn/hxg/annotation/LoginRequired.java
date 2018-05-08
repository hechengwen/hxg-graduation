package com.cn.hxg.annotation;

import java.lang.annotation.*;

/**
 * 
 * Author: huxiaogang
 * Version:
 * Date: 2018/4/9 13:27
 * Description:
 * Others:
 */
@Documented
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.METHOD,ElementType.TYPE})
public @interface LoginRequired {
}
