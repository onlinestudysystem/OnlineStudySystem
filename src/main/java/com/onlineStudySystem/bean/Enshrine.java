package com.onlineStudySystem.bean;

/**
 * 收藏类
 */
public class Enshrine {

    //收藏的文章id
    private String papperId;
    //收藏人的id
    private String userId;
    //收藏文章的标题
    private String title;
    //收藏的文章简介
    private String papperProfile;

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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPapperProfile() {
        return papperProfile;
    }

    public void setPapperProfile(String papperProfile) {
        this.papperProfile = papperProfile;
    }

    @Override
    public String toString() {
        return "Enshrine{" +
                "papperId='" + papperId + '\'' +
                ", userId='" + userId + '\'' +
                ", title='" + title + '\'' +
                ", papperProfile='" + papperProfile + '\'' +
                '}';
    }
}

