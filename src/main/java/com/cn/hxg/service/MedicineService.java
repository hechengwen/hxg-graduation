package com.cn.hxg.service;

import com.cn.hxg.entity.Medicine;

import java.util.List;

public interface MedicineService {

    int deleteByPrimaryKey(int key);

    int insert(Medicine record);

    int insertSelective(Medicine record);

    Medicine selectByPrimaryKey(int key);

    int updateByPrimaryKeySelective(Medicine record);

    int updateByPrimaryKey(Medicine record);

    int getAllTotal();

    List getAll(Integer pageNum, Integer pageSize,String data);

}