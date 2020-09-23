package cn.sise.service.impl;

import cn.sise.dao.CanteenMapper;
import cn.sise.pojo.Canteen;
import cn.sise.pojo.Image;
import cn.sise.service.CanteenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CanteenServiceImpl implements CanteenService {
    @Autowired
    private CanteenMapper canteenMapper;

    @Override
    public void updateById(Canteen canteen) {
        canteenMapper.updateById(canteen);
    }

    @Override
    public List<Canteen> list() {
        List<Canteen> canteenList = canteenMapper.list();
        return canteenList;
    }

    @Override
    public Canteen get(int id) {
        return canteenMapper.selectById(id);
    }

    @Override
    public void insert(Canteen canteen) {
        canteenMapper.insert(canteen);
    }

    @Override
    public void deleteById(int id) {
        canteenMapper.deleteById(id);
    }

    @Override
    public Canteen selectById(int id) {
        return canteenMapper.selectById(id);
    }

    @Override
    public void setImgUrl(Image image) {
        canteenMapper.setImgUrl(image);
    }
}
