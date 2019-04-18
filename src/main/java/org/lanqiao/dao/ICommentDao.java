package org.lanqiao.dao;

import org.lanqiao.domain.Comment;
import org.lanqiao.domain.Condition;

import java.sql.SQLException;
import java.util.List;

public interface ICommentDao {
    //获取信息反馈列表
    public List<Comment> getCommentList();
    //添加评语
    public void addComment(Comment comment) throws SQLException;

    //删除评语
    public void delComment(int CommentId) throws SQLException;
    //按commentid获取评语
    public Comment selectOne(int commentId) throws SQLException;
    //修改评语
    public void updateComment(Comment comment) throws SQLException;

    //后端获取分页反馈列表
    public List<Comment> getCommentListByCondition(Condition condition);
    //后端获取评价信息列表的数量
    public int getCommentCountByCondition(Condition condition);

}
