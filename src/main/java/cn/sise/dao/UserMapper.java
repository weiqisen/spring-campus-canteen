package cn.sise.dao;

import cn.sise.pojo.Image;
import cn.sise.pojo.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * user接口文件
 */
@Repository
public interface UserMapper {
    /**
     * 根据Number查询用户信息
     */
    User findUserByNumber(String number);

    /**
     * 添加用户信息
     */
    int addUser(User user);


    /**
     * number
     */
    void updateUser(User user);

    /**
     * 删除用户信息
     */
    int deleteUser(int id);
    /**/

    /**
     * 查找所有用户
     */
    List<User> findAllUser();

    List<User> listUserA();

    List<User> listUserB();

    User get(int id);

    User getByWid(int wid);

    void setImgUrl(Image image);

    void updateUserWid(User user);

    void setWidNull(int id);


    List<User> findByName(String name);


}