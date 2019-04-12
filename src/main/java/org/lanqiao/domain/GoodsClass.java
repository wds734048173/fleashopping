package org.lanqiao.domain;

import lombok.*;

/**
 * @Auther: WDS
 * @Date: 2019/4/3 21:54
 * @Description:商品分类
 */
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
@Builder
public class GoodsClass {
    //商品分类id
    private int id;
    //商品分类名称
    private String name;
    //商品分类状态
    private int state;
    private String stateStr;

    public GoodsClass() {
    }

    public GoodsClass(int id, String name, int state, String stateStr) {
        this.id = id;
        this.name = name;
        this.state = state;
        this.stateStr = stateStr;
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

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getStateStr() {
        return stateStr;
    }

    public void setStateStr(String stateStr) {
        this.stateStr = stateStr;
    }

    @Override
    public String toString() {
        return "GoodsClass{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", state=" + state +
                ", stateStr='" + stateStr + '\'' +
                '}';
    }
}
