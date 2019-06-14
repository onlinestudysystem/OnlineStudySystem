package com.onlineStudySystem.service;

import com.onlineStudySystem.bean.CommentItem;

import java.util.List;

public interface CommentItemService {


    //添加评论
    public String addCommentItem(CommentItem commentItem);
    //删除评论,根据文章编号和用户的id
    public String deleteCommentItemById(CommentItem commentItem);
    //查询指定文章的评论
    public List<CommentItem> queryCommentInPapper(String papperId);
    //获取该作者的所有评论
    public List<CommentItem> queryCommentByUserId(String userId);
}
