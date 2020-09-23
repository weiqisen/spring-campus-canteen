package cn.sise.dao;

import cn.sise.pojo.Comment;

import java.util.List;

public interface CommentMapper {
    void insert(Comment comment);

    List<Comment> listAll();

    List<Comment> listByPass();

    List<Comment> listByWaitPass();

    void setPass(int id);
}
