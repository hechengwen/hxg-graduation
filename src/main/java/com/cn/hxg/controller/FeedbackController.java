package com.cn.hxg.controller;

import com.cn.hxg.annotation.LoginRequired;
import com.cn.hxg.base.BaseController;
import com.cn.hxg.entity.Admin;
import com.cn.hxg.entity.Feedback;
import com.cn.hxg.service.FeedbackService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
public class FeedbackController extends BaseController {

    private SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @Autowired
    private FeedbackService feedbackService;

    @RequestMapping(value = "index")
    @LoginRequired
    public ModelAndView index() {
        return new ModelAndView("feedback");
    }

    @RequestMapping("insert")
    @LoginRequired
    public String insert(Feedback feedback) {

        Admin admin = (Admin) getRequest().getSession().getAttribute("userInfo");

        feedback.setFeedTime(new Date());
        feedback.setStuName(admin.getRole());

        feedbackService.insert(feedback);

        return "redirect:/admin/stuMain";
    }

    @RequestMapping("/getList")
    @LoginRequired
    public ModelAndView getList(@RequestParam(value = "id", required = false) String id) {
        ModelAndView modelAndView = new ModelAndView("yijianfankuixinxi");

        List<Feedback> feedbacks = feedbackService.getList(id);

        for (Feedback feedback : feedbacks) {
            Date feedTime = feedback.getFeedTime();
            feedback.setFeedTimeStr(simpleDateFormat.format(feedTime));
        }

        modelAndView.addObject("feedbacks", feedbacks);

        return modelAndView;
    }

}