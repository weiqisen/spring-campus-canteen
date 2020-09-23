package cn.sise.service;


import cn.sise.pojo.Image;
import cn.sise.pojo.Window;

import java.util.List;

public interface WindowService {
    void update(Window window);

    List<Window> list();

    void insert(Window window);

    void del(int id);

    Window get(int id);

    List<Window> findByTid(int tid);

    void setImgUrl(Image image);

    void setOpen(int id);

    void setClose(int id);

}
