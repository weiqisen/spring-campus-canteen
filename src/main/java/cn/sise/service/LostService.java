package cn.sise.service;

import cn.sise.pojo.Image;
import cn.sise.pojo.Lost;

import java.util.List;

public interface LostService {

    Lost get(int id);

    void del(int id);

    List<Lost> listAll();

    void insert(Lost lost);

    void setImgUrl(Image image);

    List<Lost> findMyLost(int id);
}
