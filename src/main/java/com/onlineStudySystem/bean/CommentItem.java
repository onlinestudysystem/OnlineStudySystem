package com.onlineStudySystem.bean;

import org.hibernate.validator.constraints.NotBlank;

import java.util.Date;

/**
 * 评论类
 */
public class CommentItem {

    //评论者id
    private String userId;
    //评论人的具体信息
    private UserInfo userInfo;
    //评论文章编号，就是papperId
    private String papperId;
    //评论内容
    @NotBlank(message = "评论信息不得为空！")
    private String commentText;
    //评论时间
    private Date commentDate;
    //作者的id
    private String authorId;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    public String getPapperId() {
        return papperId;
    }

    public void setPapperId(String papperId) {
        this.papperId = papperId;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    public String getAuthorId() {
        return authorId;
    }

    public void setAuthorId(String authorId) {
        this.authorId = authorId;
    }

    @Override
    public String toString() {
        return "CommentItem{" +
                "userId='" + userId + '\'' +
                ", userInfo=" + userInfo +
                ", papperId='" + papperId + '\'' +
                ", commentText='" + commentText + '\'' +
                ", commentDate=" + commentDate +
                ", authorId='" + authorId + '\'' +
                '}';
    }
}
