package com.cn.hxg.dao;

import com.cn.hxg.entity.Feedback;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FeedbackMapper {

    int deleteByPrimaryKey(Integer key);

    int insert(Feedback record);

    int insertSelective(Feedback record);

    Feedback selectByPrimaryKey(Integer key);

    int updateByPrimaryKeySelective(@Param("record") Feedback record);

    int updateByPrimaryKey(@Param("record") Feedback record);

    List<Feedback> getList(@Param("id") String id);

}