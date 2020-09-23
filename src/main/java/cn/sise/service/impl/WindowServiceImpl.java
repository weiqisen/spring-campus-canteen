package cn.sise.service.impl;

import cn.sise.dao.UserMapper;
import cn.sise.dao.WindowMapper;
import cn.sise.pojo.Image;
import cn.sise.pojo.User;
import cn.sise.pojo.Window;
import cn.sise.service.WindowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WindowServiceImpl implements WindowService {
    @Autowired
    private WindowMapper windowMapper;
    @Autowired
    private UserMapper userMapper;

    @Override
    public List<Window> list() {
        List<Window> windowList = windowMapper.list();
        return windowList;
    }

    @Override
    public void insert(Window window) {
        windowMapper.insert(window);
    }

    @Override
    public void del(int id) {
        windowMapper.deleteById(id);
    }

    @Override
    public Window get(int id) {
        Window window = windowMapper.selectById(id);
        User user = userMapper.getByWid(window.getId());
        window.setUser(user);
        return window;
    }

    @Override
    public void update(Window window) {
        windowMapper.updateById(window);
    }


    //  这里给设置一个窗口对应User属性进去
    @Override
    public List<Window> findByTid(int tid) {
        List<Window> windows = windowMapper.findByTid(tid);
        for (Window window : windows) {
            User user = userMapper.getByWid(window.getId());
            window.setUser(user);
        }
        return windows;
    }

    @Override
    public void setImgUrl(Image image) {
        windowMapper.setImgUrl(image);
    }

    @Override
    public void setOpen(int id) {
        windowMapper.setOpen(id);
    }

    @Override
    public void setClose(int id) {
        windowMapper.setClose(id);
    }

}
