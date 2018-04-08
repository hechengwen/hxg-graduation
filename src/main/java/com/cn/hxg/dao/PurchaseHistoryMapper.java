package com.cn.hxg.dao;

import com.cn.hxg.entity.PurchaseHistory;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PurchaseHistoryMapper {

    int deleteByPrimaryKey(Integer key);

    int insert(PurchaseHistory record);

    int insertSelective(PurchaseHistory record);

    PurchaseHistory selectByPrimaryKey(Integer key);

    int updateByPrimaryKeySelective(@Param("record") PurchaseHistory record);

    int updateByPrimaryKey(@Param("record") PurchaseHistory record);

}