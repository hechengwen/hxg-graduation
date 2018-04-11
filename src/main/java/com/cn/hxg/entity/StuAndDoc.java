package com.cn.hxg.entity;

import com.cn.hxg.base.BaseObject;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * Copyright (C), 2017，jumore Tec.
 * Author: hechengwen
 * Version:
 * Date: 2018/4/10 20:20
 * Description:
 * Others:
 */
@Data
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
@NoArgsConstructor
public class StuAndDoc extends BaseObject {


    /** 员工号 */
    private String warden;

    /** 密码 */
    private String password;

    private String userType;

    /** 从业年份 */
    private String cynf;

    /** 姓名 */
    private String username;

    /** 性别 */
    private String sex;

    /** 出生日期 */
    private String birth;

    /** 入学时间 */
    private String rxsj;

    /** 学制 */
    private Integer xz;

    /** 系部 */
    private String xb;

    /** 班级 */
    private String bj;

    /** 宿舍 */
    private String room;

    /** 联系电话 */
    private String tel;

    /** 邮箱 */
    private String email;
}
