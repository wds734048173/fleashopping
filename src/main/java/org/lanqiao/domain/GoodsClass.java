package org.lanqiao.domain;

/**
 * @Auther: WDS
 * @Date: 2019/4/3 21:54
 * @Description:商品分类
 */
public class GoodsClass {
    //商品分类id
    private int id;
    //商品分类名称
    private String name;

    public GoodsClass() {
    }

    public GoodsClass(int id, String name) {
        this.id = id;
        this.name = name;
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

    @Override
    public String toString() {
        return "GoodsClass{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
