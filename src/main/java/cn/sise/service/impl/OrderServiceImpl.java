package cn.sise.service.impl;

import cn.sise.dao.OrderMapper;
import cn.sise.pojo.Order;
import cn.sise.pojo.Order_Msg;
import cn.sise.pojo.Product;
import cn.sise.service.OrderService;
import cn.sise.service.Order_MsgService;
import cn.sise.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private OrderService orderService;
    @Autowired
    private Order_MsgService order_msgService;
    @Autowired
    private ProductService productService;


    @Override
    public void insert(Order order) {
        orderMapper.insert(order);
    }

    @Override
    public List<Order> list(int id) {
        return orderMapper.list(id);

    }

    @Override
    public List<Order> listA(int id) {
        return orderMapper.listA(id);

    }

    @Override
    public List<Order> listB(int id) {
        return orderMapper.listB(id);

    }

    @Override
    public List<Order> listC(int id) {
        return orderMapper.listC(id);

    }

    @Override
    public int orderCountA(int id) {
        return orderMapper.orderCountA(id);
    }

    @Override
    public int orderCountB(int id) {
        return orderMapper.orderCountB(id);
    }

    @Override
    public int orderCountC(int id) {
        return orderMapper.orderCountC(id);
    }

    @Override
    public void takeStatus(int id) {
        orderMapper.takeStatus(id);
    }

    @Override
    public void commentStatus(int id) {
        orderMapper.commentStatus(id);
    }


    @Override
    public List<Order> listAll() {
        return orderMapper.listAll();

    }

    @Override
    public void del(int id) {
        orderMapper.del(id);

    }

    @Override
    public Order get(int id) {
        return orderMapper.get(id);
    }

    @Override
    public void setStatus(int id) {
        orderMapper.setStatus(id);
    }

    @Override
    public String countPrice() {
        return orderMapper.countPrice();
    }

    /**
     * 1.user--wid--pid,拿到所有有pid的order_Msg集合,再根据前者拿到所有的Order集合
     * 2.记得把相关属性设置进去
     * 3：排除掉oid为0的记录(非订单)
     * 4:一个订单会有多个子订单信息，所以如果倒推的话要去掉相同的，只查出一个。
     *
     * @param id
     * @return
     */
    @Override
    public List<Order> staffOrder(int id) {
        System.out.println("staffOrder服务层进来了 窗口id=" + id);
        List<Product> products = productService.findByWid(id);
        System.out.println("商品" + products);
        List<Order_Msg> allList = new ArrayList<>();
        for (Product product : products) {
            List<Order_Msg> a = order_msgService.listByPid(product.getId());
            allList.addAll(a);
        }
        //拿到最终的order集合，
        List<Order> orders = new ArrayList<>();
        for (Order_Msg order_msg : allList) {
            Order order = orderService.get(order_msg.getOid());
            orders.add(order);
        }
        System.out.println(orders);
        //用HashSet去除重复的order集合元素
        HashSet h = new HashSet();
        for (int i = 0; i < orders.size() - 1; i++) {
            int orderId = orders.get(i).getId();
            if (h.contains(orderId)) {
                orders.remove(i);
            } else {
                h.add(orderId);
            }

        }
        System.out.println("经过Hash去除的orders集合："+orders.toString());
//        为所有order设置需要打印的关联属性，和前台/myOrder一样
        order_msgService.setAs(orders);
        System.out.println("ompl" + orders);
        return orders;


    }

}
