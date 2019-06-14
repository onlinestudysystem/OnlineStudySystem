package com.onlineStudySystem.service.serviceImpl;

import com.onlineStudySystem.bean.CommentItem;
import com.onlineStudySystem.dao.CommentItemMapper;
import com.onlineStudySystem.service.CommentItemService;
import com.onlineStudySystem.util.CheckUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class CommentItemServiceImpl implements CommentItemService {
    @Resource
    CommentItemMapper commentItemMapper;

    /**
     * @param commentItem 评论项目
     * @return 返回字符串，成功则返回"评论成功"
     */
    public String addCommentItem(CommentItem commentItem) {
        //设置当前时间为评论时间
        commentItem.setCommentDate(new Date());
        //利用工具类判断基础字段的值是否有空值，（除了Userinfo等自定义类的类型无需判断，其他必须判断！）
        boolean flag=CheckUtil.getInstance().checkIsEmpty(commentItem);
        return !flag?"请完善评论信息！":commentItemMapper.addCommentItem(commentItem)?"评论成功！":"评论失败，请检查网络链接！";
    }

    /**
     *
     * @param commentItem 删除评论
     * @return 删除成功 ，或 删除失败信息
     */
    public String deleteCommentItemById(CommentItem commentItem) {
        return  commentItemMapper.deleteCommentItemById(commentItem)?"删除成功！":"删除失败！请刷新重试";
    }

    /**
     *查询这篇文章所有评论
     * @param papperId 文章编号
     * @return
     */
    public List<CommentItem> queryCommentInPapper(String papperId) {
        return  commentItemMapper.queryCommentInPapper(papperId);
    }


    @Override
    public List<CommentItem> queryCommentByUserId(String userId) {
        return commentItemMapper.queryCommentByUserId(userId);
    }


}
