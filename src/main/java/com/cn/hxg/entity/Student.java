package com.cn.hxg.entity;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.EqualsAndHashCode;

import com.cn.hxg.base.BaseObject;


@Data
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
@NoArgsConstructor
public class Student extends BaseObject {

    /** 学号 */
    private String sno;

    /** 姓名 */
    private String name;

    /** 性别 */
    private String sex;

    /** 出生日期 */
    private Date birth;

    /** 入学时间 */
    private Date rxsj;

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