package org.lanqiao.dao.impl;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.lanqiao.dao.ICommentDao;
import org.lanqiao.domain.Comment;
import org.lanqiao.domain.Condition;
import org.lanqiao.utils.jdbcUtils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentDaoImpl implements ICommentDao {
    private QueryRunner qr = new QueryRunner(jdbcUtils.getDataSource());
    @Override
    public List<Comment> getCommentList() {
        List<Comment> commentList = null;
        String sql = "SELECT * from tb_comment";
        try {
            commentList = qr.query(sql,new BeanListHandler<>(Comment.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return commentList;
    }
    //添加
    @Override
    public void addComment(Comment comment) throws SQLException {
//        String sql = "insert into tb_comment (gid,gname,CustomerId,UserName,ctime,comment,grade) values (?,?,?,?,?,?,?)";
//        qr.update(sql,comment.getBookId(),comment.getBookName(),comment.getCustomerId(),comment.getUserName(),comment.getCommentdate(),comment.getCommentcontent(),Integer.parseInt(comment.getCommentgrade()));
    }


    @Override
    public void delComment(int CommentId) throws SQLException {
        String sql = "delete from tb_comment where CommentId=?";
        qr.update(sql,CommentId);
    }

    @Override
    public Comment selectOne(int commentId) throws SQLException {
        String sql = "SELECT * FROM tb_comment WHERE id=?";
        Comment comment = qr.query(sql,new BeanHandler<Comment>(Comment.class),commentId);
        return comment;
    }

    @Override
    public void updateComment(Comment comment) throws SQLException {
//        String sql = "update  tb_comment set BookId=?,BookName=?,CustomerId=?,UserName=?,Commentdate=?,Commentcontent=?,Commentgrade=? WHERE CommentId=?";
        String sql ="";
//        qr.update(sql,comment.getBookId(),comment.getBookName(),comment.getCustomerId(),comment.getUserName(),comment.getCommentdate(),comment.getCommentcontent(),comment.getCommentgrade(),comment.getCommentId());
    }
    //后端分页列表
    @Override
    public List<Comment> getCommentListByCondition(Condition condition) {
        List<Comment> comments = null;
        StringBuffer sql = new StringBuffer("SELECT * FROM tb_comment WHERE 1 = 1 ");
        List<Object> search = new ArrayList<>();
        if(condition.getName() != null && !"".equals(condition.getName())){
            sql.append(" and gname=?");
            search.add(condition.getName());
        }
        if(condition.getGrade() != null && !"-1".equals(condition.getGrade())){
            sql.append(" and grade = ? ");
            search.add(condition.getGrade());
        }
        sql.append(" limit ?,?");
        search.add(condition.getCurrentPage());
        search.add(condition.getPageSize());
        try {
            comments = qr.query(sql.toString(),new BeanListHandler<>(Comment.class),search.toArray());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return comments;
    }
    //后端列表总数
    @Override
    public int getCommentCountByCondition(Condition condition) {
        StringBuffer sql = new StringBuffer("SELECT count(*) from tb_comment where 1 = 1 ");
        List<Object> search = new ArrayList<>();
        if(condition.getName() != null && !"".equals(condition.getName())){
            sql.append(" and gname=?");
            search.add(condition.getName());
        }
        if(condition.getGrade() != null && !"-1".equals(condition.getGrade())){
            sql.append(" and grade = ? ");
            search.add(condition.getGrade());
        }
        Long count = 0L;
        try {
            count = qr.query(sql.toString(),new ScalarHandler<>(1),search.toArray());//获取列表数量
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Integer.valueOf(count.toString());
    }
}
