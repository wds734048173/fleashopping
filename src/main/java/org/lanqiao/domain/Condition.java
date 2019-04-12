package org.lanqiao.domain;

import lombok.*;

import java.util.Date;

/*
* 搜索条件封装
* */
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
@Builder
public class Condition {
    private String name;
    private int state;
    private String goodsClassId;
    private Date date;
    private int bId;
    private int sId;

    private int currentPage;
    private int pageSize;

    public Condition() {
    }

    public Condition(String name, int state, String goodsClassId, Date date, int bId, int sId, int currentPage, int pageSize) {
        this.name = name;
        this.state = state;
        this.goodsClassId = goodsClassId;
        this.date = date;
        this.bId = bId;
        this.sId = sId;
        this.currentPage = currentPage;
        this.pageSize = pageSize;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getGoodsClassId() {
        return goodsClassId;
    }

    public void setGoodsClassId(String goodsClassId) {
        this.goodsClassId = goodsClassId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getbId() {
        return bId;
    }

    public void setbId(int bId) {
        this.bId = bId;
    }

    public int getsId() {
        return sId;
    }

    public void setsId(int sId) {
        this.sId = sId;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    @Override
    public String toString() {
        return "Condition{" +
                "name='" + name + '\'' +
                ", state=" + state +
                ", goodsClassId='" + goodsClassId + '\'' +
                ", date=" + date +
                ", bId=" + bId +
                ", sId=" + sId +
                ", currentPage=" + currentPage +
                ", pageSize=" + pageSize +
                '}';
    }
}
