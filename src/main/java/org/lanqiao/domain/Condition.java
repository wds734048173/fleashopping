package org.lanqiao.domain;

import java.util.Date;

/*
* 搜索条件封装
* */
public class Condition {
    private String name;
    private String state;
    private String bookTypeId;
    private Date date;
    private int currentPage;
    private int pageSize;

    public Condition() {
    }

    public Condition(String name, String state, String bookTypeId, Date date, int currentPage, int pageSize) {
        this.name = name;
        this.state = state;
        this.bookTypeId = bookTypeId;
        this.date = date;
        this.currentPage = currentPage;
        this.pageSize = pageSize;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getBookTypeId() {
        return bookTypeId;
    }

    public void setBookTypeId(String bookTypeId) {
        this.bookTypeId = bookTypeId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
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
                ", state='" + state + '\'' +
                ", bookTypeId='" + bookTypeId + '\'' +
                ", date=" + date +
                ", currentPage=" + currentPage +
                ", pageSize=" + pageSize +
                '}';
    }
}
