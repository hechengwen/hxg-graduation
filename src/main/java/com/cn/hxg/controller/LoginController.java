package com.cn.hxg.controller;

import com.cn.hxg.base.BaseController;
import com.cn.hxg.entity.Admin;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * Author: huxiaogang
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
        String redirect = "";
        String userType = admin.getUserType();
        if (userType.equals("0")) {
        	//跳转到管理员controller方法
            redirect = "redirect:/admin/sysMain";
        } else if (userType.equals("1")) {
        	//跳转到学生controller方法
            redirect = "redirect:/admin/stuMain";
        }else if (userType.equals("2")){
        	//跳转到医生controller方法
        	redirect = "redirect:/admin/sysMain2";
        }
        return redirect;
    }
}
