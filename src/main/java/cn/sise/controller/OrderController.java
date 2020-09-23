package cn.sise.controller;

import cn.sise.pojo.*;
import cn.sise.service.*;
import cn.sise.util.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

@Controller

public class OrderController {
    @Autowired
    private ProductService productService;
    @Autowired
    private Order_MsgService order_msgService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private WindowService windowService;
    @Autowired
    private HotService hotService;


    /**
     * 加入购物车步骤
     * 判断商品所在的窗口是否处于营业状态
     * 判断商品是否处于无货状态
     * 判断用户是否处于登录状态
     * 1.根据传过来的id值get到product
     * 2.list<>该用户order_msg表里面的oid为空的记录
     * 3.对比刚刚get到的product是否相同
     * 4.如果相同，调整数量
     * 5.如果不同，则insert一条order_msg记录
     */
    @RequestMapping("/addCart")
    @ResponseBody
    public String addCart(int id, HttpSession session) {
        //这里先做一个判断，如果状态码为0，则不进行添加购物车操作
        Product product = productService.get(id);
        Window window = windowService.get(product.getWid());
        User user = (User) session.getAttribute("user");

        if (window.getStatus() == 0) {
            return "close";
        }

        if (window.getStatus() == 1) {
            if (product.getStatus() == 0) {
                return "false";
            }
            if (product.getStatus() == 1) {

                if (user == null) {
                    return "false_Login";
                }

//                用sign判断传进来的是否是新菜品，默认为false
                boolean sign = false;
                //根据userId拿到购物车信息
                List<Order_Msg> cartList = order_msgService.listByCart(user.getId());
//                遍历order_msg，对比是否为相同product
                for (Order_Msg order_msg : cartList) {
//                    如果两个id相等，调整number数量

                    if (order_msg.getPid() == product.getId().intValue()) {
                        sign = true;
                        order_msg.setNumber(order_msg.getNumber() + 1);
//                      这里去调用一个函数检测当前购物车数量是否超出热度审核标准
                        hotService.verityNumber(order_msg.getNumber(), order_msg.getPid());
                        order_msgService.updateNumber(order_msg);
                    }

                }
                //根据sign判断，如果传进来的是新pid，则新增一条商品记录
//                System.out.println(sign);
                if (!sign) {
                    Order_Msg os = new Order_Msg();
                    os.setNumber(1);
                    os.setUid(user.getId());
                    os.setPid(product.getId());
                    os.setProduct(productService.get(id));
                    order_msgService.insert(os);
//                  加购物车热度值更新
                    hotService.addCartHot(os.getPid());
                    //新增记录
                }
                return "success";
            }
        }

        return null;
    }

    /**
     * 查看购物车
     * 1.拿到当前用户
     * 2.用用户id=uid,拿到购物车数据库信息
     *
     * @return Order_msg
     */

    @RequestMapping("/myCart")
    public String myCart(Model model, HttpSession session,Page page) {
        PageHelper.offsetPage(page.getStart(), page.getCount());//分页查询
        User user = (User) session.getAttribute("user");
        //应该拿到oid为空的Order_Msg，有oid的为已下单购买
        List<Order_Msg> oms = order_msgService.list(user.getId());
        int total = (int) new PageInfo<>(oms).getTotal();//总条数
        page.setTotal(total);
        model.addAttribute("total", total);
        model.addAttribute("page", page);
        model.addAttribute("oms", oms);
        model.addAttribute("user", user);
        if (oms.size() == 0) {
            return "fore/nullCart";
        } else {
            return "fore/myCart";
        }
    }

    @RequestMapping("/delOrder_Msg")
    public String delOrder_Msg(int id) {
        order_msgService.del(id);
        return "redirect:myCart";
    }


    /**
     * 下单前的商品验证
     * 这里做一个判断，如果拿到的id里面有无货或者所在窗口打烊了的，return"false"
     */


    @RequestMapping("placeOrderVerity")
    @ResponseBody
    public String placeOrderVerity(String[] omids) {
        for (String sid : omids) {
            int id = Integer.parseInt(sid);
            Order_Msg order_msg = order_msgService.get(id);
            Product product = productService.get(order_msg.getPid());
            Window window = windowService.get(product.getWid());
            if (window.getStatus() == 0) {
                return "close";

            }
            if (window.getStatus() == 1) {
                if (product.getStatus() == 0) {
                    return "empty";
                }
                if (product.getStatus() == 1) {
                    return "success";
                }

            }
        }
        return null;

    }

