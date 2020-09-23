package cn.sise.service.impl;

import cn.sise.dao.LostMapper;
import cn.sise.dao.UserMapper;
import cn.sise.pojo.Image;
import cn.sise.pojo.Lost;
import cn.sise.pojo.User;
import cn.sise.service.LostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LostServiceImpl implements LostService {

    @Autowired
    private LostMapper lostMapper;
    @Autowired
    private UserMapper userMapper;

    //get额同时把相应用户信息设置进去
    @Override
    public Lost get(int id) {

        Lost lost = lostMapper.get(id);
        User user = userMapper.get(lost.getUid());
        lost.setUser(user);
        return lost;

    }

    @Override
    public void del(int id) {
        lostMapper.del(id);
    }

    @Override
    public List<Lost> listAll() {
        List<Lost> losts = lostMapper.listAll();
        for (Lost lost : losts) {
            User user = userMapper.get(lost.getUid());
            lost.setUser(user);
        }
        return losts;
    }

    @Override
    public void insert(Lost lost) {
        lostMapper.insert(lost);
    }

    @Override
    public void setImgUrl(Image image) {
        lostMapper.setImgUrl(image);
    }

    @Override
    public List<Lost> findMyLost(int id) {
        List<Lost> losts = lostMapper.findMyLost(id);
        for (Lost lost : losts) {
            User user = userMapper.get(lost.getUid());
            lost.setUser(user);
        }
        return losts;
    }
}
