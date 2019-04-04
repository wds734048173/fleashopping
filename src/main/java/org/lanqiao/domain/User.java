package org.lanqiao.domain;

/**
 * @Auther: WDS
 * @Date: 2019/4/3 21:52
 * @Description:用户
 */
public class User {
    private int id;
    //用户名
    private String username;
    //密码
    private String password;
    //性别0男1女
    private int sex;
    private String sexStr;
    //大学名称
    private String collage;
    //年龄
    private int age;
    //真实名称
    private String realname;
    //角色（0管理员，1普通用户）
    private int role;
    //用户状态（0正常1停用2删除）
    private int state;

    public User() {
    }

    public User(int id, String username, String password, int sex, String sexStr, String collage, int age, String realname, int role, int state) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.sex = sex;
        this.sexStr = sexStr;
        this.collage = collage;
        this.age = age;
        this.realname = realname;
        this.role = role;
        this.state = state;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getSexStr() {
        return sexStr;
    }

    public void setSexStr(String sexStr) {
        this.sexStr = sexStr;
    }

    public String getCollage() {
        return collage;
    }

    public void setCollage(String collage) {
        this.collage = collage;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", sex=" + sex +
                ", sexStr='" + sexStr + '\'' +
                ", collage='" + collage + '\'' +
                ", age=" + age +
                ", realname='" + realname + '\'' +
                ", role=" + role +
                ", state=" + state +
                '}';
    }
}
