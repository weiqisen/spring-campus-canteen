package cn.sise.dao;

import cn.sise.pojo.Image;
import cn.sise.pojo.Window;

import java.util.List;

public interface WindowMapper {
    void updateById(Window window);

    List<Window> list();

    int insert(Window window);

    void deleteById(int id);


    void setImgUrl(Image image);

    Window selectById(int id);

    /**
     * 根据tid查找对应Window
     *
     * @param tid
     * @return
     */
    List<Window> findByTid(int tid);

    void setOpen(int id);

    void setClose(int id);
}
