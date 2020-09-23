package cn.sise.service.impl;

import cn.sise.dao.Order_MsgMapper;
import cn.sise.pojo.Order;
import cn.sise.pojo.Order_Msg;
import cn.sise.pojo.Product;
import cn.sise.service.Order_MsgService;
import cn.sise.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Order_MsgServiceImpl implements Order_MsgService {
    @Autowired
    Order_MsgService order_msgService;
    @Autowired
    Order_MsgMapper order_msgMapper;
    @Autowired
    ProductService productService;


    @Override
    public void update(Order_Msg order_msg) {
        order_msgMapper.update(order_msg);
    }

    @Override
    public void updateOid(List<Order_Msg> order_msgs, int oid) {
        for (Order_Msg om : order_msgs) {
            om.setOid(oid);
            order_msgMapper.update(om);
        }
    }

    @Override
    public void del(int id) {
        order_msgMapper.del(id);
    }

    @Override
    public Order_Msg get(int id) {
        Order_Msg order_msg = order_msgMapper.get(id);
        set(order_msg);
        return order_msg;
    }

    @Override
    public void insert(Order_Msg order_msg) {
        order_msgMapper.insert(order_msg);
    }

    /**
     * 定义两个函数,set用来把product设置进单个order，sets用来在多个order依次调用set
     *
     * @param
     */


    private void sets(List<Order_Msg> order_msgs) {
        for (Order_Msg order_msg : order_msgs) {
            set(order_msg);
        }
    }

    private void set(Order_Msg order_msg) {
        Product product = productService.get(order_msg.getPid());
        productService.setWC(product);
        order_msg.setProduct(product);
    }

    @Override
//    服务于myCart拿到oid为空的数据
    public List<Order_Msg> list(int id) {
        List<Order_Msg> order_msgs = order_msgMapper.list(id);
//        这里开始调用sets把product设置进每一个order
        sets(order_msgs);
        return order_msgs;
    }

    /**
     * 为myOrder提供(Order Order_msg totalPrice)数据
     * 1.根据order id取出关联的order_msg
     * 2.为每个order_msg设置product属性
     * 3.为每个order设置order_msg 以及设置属性totalPrice
     *
     * @param order
     */
    @Override
    public void setAs(Order order) {
        List<Order_Msg> order_msgs = order_msgMapper.listByOid(order.getId());
        sets(order_msgs);
        float totalPrice = 0;
        for (Order_Msg order_msg : order_msgs) {
            totalPrice += order_msg.getNumber() * order_msg.getProduct().getPrice();
            order.setTotalPrice(totalPrice);
            order.setOrder_msgs(order_msgs);
        }
    }

    @Override
    public void setAs(List<Order> orders) {
        for (Order order : orders) {
            setAs(order);
        }

    }

    @Override
    //这里要写一个根据pid取出所有的order_Msg记录
    public List<Order_Msg> listByPid(int id) {
        return order_msgMapper.listByPid(id);
    }

    @Override
    public List<Order_Msg> listByCart(int id) {
        return order_msgMapper.listByCart(id);
    }

    @Override
    public void updateNumber(Order_Msg order_msg) {
        order_msgMapper.updateNumber(order_msg);
    }

}