    /**
     * 下单，把前台拿到的id集合取出所有选购信息
     *
     * @param omids
     * @return
     */
    @RequestMapping("/placeOrder")
    public String placeOrder(String[] omids, HttpSession session, Model model) {
        List<Order_Msg> order_msgs = new ArrayList<>();
        float totalPrice = 0;
        int count = 0;
        for (String sid : omids) {
            int id = Integer.parseInt(sid);
            Order_Msg order_msg = order_msgService.get(id);
            order_msgs.add(order_msg);
            totalPrice += order_msg.getProduct().getPrice() * order_msg.getNumber();
            count += order_msg.getNumber();
        }
        session.setAttribute("order_msgs", order_msgs);
        session.setAttribute("totalPrice", totalPrice);
        model.addAttribute("order_msgs", order_msgs);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("count", count);
        return "fore/placeOrder";

    }

    /**
     * 提交订单后设置order的属性以及设置order_msg里面的oid
     *
     * @param session
     * @param detail
     * @return
     * @throws Exception
     */
    @RequestMapping("/order")
    public String order(HttpSession session, String detail) throws Exception {
        detail = java.net.URLDecoder.decode(detail, "UTF-8");
        String dt = detail;
        User user = (User) session.getAttribute("user");
        Order order = new Order();
        //用当前时间＋随机四位数生成订单编号
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        SimpleDateFormat now = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = now.format(calendar.getTime());
        Random random = new Random();
        String order_number = formatter.format(calendar.getTime()) + random.nextInt(2000);
//      session里面拿到订单总价格
        Float totalPrice = (Float) session.getAttribute("totalPrice");
        //设置order各项属性
        order.setNumber(order_number);
        order.setDetail(dt);
        order.setUid(user.getId());
        order.setStatus(1);
        order.setTime(time);
        order.setTotalPrice(totalPrice);
        //保存订单，并且为每个订单项关联订单id
        orderService.insert(order);
        int oid = order.getId();
        //新增order后拿到oid,传过去遍历设置oid
        List<Order_Msg> order_msgs = (List<Order_Msg>) session.getAttribute("order_msgs");
//      生成订单后热度值加15
        for (Order_Msg order_msg : order_msgs) {
            hotService.addOrderHot(order_msg.getPid());
        }
        order_msgService.updateOid(order_msgs, oid);
        return "fore/bought";

    }

    /**
     * 前台查看我的订单
     * 1.根据uid取出order
     * 2.设置order_Msg的product属性
     * 3.在service层计算并设置order中的总价格
     *
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("myOrder")
    public String myOrder(Model model, HttpSession session, Page page) {
        PageHelper.offsetPage(page.getStart(), page.getCount());//分页查询
        User user = (User) session.getAttribute("user");
        List<Order> orders = orderService.list(user.getId());
        //在order上设置orderMsg属性
        order_msgService.setAs(orders);
        int total = (int) new PageInfo<>(orders).getTotal();//总条数
        page.setTotal(total);
        model.addAttribute("total", total);
        model.addAttribute("page", page);
        model.addAttribute("orders", orders);
        return "fore/myOrder";

    }


    @RequestMapping("myOrderA")
    public String myOrderA(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        List<Order> orders = orderService.listA(user.getId());
        //在order上设置orderMsg属性
        order_msgService.setAs(orders);
        model.addAttribute("orders", orders);
        return "fore/myOrderA";

    }

    @RequestMapping("myOrderB")
    public String myOrderB(Model model, HttpSession session, Page page) {
        PageHelper.offsetPage(page.getStart(), page.getCount());//分页查询
        User user = (User) session.getAttribute("user");
        List<Order> orders = orderService.listB(user.getId());
        //在order上设置orderMsg属性
        int total = (int) new PageInfo<>(orders).getTotal();//总条数
        page.setTotal(total);
        model.addAttribute("total", total);
        model.addAttribute("page", page);
        order_msgService.setAs(orders);
        model.addAttribute("orders", orders);
        return "fore/myOrderB";

    }

    @RequestMapping("myOrderC")
    public String myOrderC(Model model, HttpSession session, Page page) {
        PageHelper.offsetPage(page.getStart(), page.getCount());//分页查询
        User user = (User) session.getAttribute("user");
        List<Order> orders = orderService.listC(user.getId());
        //在order上设置orderMsg属性
        order_msgService.setAs(orders);
        int total = (int) new PageInfo<>(orders).getTotal();//总条数
        page.setTotal(total);
        model.addAttribute("total", total);
        model.addAttribute("page", page);
        model.addAttribute("orders", orders);
        return "fore/myOrderC";

    }


    /**
     * 后台管理员页面打印所有订单
     *
     * @param model
     * @param page
     * @return
     */
    @RequestMapping("adminOrder")
    public String adminOrder(Model model, Page page) {
        PageHelper.offsetPage(page.getStart(), page.getCount());//分页查询
        List<Order> orders = orderService.listAll();
        //在order上设置orderMsg属性
        order_msgService.setAs(orders);
        String countPrice = orderService.countPrice();
        int total = (int) new PageInfo<>(orders).getTotal();//总条数
        page.setTotal(total);
        model.addAttribute("page", page);
        model.addAttribute("total", total);
        model.addAttribute("countPrice", countPrice);
        //计算总金额
        model.addAttribute("orders", orders);
        return "admin/listOrder";


    }

