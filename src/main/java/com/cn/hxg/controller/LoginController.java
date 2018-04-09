package com.cn.hxg.controller;

import com.cn.hxg.base.BaseController;
import com.cn.hxg.entity.Admin;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Copyright (C), 2017，jumore Tec.
 * Author: hechengwen
 * Version:
 * Date: 2018/4/9 19:10
 * Description:
 * Others:
 */
@Controller
public class LoginController extends BaseController{

    @RequestMapping("/")
    public String index(){
        Admin admin = (Admin) getRequest().getSession().getAttribute("userInfo");
        if (admin == null) {
            return "index";
        }
        return "redirect:/admin/stuMain";
    }
}
