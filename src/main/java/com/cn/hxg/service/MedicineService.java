package com.cn.hxg.service;

import com.cn.hxg.entity.Medicine;

public interface MedicineService {

    int deleteByPrimaryKey(String key);

    int insert(Medicine record);

    int insertSelective(Medicine record);

    Medicine selectByPrimaryKey(String key);

    int updateByPrimaryKeySelective(Medicine record);

    int updateByPrimaryKey(Medicine record);

}