package org.lanqiao.service.impl;

import org.lanqiao.dao.ICommentDao;
import org.lanqiao.dao.impl.CommentDaoImpl;
import org.lanqiao.domain.Comment;
import org.lanqiao.domain.Condition;
import org.lanqiao.service.ICommentService;
import org.lanqiao.utils.DataMap;

import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

public class CommentServiceImpl implements ICommentService {
    ICommentDao commentDao = new CommentDaoImpl();
    DecimalFormat df=new DecimalFormat("0.00");
    @Override
    public List<Comment> getCommentList() {
        return commentDao.getCommentList();
    }
    //添加
    @Override
    public void addComment(Comment comment) throws SQLException {
        ICommentDao iCommentDao = new CommentDaoImpl();
        iCommentDao.addComment(comment);
    }

    @Override
    public int getCommentCountByCondition(Condition condition) {
        return commentDao.getCommentCountByCondition(condition);
    }

    @Override
    public void delComment(int CommentId) throws SQLException {
        commentDao.delComment(CommentId);
    }

    @Override
    public Comment selectOne(int commentId) throws SQLException {
        Comment comment = commentDao.selectOne(commentId);
        return comment;
    }

    @Override
    public void updateComment(Comment comment) throws SQLException {
        commentDao.updateComment(comment);
    }

    @Override
    public List<Comment> getCommentListByCondition(Condition condition) {
        List<Comment> commentList = commentDao.getCommentListByCondition(condition);
        Map<Integer,String> gradeIdNameMap = DataMap.getGradeIdNameMap();
        for (Comment comment : commentList) {
            //对级别进行处理
            int grade = comment.getGrade();
            if(gradeIdNameMap.containsKey(grade)){
                comment.setGradeStr(gradeIdNameMap.get(grade));
            }
            //对价格进行处理
            comment.setSpricereal(df.format((double)comment.getSprice()/100));
            comment.setYpricereal(df.format((double)comment.getYprice()/100));
        }
        return commentList;
    }
}
