package cn.sise.dao;

import cn.sise.pojo.Order;

import java.util.List;

public interface OrderMapper {
    void insert(Order order);

    List<Order> list(int id);

    List<Order> listA(int id);

    List<Order> listB(int id);

    List<Order> listC(int id);

    void commentStatus(int id);

    void del(int id);

    Order get(int id);

    void setStatus(int id);

    void takeStatus(int id);

    List<Order> listAll();

    String countPrice();

    int orderCountA(int id);

    int orderCountB(int id);

    int orderCountC(int id);
}
