package com.onlineStudySystem.bean;

import java.util.Date;

/**
 * 足迹模块
 */
public class FootPrintItem {

    //文章编号
    private String papperId;
    //用户编号
    private String userId;
    //文章简介
    private String papperProfile;
    //文章主题
    private String title;
    //浏览时间
    private Date  readDate;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPapperId() {
        return papperId;
    }

    public void setPapperId(String papperId) {
        this.papperId = papperId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPapperProfile() {
        return papperProfile;
    }

    public void setPapperProfile(String papperProfile) {
        this.papperProfile = papperProfile;
    }

    public Date getReadDate() {
        return readDate;
    }

    public void setReadDate(Date readDate) {
        this.readDate = readDate;
    }

    @Override
    public String toString() {
        return "FootPrintItem{" +
                "papperId='" + papperId + '\'' +
                ", userId='" + userId + '\'' +
                ", papperProfile='" + papperProfile + '\'' +
                ", title='" + title + '\'' +
                ", readDate=" + readDate +
                '}';
    }
}
