package cn.sise.service;

import cn.sise.pojo.Comment;

import java.util.List;

public interface CommentService {
    void insert(Comment comment);

    List<Comment> list();

    void pass(int id);

    List<Comment> listByPass();

    List<Comment> listByWaitPass();
}
