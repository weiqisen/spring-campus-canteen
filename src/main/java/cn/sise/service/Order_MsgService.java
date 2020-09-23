package cn.sise.service;

import cn.sise.pojo.Order;
import cn.sise.pojo.Order_Msg;

import java.util.List;

public interface Order_MsgService {

    void update(Order_Msg order_msg);

    void updateOid(List<Order_Msg> order_msgs, int oid);

    void insert(Order_Msg order_msg);

    Order_Msg get(int id);

    List<Order_Msg> list(int id);

    List<Order_Msg> listByPid(int id);

    void del(int id);

    //为myOrder设置Order_Msg以及totalPrice
    void setAs(List<Order> orders);

    void setAs(Order order);

    List<Order_Msg> listByCart(int id);

    void updateNumber(Order_Msg order_msg);
}
