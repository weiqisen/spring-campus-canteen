package cn.sise.service;

import cn.sise.pojo.Canteen;
import cn.sise.pojo.Image;

import java.util.List;

public interface CanteenService {
    void updateById(Canteen canteen);

    List<Canteen> list();

    void insert(Canteen canteen);

    void deleteById(int id);

    Canteen get(int id);

    Canteen selectById(int id);

    void setImgUrl(Image image);
}
