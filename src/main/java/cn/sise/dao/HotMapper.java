package cn.sise.dao;

import cn.sise.pojo.Hot;

public interface HotMapper {


    Hot get(int id);

    Hot getByUid(Hot hot);

    void insert(Hot hot);

    void updateView(Hot hot);

    void updateLike(Hot hot);

    void insertLike(Hot hot);
}
