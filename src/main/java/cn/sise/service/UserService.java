package cn.sise.service;

import cn.sise.pojo.Image;
import cn.sise.pojo.User;

import java.util.List;

public interface UserService {

    User findUserByNumber(String number);

    List<User> findAllUser();

    int addUser(User user);


    void updateUser(User user);

    int deleteUser(Integer id);

    User get(int id);

    void setImgUrl(Image image);

    List<User> listUserA();

    List<User> listUserB();

    void updateUserWid(User user);

    void setWidNull(int id);

    List<User> findByName(String name);

}
