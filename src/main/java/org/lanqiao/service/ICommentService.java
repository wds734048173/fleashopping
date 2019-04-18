package org.lanqiao.service;

import org.lanqiao.domain.Comment;
import org.lanqiao.domain.Condition;

import java.sql.SQLException;
import java.util.List;

public interface ICommentService {
    public List<Comment> getCommentList();
    //添加
    public void addComment(Comment comment) throws SQLException;
    //删除
    public void delComment(int CommentId) throws SQLException;
    //按commentid查询评语
    public Comment selectOne(int commentId) throws SQLException;
    //根据commentId修改评语
    public void updateComment(Comment comment) throws SQLException;

    //后端分页列表
    public List<Comment> getCommentListByCondition(Condition condition);
    //获取评语数量
    public int getCommentCountByCondition(Condition condition);

}
