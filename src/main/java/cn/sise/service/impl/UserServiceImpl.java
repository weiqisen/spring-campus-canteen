package cn.sise.service.impl;

import cn.sise.dao.UserMapper;
import cn.sise.pojo.Image;
import cn.sise.pojo.User;
import cn.sise.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;


    public User findUserByNumber(String number) {
        return userMapper.findUserByNumber(number);
    }

    public List<User> findAllUser() {
        List<User> users = userMapper.findAllUser();
        return users;
    }

    @Override
    public int addUser(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public void updateUser(User user) {
        userMapper.updateUser(user);
    }

    @Override
    public int deleteUser(Integer id) {
        return userMapper.deleteUser(id);
    }

    @Override
    public User get(int id) {
        return userMapper.get(id);
    }

    @Override
    public void setImgUrl(Image image) {
        userMapper.setImgUrl(image);
    }

    ;

    @Override
    public List<User> listUserA() {
        return userMapper.listUserA();

    }

    @Override
    public List<User> listUserB() {
        return userMapper.listUserB();
    }

    @Override
    public void updateUserWid(User user) {
        userMapper.updateUserWid(user);
    }

    @Override
    public void setWidNull(int id) {
        userMapper.setWidNull(id);
    }

    @Override
    public List<User> findByName(String name) {
        return userMapper.findByName(name);
    }

}
