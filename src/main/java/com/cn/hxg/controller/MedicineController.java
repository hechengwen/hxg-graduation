package com.cn.hxg.controller;

import com.cn.hxg.annotation.LoginRequired;
import com.cn.hxg.base.BaseController;
import com.cn.hxg.entity.Admin;
import com.cn.hxg.entity.Medicine;
import com.cn.hxg.restful.RestData;
import com.cn.hxg.service.MedicineService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Copyright (C), 2017，jumore Tec.
 * Author: hechengwen
 * Version:
 * Date: 2018/4/10 10:54
 * Description:
 * Others:药品管理
 */
@RequestMapping("medicine")
@Controller
public class MedicineController extends BaseController {

    @Autowired
    private MedicineService medicineService;

    @RequestMapping("index")
    @LoginRequired
    public ModelAndView index() {
        Admin admin = (Admin) getRequest().getSession().getAttribute("userInfo");
        if (admin == null) {
            return new ModelAndView("index");
        }
        return new ModelAndView("yaopin_add");
    }

    @RequestMapping("/insert")
    @LoginRequired
    @ResponseBody
    public RestData insert(Medicine medicine) {
        RestData rest = new RestData();

        if (StringUtils.isEmpty(medicine.getDrugName())
                || StringUtils.isEmpty(medicine.getProductionDate())
                || StringUtils.isEmpty(medicine.getEffectiveDate())
                || StringUtils.isEmpty(medicine.getProductionEnterprise())
                || StringUtils.isEmpty(medicine.getStockUnits())
                || StringUtils.isEmpty(medicine.getContactPerson())
                || medicine.getBuyPrice() == null
                || medicine.getSellerPrice() == null) {
            rest.setComment("必填参数不能为空");
            return rest;
        }

        if (medicine.getDrugNum() == null) {
            medicineService.insert(medicine);
            rest.setSuccess(1);
            return rest;
        } else {
            int id = medicine.getDrugNum();

            Medicine medicine1 = medicineService.selectByPrimaryKey(id);
        }
        return rest;
    }

    @RequestMapping("/delete")
    @ResponseBody
    @LoginRequired
    public RestData delete(String drugNum) {
        Medicine medicine = medicineService.selectByPrimaryKey(Integer.valueOf(drugNum));
        if (medicine == null) {
            return new RestData(0, "记录不存在", "");
        }
        medicineService.deleteByPrimaryKey(Integer.valueOf(drugNum));
        return new RestData(1, null, null);
    }


    @RequestMapping("/select")
    @LoginRequired
    public ModelAndView select(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("yaopinxinxi");

        String data = request.getParameter("data");

        List medicines = medicineService.getAll(null, null, data);

        modelAndView.addObject("page", medicines);
        return modelAndView;
    }

}
