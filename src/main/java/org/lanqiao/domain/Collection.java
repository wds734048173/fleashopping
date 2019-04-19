package org.lanqiao.domain;

import lombok.*;

import java.util.Date;

//收藏
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
@Builder
public class Collection {
    private int id;
    private int uId;
    private String uName;
    private int gId;
    private String gName;
    private int sprice;
    private String spricereal;
    private int yprice;
    private String ypricereal;
    private String gPic;
    private Date ctime;
}
