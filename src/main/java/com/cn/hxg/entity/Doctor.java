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
public class Doctor extends BaseObject {

    /** 医生编号 */
    private String sno;

    /** 姓名 */
    private String name;

    /** 性别 */
    private String sex;

    /** 出生日期 */
    private Date birth;

    /** 从业年份 */
    private Date cynf;

    /** 联系电话 */
    private String tel;

    /** 邮箱 */
    private String email;


}