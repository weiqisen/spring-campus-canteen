package cn.sise.dao;

import cn.sise.pojo.Image;
import cn.sise.pojo.Lost;

import java.util.List;

public interface LostMapper {


    Lost get(int id);

    void del(int id);

    List<Lost> listAll();

    List<Lost> findMyLost(int id);

    void insert(Lost lost);

    void setImgUrl(Image image);

}
