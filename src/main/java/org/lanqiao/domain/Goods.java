package org.lanqiao.domain;

/**
 * @Auther: WDS
 * @Date: 2019/4/3 21:53
 * @Description:商品
 */
public class Goods {
    private int id;
    //商品名称
    private String name;
    //商品图片
    private String pic;
    //商品分类id
    private int classId;
    //商品原价
    private int yprice;
    //商品销售价
    private int sprice;
    //商品描述
    private String remark;
    //商品所属用户id
    private int uId;

    public Goods() {
    }

    public Goods(int id, String name, String pic, int classId, int yprice, int sprice, String remark, int uId) {
        this.id = id;
        this.name = name;
        this.pic = pic;
        this.classId = classId;
        this.yprice = yprice;
        this.sprice = sprice;
        this.remark = remark;
        this.uId = uId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
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

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", pic='" + pic + '\'' +
                ", classId=" + classId +
                ", yprice=" + yprice +
                ", sprice=" + sprice +
                ", remark='" + remark + '\'' +
                ", uId=" + uId +
                '}';
    }
}
