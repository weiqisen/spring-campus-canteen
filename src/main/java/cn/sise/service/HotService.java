package cn.sise.service;

import cn.sise.pojo.Hot;


public interface HotService {

    Hot get(int id);

    Hot getByUid(Hot hot);

    void insert(Hot hot);

    void insertLike(Hot hot);

    void updateView(Hot hot);

    void updateLike(Hot hot);

    void verityNumber(int number, int id);

    void addView(int id);

    void addLike(int id);

    void addCartHot(int id);

    void addOrderHot(int id);
}
