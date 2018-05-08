package com.cn.hxg.controller;

import com.cn.hxg.annotation.LoginRequired;
import com.cn.hxg.base.BaseController;
import com.cn.hxg.entity.Admin;
import com.cn.hxg.entity.Register;
import com.cn.hxg.entity.RegisterData;
import com.cn.hxg.restful.RestData;
import com.cn.hxg.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.List;

/**
 * 
 * Author: huxiaogang
 * Version:
 * Date: 2018/4/10 19:52
 * Description:
 * Others:就诊记录管理
 */
@Controller
@RequestMapping("medicalRecords")
public class MedicalRecordsController extends BaseController{

}
