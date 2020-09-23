package cn.sise.service.impl;

import cn.sise.dao.CanteenMapper;
import cn.sise.dao.ProductMapper;
import cn.sise.dao.WindowMapper;
import cn.sise.pojo.Canteen;
import cn.sise.pojo.Image;
import cn.sise.pojo.Product;
import cn.sise.pojo.Window;
import cn.sise.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private WindowMapper windowMapper;
    @Autowired
    private CanteenMapper canteenMapper;

    @Override
    public List<Product> list() {
        List<Product> products = productMapper.list();
        sets(products);
        return products;
    }

    //    这里定义两个函数把product对应的窗口信息和饭堂信息设置进去
    private void sets(List<Product> products) {
        for (Product product : products) {
            setWC(product);
        }
    }

    //这里写了个公共接口，为订单提供设置商品详细的关联信息
    @Override
    public void setWC(Product product) {
        Window window = windowMapper.selectById(product.getWid());
        Canteen canteen = canteenMapper.selectById(window.getTid());
        product.setWindow(window);
        product.setCanteen(canteen);


    }


    @Override
    public void insert(Product product) {
        product.setStatus(1);
        productMapper.insert(product);
    }

    @Override
    public void setImgUrl(Image img) {
        productMapper.setImgUrl(img);
    }

    @Override
    public void delete(int id) {
        productMapper.delete(id);
    }

    @Override
    public List<Product> findByWid(int wid) {
        List<Product> products = productMapper.findByWid(wid);
        sets(products);
        return products;
    }

    @Override
    public Product get(int id) {
        Product product = productMapper.get(id);
        return product;
    }

    @Override
    public void update(Product product) {
        productMapper.update(product);

    }

    @Override
    public void lock(int id) {
        productMapper.lock(id);
    }

    @Override
    public void unlock(int id) {
        productMapper.unlock(id);

    }


    @Override
    public List<Product> findProductByName(String name) {
        List<Product> products = productMapper.findProductByName(name);
        sets(products);
        return products;
    }

}