    /**
     * 用于在工作人员窗口打印该窗口对应下单的所有订单
     * A:已下单，B：已备餐，3：已取餐或已完成
     *
     * @param model
     * @return
     */
    @RequestMapping("staffOrderA")
    public String staffOrder(Model model, HttpSession session, Page page) {
//        PageHelper.offsetPage(page.getStart(), page.getCount());//分页查询
        User user = (User) session.getAttribute("user");
        System.out.println(user);
        List<Order> orderList = orderService.staffOrder(user.getWid());

        System.out.println(orderList);
        //这里拿到的orderList是未经筛选的，为该员工窗口下的所有订单
        List<Order> orders = new ArrayList<>();
        for (Order order : orderList) {
            if (order.getStatus() == 1) {
                orders.add(order);
            }
        }
//        int total = (int) new PageInfo<>(orders).getTotal();//总条数
//        page.setTotal(total);
//        model.addAttribute("total", total);
//        model.addAttribute("page", page);
        model.addAttribute("orders", orders);
        return "staff/listOrderA";
    }


    @RequestMapping("staffOrderB")
    public String staffOrderB(Model model, HttpSession session, Page page) {
        PageHelper.offsetPage(page.getStart(), page.getCount());//分页查询
        User user = (User) session.getAttribute("user");
        List<Order> orderList = orderService.staffOrder(user.getWid());
        //这里拿到的orderList是未经筛选的，为该员工窗口下的所有订单
        List<Order> orders = new ArrayList<>();
        for (Order order : orderList) {
            if (order.getStatus() == 2) {
                orders.add(order);
            }
        }
        int total = (int) new PageInfo<>(orders).getTotal();//总条数
        page.setTotal(total);
        model.addAttribute("total", total);
        model.addAttribute("page", page);
        model.addAttribute("orders", orders);
        return "staff/listOrderB";
    }

    @RequestMapping("staffOrderC")
    public String staffOrderC(Model model, HttpSession session, Page page) {
        PageHelper.offsetPage(page.getStart(), page.getCount());//分页查询
        User user = (User) session.getAttribute("user");
        List<Order> orderList = orderService.staffOrder(user.getWid());
        //这里拿到的orderList是未经筛选的，为该员工窗口下的所有订单
        List<Order> orders = new ArrayList<>();
        for (Order order : orderList) {
            if ((order.getStatus() == 3) || (order.getStatus() == 4)) {
                orders.add(order);
            }
        }
        int total = (int) new PageInfo<>(orders).getTotal();//总条数
        page.setTotal(total);
        model.addAttribute("total", total);
        model.addAttribute("page", page);
        model.addAttribute("orders", orders);
        return "staff/listOrderC";
    }


    //json更新前台订单页的定单实时状态，不加produces属性会乱码
    @RequestMapping(value = "jsonOrder", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String jsonOrder(HttpSession session) {
        User user = (User) session.getAttribute("user");
        List<Order> orders = orderService.list(user.getId());
        //在order上设置orderMsg属性
        order_msgService.setAs(orders);
        JSONArray json = JSONArray.fromObject(orders);
        return json.toString();
    }


    @RequestMapping(value = "jsonOrderA", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String jsonOrderA(HttpSession session) {
        User user = (User) session.getAttribute("user");
        List<Order> orders = orderService.listA(user.getId());
        //在order上设置orderMsg属性
        order_msgService.setAs(orders);
        JSONArray json = JSONArray.fromObject(orders);
        return json.toString();
    }


    //商家端更新订单状态为已备餐
    @RequestMapping("setStatus")
    @ResponseBody()
    public String setStatus(int id) {
        orderService.setStatus(id);
        return "success";

    }


    //商家端更新订单状态为已取餐
    @RequestMapping("takeStatus")
    @ResponseBody()
    public String takeStatus(int id) {
        orderService.takeStatus(id);
        return "success";

    }

    @RequestMapping("deleteOm")
    public String deleteOm(int id) {
        orderService.del(id);
        return "redirect:myOrder";

    }
}
