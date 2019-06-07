package com.onlineStudySystem.bean;

import java.util.Date;

/**
 * 文章类
 */
public class Papper {

    //文章编号（唯一标志符）
    private String papperId;
    //文章主题
    private String title;
    //文章内容
    private String papperText;
    //文章简介
    private String papperProfile;
    //文章类型
    private String type;
    //发布作者
    private UserInfo author;
    //发布人的id
    private String authorId;
    //发布日期
    private Date submitDate;
    //被读者收藏数量
    private int enshrineNumber;

    public String getPapperId() {
        return papperId;
    }

    public void setPapperId(String papperId) {
        this.papperId = papperId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    //    @Lob
//    @Basic(fetch=FetchType.LAZY)
//    @Column(columnDefinition="TEXT",nullable=true)
    public String getPapperText() {
        return papperText;
    }

    public void setPapperText(String papperText) {
        this.papperText = papperText;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public UserInfo getAuthor() {
        return author;
    }

    public void setAuthor(UserInfo author) {
        this.author = author;
    }

    public String getAuthorId() {
        return authorId;
    }

    public void setAuthorId(String authorId) {
        this.authorId = authorId;
    }

    public Date getSubmitDate() {
        return submitDate;
    }

    public void setSubmitDate(Date submitDate) {
        this.submitDate = submitDate;
    }

    public int getEnshrineNumber() {
        return enshrineNumber;
    }

    public void setEnshrineNumber(int enshrineNumber) {
        this.enshrineNumber = enshrineNumber;
    }


    public String getPapperProfile() {
        return papperProfile;
    }

    public void setPapperProfile(String papperProfile) {
        this.papperProfile = papperProfile;
    }

    @Override
    public String toString() {
        return "Papper{" +
                "papperId='" + papperId + '\'' +
                ", title='" + title + '\'' +
                ", papperText='" + papperText + '\'' +
                ", papperProfile='" + papperProfile + '\'' +
                ", type='" + type + '\'' +
                ", author=" + author +
                ", authorId='" + authorId + '\'' +
                ", submitDate=" + submitDate +
                ", enshrineNumber=" + enshrineNumber +
                '}';
    }
}

