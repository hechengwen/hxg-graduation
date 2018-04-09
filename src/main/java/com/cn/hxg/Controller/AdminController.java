package com.cn.hxg.controller;

import com.cn.hxg.annotation.LoginRequired;
import com.cn.hxg.base.BaseController;
import com.cn.hxg.entity.Admin;
import com.cn.hxg.restful.RestData;
import com.cn.hxg.service.AdminService;
import com.cn.hxg.utils.MD5;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.management.relation.Role;

/**
 * Copyright (C), 2017，jumore Tec.
 * Author: hechengwen
 * Version:
 * Date: 2018/4/8 17:42
 * Description:
 * Others:
 */
@RequestMapping("admin")
@Controller
public class AdminController extends BaseController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/insert")
    @ResponseBody
    @LoginRequired
    public RestData insert(@RequestParam("username") String username, @RequestParam("password") String password,String userType) {
        RestData restData = new RestData();

        if (StringUtils.isBlank(username) || StringUtils.isBlank(password)) {
            restData.setComment("用户名或密码不能为空");
            restData.setSuccess(0);
            return restData;
        }

        Admin admin = adminService.selectByRole(username,userType);
        if (admin != null) {
            restData.setComment("用户已经存在");
            restData.setSuccess(0);
            return restData;
        }

        Admin admin1 = new Admin();
        admin1.setPassword(MD5.MD5(password));
        admin1.setRole(username);
        adminService.insert(admin1);

        restData.setSuccess(1);
        return restData;
    }

    @RequestMapping("index")
    public ModelAndView index() {
        return new ModelAndView("index");
    }

    @RequestMapping(value = "login")
    @ResponseBody
    public RestData login(String username, String password, String userType) {

        RestData restData = new RestData();

        if (StringUtils.isBlank(username) || StringUtils.isBlank(password)) {
            restData.setComment("用户名或密码不能为空");
            restData.setSuccess(0);
            return restData;
        }

        Admin admin = adminService.selectByRole(username,userType);

        if (admin == null) {
            restData.setComment("用户名不存在");
            restData.setSuccess(0);
            return restData;
        }

        if (!MD5.MD5(password.trim()).equals(admin.getPassword())) {
            logger.info("密码错误...");
            restData.setComment("密码错误");
            restData.setSuccess(0);
            return restData;
        }

        // 登陆成功设置session
        getRequest().getSession().setAttribute("userInfo", admin);
        getRequest().getSession().setAttribute("g_name", admin.getRole());

        restData.setSuccess(1);
        return restData;
    }

    @RequestMapping(value = "/logout")
    @LoginRequired
    public ModelAndView logout() {
        getRequest().getSession().invalidate();
        return new ModelAndView("index");
    }

    @RequestMapping(value = "/main")
    @LoginRequired
    public ModelAndView main() {
        ModelAndView model = new ModelAndView("main");

        Admin admin = (Admin) getRequest().getSession().getAttribute("userInfo");

        model.addObject("username", admin.getRole());

        return model;
    }
}


