package com.onlineStudySystem.dao;

import com.onlineStudySystem.bean.CommentItem;

import java.util.List;

public interface CommentItemMapper {

    //添加评论
    public boolean addCommentItem(CommentItem commentItem);
    //删除评论,根据文章编号和用户的id
    public boolean deleteCommentItemById(CommentItem commentItem);
    //查询指定文章的评论
    public List<CommentItem> queryCommentInPapper(String papperId);


}
