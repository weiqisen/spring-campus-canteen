package cn.sise.controller;

import cn.sise.pojo.Hot;
import cn.sise.pojo.Product;
import cn.sise.pojo.User;
import cn.sise.service.HotService;
import cn.sise.service.ProductService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


/**
 * 菜品热度模块
 */
@Controller
public class HotController {
    @Autowired
    private ProductService productService;
    @Autowired
    private HotService hotService;
    /**
     * 菜品点赞模块
     * 一天只能点赞一次，把时间写进数据库进行比对
     * @param id
     * @return
     */
    @RequestMapping("/addLike")
    @ResponseBody
    public String likeProduct(int id, HttpSession session) throws ParseException {
        User user = (User) session.getAttribute("user");
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Hot hot = new Hot();
        hot.setUid(user.getId());
        hot.setPid(id);
        hot.setLike(df.format(new Date()));
        Hot lastHot = hotService.getByUid(hot);


        if (lastHot == null) {
//      插入一条语句并且初始化
            hotService.insertLike(hot);
            hotService.addLike(id);
            Product p1 = productService.get(id);
            System.out.println(p1.getHot());
            String curentHot = Integer.toString(p1.getHot());
            return curentHot;
        }
        System.out.println(lastHot.getLike());
        if (lastHot.getLike() != null) {
            Date d1 = df.parse(lastHot.getLike());
            Date d2 = df.parse(df.format(new Date()));
            long d3 = (d2.getTime()) - (d1.getTime());
            if (d3 < 86400000) {
                System.out.println("点赞失败，间隔时间小于24小时！");
                return "nothinglike";
            }
            hotService.updateLike(hot);
            hotService.addLike(id);
            Product p1 = productService.get(id);
            System.out.println(p1.getHot());
            String curentHot = Integer.toString(p1.getHot());
            return curentHot;
        }

        System.out.println("初次点赞，热度更新！");
        hotService.updateLike(hot);
        hotService.addLike(id);
        Product p1 = productService.get(id);
        System.out.println(p1.getHot());
        String curentHot = Integer.toString(p1.getHot());
        return curentHot;

    }

    /**
     * 用户浏览菜品详情模块
     * 防止频繁刷新，浏览记录间隔默认为三小时
     * 这里要取出用户上次view的时间进行对比，如果时间小于3小时，不增加热度值
     *
     * @param id
     * @return
     */
    @RequestMapping("/addView")
    @ResponseBody
    public String addView(int id, HttpSession session) throws ParseException {
        System.out.println(id);
        User user = (User) session.getAttribute("user");
        Product product = productService.get(id);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Hot hot = new Hot();
        hot.setUid(user.getId());
        hot.setPid(id);
        hot.setView(df.format(new Date()));
        System.out.println(hot.toString());
        Hot lastHot = hotService.getByUid(hot);
        if (lastHot == null) {
//      插入一条语句并且初始化
            System.out.println("用户:" + user.getId() + "当前未查询到浏览" + product.getName() + "记录，已新增一条hot记录！");
            hotService.insert(hot);
            hotService.addView(id);
            Product p1 = productService.get(id);
            String curentHot = Integer.toString(p1.getHot());
            System.out.println("传到前台的hot" + p1.getHot());
            System.out.println("product：" + p1.getName() + "在合理时间内被浏览一次，热度加2");
            return curentHot;
        }

        Date d1 = df.parse(lastHot.getView());
        Date d2 = df.parse(df.format(new Date()));
        long d3 = (d2.getTime()) - (d1.getTime());
        if (d3 < 10800000) {
//                10800000
            System.out.println("访问页面太频繁，热度不会被更新");
            return "nothingview";
        }
//              这里要更新一下view字段的时间
        Hot nowHot = new Hot();
        nowHot.setView(df.format(new Date()));
        nowHot.setPid(product.getId());
        nowHot.setUid(user.getId());
        hotService.updateView(nowHot);
        hotService.addView(id);
        String curentHot = Integer.toString(product.getHot());
        System.out.println("product：" + product.getName() + "--被浏览一次，热度加2");
        return curentHot;

    }


    /**
     * ajax异步更新foreListProduct的Hot值
     */
    @RequestMapping(value = "refreshHot", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String refreshHot(Model model) {
        List<Product> list = productService.list();
        model.addAttribute("list", list);
        JSONArray json = JSONArray.fromObject(list);
        return json.toString();

    }
}
