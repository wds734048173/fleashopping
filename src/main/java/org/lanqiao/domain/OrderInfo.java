package org.lanqiao.domain;

import lombok.*;

/**
 * @Auther: WDS
 * @Date: 2019/4/3 21:53
 * @Description:销售订单详情
 */

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
@Builder
public class OrderInfo {
    private int id;
    //销售单id
    private int oId;
    //商品id
    private int gId;
    //商品数量
    private int num;
    //商品原价
    private int yprice;
    //商品销售价
    private int sprice;
    //商品名称
    private String gname;
    //商品图片
    private String gpic;

   /* public OrderInfo() {
    }

    public OrderInfo(int id, int oId, int gId, int num, int yprice, int sprice, String gname, String gpic) {
        this.id = id;
        this.oId = oId;
        this.gId = gId;
        this.num = num;
        this.yprice = yprice;
        this.sprice = sprice;
        this.gname = gname;
        this.gpic = gpic;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOId() {
        return oId;
    }

    public void setOId(int oId) {
        this.oId = oId;
    }

    public int getGId() {
        return gId;
    }

    public void setGId(int gId) {
        this.gId = gId;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public int getYprice() {
        return yprice;
    }

    public void setYprice(int yprice) {
        this.yprice = yprice;
    }

    public int getSprice() {
        return sprice;
    }

    public void setSprice(int sprice) {
        this.sprice = sprice;
    }

    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public String getGpic() {
        return gpic;
    }

    public void setGpic(String gpic) {
        this.gpic = gpic;
    }

    @Override
    public String toString() {
        return "OrderInfo{" +
                "id=" + id +
                ", oId=" + oId +
                ", gId=" + gId +
                ", num=" + num +
                ", yprice=" + yprice +
                ", sprice=" + sprice +
                ", gname='" + gname + '\'' +
                ", gpic='" + gpic + '\'' +
                '}';
    }*/
}
