package org.lanqiao.service.impl;

import org.lanqiao.dao.ICommentDao;
import org.lanqiao.dao.impl.CommentDaoImpl;
import org.lanqiao.domain.Comment;
import org.lanqiao.domain.Condition;
import org.lanqiao.service.ICommentService;

import java.sql.SQLException;
import java.util.List;

public class CommentServiceImpl implements ICommentService {
    ICommentDao commentDao = new CommentDaoImpl();
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
        /*for (int i = 0; i < commentList.size(); i++) {
            int Commentgrade = Integer.valueOf(commentList.get(i).getCommentgrade());
            if(Commentgrade == 0){
                commentList.get(i).setCommentgradeStr("好评");
            }else if(Commentgrade == 1){
                commentList.get(i).setCommentgradeStr("一般");
            }else{
                commentList.get(i).setCommentgradeStr("差评");
            }
        }*/
        return commentList;
    }
}
