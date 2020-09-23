package cn.sise.service;

import cn.sise.pojo.Product;
import cn.sise.pojo.Image;

import java.util.List;

public interface ProductService {


    List<Product> list();

    void insert(Product product);

    void setImgUrl(Image img);

    void update(Product product);

    void delete(int id);

    List<Product> findByWid(int uid);

    Product get(int id);

    void setWC(Product product);

    void lock(int id);

    void unlock(int id);

    List<Product> findProductByName(String name);


}