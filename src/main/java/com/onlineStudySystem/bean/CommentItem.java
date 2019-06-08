package com.onlineStudySystem.bean;

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
    private String commentText;
    //评论时间
    private Date commentDate;


}
