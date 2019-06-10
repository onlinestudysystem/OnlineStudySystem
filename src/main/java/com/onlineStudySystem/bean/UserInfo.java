package com.onlineStudySystem.bean;

import com.onlineStudySystem.bean.ValidationGroup.LoginValidationGroup;
import com.onlineStudySystem.bean.ValidationGroup.RegistValidationGroup;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * 用户信息
 */
public class UserInfo {

    //用户编号(唯一标志符)

    private String userId;
    //用户名
    @Size(min = 3,max = 40,message = "用户名长度请保持在{min}到{max}之间",groups = {LoginValidationGroup.class, RegistValidationGroup.class})
    private String username;
    //账户密码
    @NotBlank(message = "密码不得为空！" ,groups = {LoginValidationGroup.class,RegistValidationGroup.class})
    private String password;
    //昵称
    private String nikeName;
    //姓名
    @NotBlank(message = "请填写名字",groups = {RegistValidationGroup.class})
    private String name;
    //邮箱
    @Email(message = "邮箱格式不正确！",groups = {RegistValidationGroup.class})
    private String email;
    //头像
    private String photo;
    //个人描述
    @Size(max=50,message = "描述信息请控制在50字内！",groups = {RegistValidationGroup.class})
    private String detail;
    //性别 0是男，1是女
    private int sex;
    //用户的权限 0代表普通用户，1是会员，2是管理员
    private int  previledge;

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


    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public int getPreviledge() {
        return previledge;
    }

    public void setPreviledge(int previledge) {
        this.previledge = previledge;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "userId='" + userId + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", nikeName='" + nikeName + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", photo='" + photo + '\'' +
                ", detail='" + detail + '\'' +
                ", sex=" + sex +
                ", previledge=" + previledge +
                '}';
    }
}
