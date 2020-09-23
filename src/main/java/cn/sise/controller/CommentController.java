package cn.sise.controller;

import cn.sise.pojo.Comment;
import cn.sise.pojo.Order;
import cn.sise.pojo.User;
import cn.sise.service.CommentService;
import cn.sise.service.OrderService;
import cn.sise.util.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

/**
 * 评论模块
 */

@Controller
public class CommentController {

    @Autowired
    OrderService orderService;
    @Autowired
    CommentService commentService;

    //这里做一个订单状态判断是否能进行评价
    @RequestMapping("comment")
    @ResponseBody
    public String comment(int id) {
        Order order = orderService.get(id);
        System.out.println("status=" + order.getStatus());
        if (order.getStatus() == 1 || order.getStatus() == 2) {
            return "false";
        } else if (order.getStatus() == 3) {
            return "success";
        } else if (order.getStatus() == 4) {
            return "done";
        }
        return null;

    }

    @RequestMapping("toComment")
    public String toComment(Model model, int id) {
        Order order = orderService.get(id);
        String orderNumber = order.getNumber();
        model.addAttribute("orderNumber", orderNumber);
        model.addAttribute("id", id);
        System.out.println("id为" + id + "订单编号为：" + orderNumber);
        return "fore/addComment";

    }

    //前端新增评论
    @RequestMapping("addComment")
    public String addComment(HttpSession session, Comment comment) {
        Comment c = comment;
        User user = (User) session.getAttribute("user");
        c.setUid(user.getId());
        //设置评论发布时间
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = formatter.format(calendar.getTime());
        c.setTime(time);
        c.setStatus(0);

        commentService.insert(c);
//      新增一条评价的时候就应该改变订单状态为已评价

        orderService.commentStatus(comment.getOid());
        return "fore/commentSuccess";
    }

    /**
     * 后台管理员页面打印所有评论
     *
     * @param model
     * @return
     */
    @RequestMapping("getComment")
    public String getComment(Model model, Page page) {
        PageHelper.offsetPage(page.getStart(), page.getCount());//分页查询
        //list的同时设置order属性
        List<Comment> comments = commentService.list();
        int total = (int) new PageInfo<>(comments).getTotal();//总条数
        page.setTotal(total);
        model.addAttribute("total", total);
        model.addAttribute("page", page);
        model.addAttribute("comments", comments);
        return "admin/listComment";
    }

    /**
     * 后台管理员页面A打印待审核评论
     *
     * @param model
     * @return
     */
    @RequestMapping("getCommentA")
    public String getCommentA(Model model, Page page) {
        PageHelper.offsetPage(page.getStart(), page.getCount());//分页查询
        //list的同时设置order属性
        List<Comment> comments = commentService.listByWaitPass();
        int total = (int) new PageInfo<>(comments).getTotal();//总条数
        page.setTotal(total);
        model.addAttribute("total", total);
        model.addAttribute("page", page);
        model.addAttribute("comments", comments);
        return "admin/listCommentA";
    }


    /**
     * 审核通过
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("pass")
    public String pass(int id) {
        commentService.pass(id);
        return "success";
    }

    /**
     * 前台/窗口工作人员,展示评论，评论设置对应用户学号属性
     *
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("foreComment")
    public String foreComment(Model model, HttpSession session, Page page) {
        PageHelper.offsetPage(page.getStart(), page.getCount());//分页查询
        User user = (User) session.getAttribute("user");
        List<Comment> comments = commentService.listByPass();
        int total = (int) new PageInfo<>(comments).getTotal();//总条数
        page.setTotal(total);
        System.out.println(comments.toString());
        model.addAttribute("total", total);
        model.addAttribute("page", page);
        model.addAttribute("comments", comments);
        if (user.getRole() == 2) {
            return "staff/listComment";
        }
        if (user.getRole() == 3) {
            return "admin/listCommentB";
        }
        return "fore/listComment";
    }
}
