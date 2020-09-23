package cn.sise.dao;

import cn.sise.pojo.Order_Msg;

import java.util.List;

public interface Order_MsgMapper {

    void update(Order_Msg order_msg);

    void insert(Order_Msg order_msg);

    void del(int id);

    //    添加购物车成功后更新数量

    void updateNumber(Order_Msg order_msg);

    List<Order_Msg> list(int id);

    //为myOrder提供服务
    List<Order_Msg> listByOid(int id);

    Order_Msg get(int id);


    List<Order_Msg> listByPid(int id);

    //拿到特定user的oid为空(购物车内容)的order_msg
    List<Order_Msg> listByCart(int id);

}
