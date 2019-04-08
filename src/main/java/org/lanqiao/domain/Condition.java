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
    private String state;
    private String bookTypeId;
    private Date date;
    private int currentPage;
    private int pageSize;
}
