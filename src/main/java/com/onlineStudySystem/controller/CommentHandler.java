package com.onlineStudySystem.controller;

import com.onlineStudySystem.bean.CommentItem;
import com.onlineStudySystem.bean.UserInfo;
import com.onlineStudySystem.service.CommentItemService;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.stream.events.Comment;

@Controller
@RequestMapping("/comment")
public class CommentHandler {
    @Resource
    CommentItemService commentItemService;

    @RequestMapping(value="/addComment",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String addComment(CommentItem commentItem,HttpServletRequest request){
        HttpSession session=request.getSession();
        UserInfo userInfo=(UserInfo)session.getAttribute("userInfo");
        commentItem.setUserId(userInfo.getUserId());
        String msg=commentItemService.addCommentItem(commentItem);
        //更新是否成功
        return "{\"msg\":\""+msg+"\"}";
    }


    //删除comment
    @RequestMapping(value = "/delComment",produces =  "application/json;charset=utf-8")
    @ResponseBody
    public String deleteComment(String commentId,String userId,HttpServletRequest request){
        CommentItem commentItem=new CommentItem();
        commentItem.setPapperId(commentId);
        commentItem.setUserId(userId);
        //删除评论
        String msg=commentItemService.deleteCommentItemById(commentItem);
        //根据commentId删除指定的品滚信息
        return "{\"msg\":\""+msg+"\"}";

    }
}
