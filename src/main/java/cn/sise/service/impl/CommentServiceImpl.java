package cn.sise.service.impl;

import cn.sise.dao.CommentMapper;
import cn.sise.dao.OrderMapper;
import cn.sise.dao.UserMapper;
import cn.sise.pojo.Comment;
import cn.sise.pojo.Order;
import cn.sise.pojo.User;
import cn.sise.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    CommentMapper commentMapper;
    @Autowired
    OrderMapper orderMapper;
    @Autowired
    UserMapper userMapper;

    @Override
    public void insert(Comment comment) {
        commentMapper.insert(comment);
    }


    private void sets(List<Comment> comments) {
        for (Comment comment : comments) {
            set(comment);
        }
    }

    public void set(Comment comment) {
        Order order = orderMapper.get(comment.getOid());
        User user = userMapper.get(comment.getUid());
        comment.setUser(user);
        comment.setOrder(order);

    }

    //这个list用于管理端审核评论展示，为comments批量设置order以及User属性
    @Override
    public List<Comment> list() {
        List<Comment> comments = commentMapper.listAll();
        sets(comments);
        return comments;
    }

    //    评论状态设置
    @Override
    public void pass(int id) {
        commentMapper.setPass(id);
    }

    //   返回Status为0的comment,并且把user属性设置进去。
    @Override
    public List<Comment> listByPass() {
        List<Comment> comments = commentMapper.listByPass();
        sets(comments);
        return comments;
    }


    //   返回Status为1的comment,并且把user属性设置进去。
    @Override
    public List<Comment> listByWaitPass() {
        List<Comment> comments = commentMapper.listByWaitPass();
        sets(comments);
        return comments;
    }

}
