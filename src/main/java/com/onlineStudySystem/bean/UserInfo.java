package com.onlineStudySystem.bean;

/**
 * 用户信息
 */
public class UserInfo {

    //用户编号(唯一标志符)
    private String userId;
    //用户名
    private String username;
    //账户密码
    private String password;
    //昵称
    private String nikeName;
    //姓名
    private String name;
    //邮箱
    private String email;
    //头像
    private String photo;
    //个人描述
    private String detail;
    //性别 0是男，1是女
    private int sex;

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

    public String getNikeName() {
        return nikeName;
    }

    public void setNikeName(String nikeName) {
        this.nikeName = nikeName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", nikeName='" + nikeName + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", photo='" + photo + '\'' +
                ", detail='" + detail + '\'' +
                '}';
    }
}
