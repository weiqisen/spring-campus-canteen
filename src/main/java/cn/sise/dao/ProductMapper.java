package cn.sise.dao;

import cn.sise.pojo.Product;
import cn.sise.pojo.Image;

import java.util.List;

public interface ProductMapper {
    /**
     * 获取所有商品
     *
     * @param
     * @return
     */
    List<Product> list();

    int insert(Product product);

    void setImgUrl(Image image);

    void delete(int id);

    List<Product> findByWid(int uid);

    void update(Product product);

    Product get(int id);

    void lock(int id);

    void unlock(int id);

    void updateHot(Product product);

    List<Product> findProductByName(String name);
}
