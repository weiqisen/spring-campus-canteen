package cn.sise.service.impl;

import cn.sise.dao.HotMapper;
import cn.sise.dao.ProductMapper;
import cn.sise.pojo.Hot;
import cn.sise.pojo.Product;
import cn.sise.service.HotService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HotServiceImpl implements HotService {
    @Autowired
    private HotMapper hotMapper;
    @Autowired
    private ProductMapper productMapper;


    @Override
    public Hot get(int id) {
        return hotMapper.get(id);
    }


    @Override
    public Hot getByUid(Hot hot) {
        return hotMapper.getByUid(hot);
    }


    @Override
    public void insert(Hot hot) {
        hotMapper.insert(hot);
        System.out.println("浏览记录已插入数据库");
    }

    @Override
    public void insertLike(Hot hot) {
        hotMapper.insertLike(hot);
        System.out.println("点赞记录已插入数据库");
    }


    @Override
    public void updateView(Hot hot) {
        hotMapper.updateView(hot);
        System.out.println("更新view成功!");
    }


    @Override
    public void updateLike(Hot hot) {
        hotMapper.updateLike(hot);
        System.out.println("更新like时间成功！");
    }


    @Override
    public void verityNumber(int number, int id) {
        int pNumber = number;
        int pid = id;
        if (pNumber <= 2) {
            addCartHot(pid);
        }
    }


    @Override
    public void addView(int id) {
        Product product = productMapper.get(id);
        int hot = product.getHot();
        System.out.println("未执行前hot" + hot);
        hot = hot + 2;
        product.setHot(hot);
        System.out.println("执行后hot" + hot);
        productMapper.updateHot(product);
    }

    @Override
    public void addLike(int id) {
        Product product = productMapper.get(id);
        int hot = product.getHot();
        hot = hot + 10;
        product.setHot(hot);
        productMapper.updateHot(product);
        System.out.println("product：" + product.getName() + "--被点赞一次，热度加10");

    }

    @Override
    public void addCartHot(int id) {
        Product product = productMapper.get(id);
        int hot = product.getHot();
        hot = hot + 5;
        product.setHot(hot);
        productMapper.updateHot(product);
        System.out.println("product：" + product.getName() + "--合理添加购物车一次，热度加5");
    }

    @Override
    public void addOrderHot(int id) {
        Product product = productMapper.get(id);
        int hot = product.getHot();
        hot = hot + 15;
        product.setHot(hot);
        productMapper.updateHot(product);
        System.out.println("product：" + product.getName() + "--生成订单，热度加15");
    }
}
