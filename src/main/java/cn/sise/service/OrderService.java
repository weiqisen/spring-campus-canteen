package cn.sise.service;

import cn.sise.pojo.Order;

import java.util.List;

public interface OrderService {
    void insert(Order order);

    List<Order> list(int id);

    List<Order> listAll();

    void del(int id);

    Order get(int id);

    void setStatus(int id);

    String countPrice();

    /**
     * 专门用来处理员工窗口对应关联的订单，输入一个窗口id进去，出来一堆与之关联的orders
     *
     * @param id
     * @return
     */
    List<Order> staffOrder(int id);

    void takeStatus(int id);

    void commentStatus(int id);

    List<Order> listA(int id);

    List<Order> listB(int id);

    List<Order> listC(int id);

    int orderCountA(int id);

    int orderCountB(int id);

    int orderCountC(int id);

}
