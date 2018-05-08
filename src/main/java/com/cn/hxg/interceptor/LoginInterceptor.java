package com.cn.hxg.interceptor;

import com.cn.hxg.annotation.LoginRequired;
import com.cn.hxg.entity.Admin;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;

/**
 * 
 * Author: huxiaogang
 * Version:
 * Date: 2018/4/9 13:28
 * Description:
 * Others:
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        // 如果不是映射到方法直接通过
        if (!(o instanceof HandlerMethod)) {
            return true;
        }

        HandlerMethod handlerMethod = (HandlerMethod) o;
        Object bean = handlerMethod.getBean();
        Method method = handlerMethod.getMethod();
        LoginRequired loginRequired = bean.getClass().getAnnotation(LoginRequired.class); //类上有该标记
        LoginRequired methodAnnotation = method.getAnnotation(LoginRequired.class);// 方法上有该标记
        if (methodAnnotation != null) {
            Admin admin = (Admin) httpServletRequest.getSession().getAttribute("userInfo");
            if (admin == null) {
                httpServletResponse.sendRedirect("/admin/index");
                return false;
            }
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
