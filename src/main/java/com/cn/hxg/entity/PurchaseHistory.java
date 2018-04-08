package com.cn.hxg.entity;

import java.util.Date;
import java.math.BigDecimal;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.EqualsAndHashCode;

import com.cn.hxg.base.BaseObject;


@Data
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
@NoArgsConstructor
public class PurchaseHistory extends BaseObject {

    /** 流水号 */
    private Integer id;

    /** 编号 */
    private String bh;

    /** 就诊时间 */
    private Date clinicDate;

    /** 药品编号 */
    private String drugNum;

    /** 药品进价 */
    private BigDecimal drugPrice;

    /** 销售价 */
    private BigDecimal price;

    /** 医疗费 */
    private BigDecimal cost;


}