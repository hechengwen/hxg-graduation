package com.cn.hxg.controller;

import com.cn.hxg.annotation.LoginRequired;
import com.cn.hxg.base.BaseController;
import com.cn.hxg.entity.Admin;
import com.cn.hxg.entity.Feedback;
import com.cn.hxg.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

/**
 * Copyright (C), 2017，jumore Tec.
 * Author: hechengwen
 * Version:
 * Date: 2018/4/9 17:43
 * Description:
 * Others:意见反馈
 */

@Controller
@RequestMapping("feedback")
public class FeedbackController extends BaseController{

    @Autowired
    private FeedbackService feedbackService;

    @RequestMapping(value = "index")
    @LoginRequired
    public ModelAndView index(){
        return new ModelAndView("feedback");
    }

    @RequestMapping("insert")
    @LoginRequired
    public String insert(Feedback feedback){

        Admin admin = (Admin) getRequest().getSession().getAttribute("userInfo");

        feedback.setFeedTime(new Date());
        feedback.setStuName(admin.getRole());

        feedbackService.insert(feedback);

        return "redirect:/admin/stuMain";
    }

}
