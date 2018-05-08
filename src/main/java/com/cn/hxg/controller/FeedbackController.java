package com.cn.hxg.controller;

import com.cn.hxg.annotation.LoginRequired;
import com.cn.hxg.base.BaseController;
import com.cn.hxg.entity.Admin;
import com.cn.hxg.entity.Feedback;
import com.cn.hxg.restful.RestData;
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
 * Copyright (C), 2017，hxg Tec.
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

    /**
     * 增加意见反馈
     * @param feedback
     * @return
     */
    @RequestMapping("insert")
    @LoginRequired
    @ResponseBody
    public RestData insert(Feedback feedback) {
        RestData restData = new RestData();

        if (StringUtils.isEmpty(feedback.getDesc().trim())) {
            restData.setComment("反馈信息不能为空");
            return restData;
        }

        Admin admin = (Admin) getRequest().getSession().getAttribute("userInfo");

        feedback.setFeedTime(new Date());
        feedback.setStuName(admin.getRole());

        feedbackService.insert(feedback);
        restData.setSuccess(1);

        return restData;
    }

    /**
     * 根据id查询意见反馈列表
     * @param id
     * @return
     */
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
