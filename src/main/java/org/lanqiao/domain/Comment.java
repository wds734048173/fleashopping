package org.lanqiao.domain;

import lombok.*;

import java.util.Date;
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
@Builder
public class Comment {
    private int id;

    private int oId;

    private int gId;
    private String gName;
    private String gPic;
    private int sprice;
    private String spricereal;
    private int yprice;
    private String ypricereal;

    //评论用户id
    private int cuid;
    //回复用户id
    private int ruid;

    private int grade;//0"好评",1"一般",2"差评"
    private String gradeStr;
    private String comment;
    private String reply;

    private Date ctime;
    private Date rtime;

}
