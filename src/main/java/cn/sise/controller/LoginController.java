package cn.sise.controller;

import cn.sise.pojo.User;
import cn.sise.pojo.Window;
import cn.sise.service.OrderService;
import cn.sise.service.UserService;
import cn.sise.service.WindowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 登录Controller
 * 1.ip
 * 2.在注销的时候重新写入本次登录时间
 */
@Controller
public class LoginController {
    @Autowired
    private UserService userService;
    @Autowired
    private WindowService windowService;
    @Autowired
    private OrderService orderService;

    @RequestMapping("/loginBeta")
    public String loginBeta() {
        return "login";
    }


    @RequestMapping("/login")
    public String login(String number, String password, HttpSession session, Model model, HttpServletRequest request) {
        String myIp = request.getRemoteAddr();
        model.addAttribute("myIp", myIp);
        User user = userService.findUserByNumber(number);


        if (user == null) {
            model.addAttribute("msg", "学/工号或密码错误!");
            return "login";
        }

        if (password.equals(user.getPassword()) && number.equals(user.getNumber()) && (user.getRole() == 2)) {
            session.setAttribute("user", user);
//          这里拿一下窗口信息
            Window window = windowService.get(user.getWid());
            model.addAttribute("window", window);
            model.addAttribute("user", user);
            return "staff/index";
        }
        if (password.equals(user.getPassword()) && number.equals(user.getNumber()) && (user.getRole() == 3)) {
            session.setAttribute("user", user);
            model.addAttribute("user", user);
            return "admin/index";
        }

        if (password.equals(user.getPassword()) && number.equals(user.getNumber()) && (user.getRole() == 1)) {
            session.setAttribute("user", user);
//          这里初始化一遍订单数据条数
            int a = orderService.orderCountA(user.getId());
            int b = orderService.orderCountB(user.getId());
            int c = orderService.orderCountC(user.getId());
            model.addAttribute("a", a);
            model.addAttribute("b", b);
            model.addAttribute("c", c);
            model.addAttribute("user", user);
            return "fore/index";
        }


        return "login";
    }

    /**
     * 注销，清理session
     *
     * @param session
     * @return
     */
    @RequestMapping("logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:login";
    }

}
