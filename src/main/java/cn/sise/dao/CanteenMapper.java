package cn.sise.dao;

import cn.sise.pojo.Canteen;
import cn.sise.pojo.Image;

import java.util.List;

public interface CanteenMapper {
    void updateById(Canteen canteen);

    List<Canteen> list();

    int insert(Canteen canteen);

    void deleteById(int id);

    Canteen selectById(int id);

    void setImgUrl(Image image);
}
