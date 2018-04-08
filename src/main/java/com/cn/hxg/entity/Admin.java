package com.cn.hxg.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.EqualsAndHashCode;

import com.cn.hxg.base.BaseObject;


@Data
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
@NoArgsConstructor
public class Admin extends BaseObject {

    /** 员工号 */
    private String warden;

    /** 密码 */
    private String password;

    /** 姓名 */
    private String role;


}