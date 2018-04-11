package com.cn.hxg.common;

import java.util.ArrayList;
import java.util.List;

/**
 * Copyright (C), 2017，jumore Tec.
 * Author: hechengwen
 * Version:
 * Date: 2018/4/10 15:15
 * Description:
 * Others:
 */
public class Page {
    private Integer currentPage;
    private Integer prevPage;
    private Integer nextPage;
    private List<Object> showUsers =new ArrayList<Object>();
    private List<Integer> showPageNums =new ArrayList<Integer>();
    public Integer getCurrentPage() {
        return currentPage;
    }
    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }
    public Integer getPrevPage() {
        return prevPage;
    }
    public void setPrevPage(Integer prevPage) {
        this.prevPage = prevPage;
    }
    public Integer getNextPage() {
        return nextPage;
    }
    public void setNextPage(Integer nextPage) {
        this.nextPage = nextPage;
    }

    public List<Object> getShowUsers() {
        return showUsers;
    }

    public void setShowUsers(List<Object> showUsers) {
        this.showUsers = showUsers;
    }

    public List<Integer> getShowPageNums() {
        return showPageNums;
    }
    public void setShowPageNums(List<Integer> showPageNums) {
        this.showPageNums = showPageNums;
    }
}
