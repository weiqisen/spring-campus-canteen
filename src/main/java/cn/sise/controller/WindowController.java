package cn.sise.controller;

import cn.sise.pojo.Canteen;
import cn.sise.pojo.Image;
import cn.sise.pojo.User;
import cn.sise.pojo.Window;
import cn.sise.service.CanteenService;
import cn.sise.service.UserService;
import cn.sise.service.WindowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * 窗口模块
 */
@Controller
public class WindowController {
    @Autowired
    private WindowService windowService;
    @Autowired
    private CanteenService canteenService;
    @Autowired
    private UserService userService;

    @RequestMapping("/listWindow")
    public String list(Model model) {
        List<Window> list = windowService.list();
        model.addAttribute("list", list);
        model.addAttribute("size", list.size());
        return "window/window-list";
    }

    /**
     * 后台管理员页面跳转添加窗口
     * 这里要携带上一个tid：代表从哪个饭堂上去添加窗口
     *
     * @return
     */
    @RequestMapping("/toAddWindow")
    public String toAddWindow(@RequestParam(value = "tid") int tid, Model model) {
        Canteen canteen = canteenService.get(tid);
        model.addAttribute("canteen", canteen);
        return "window/addWindow";

    }

    /**
     * 执行添加动作以后跳转至管理员后台窗口页面
     * 默认设置对应的tid：为新窗口默认绑定对应饭堂
     * 设置wid到user表：为员工绑定窗口
     *
     * @param window
     * @return
     */

    @RequestMapping("/addWindow")
    public String addWindow(Window window, HttpSession session, RedirectAttributes redirectAttributes, @RequestParam(value = "image") MultipartFile image, @RequestParam(value = "number") String number, @RequestParam(value = "tid") int tid) throws IOException {
        window.setTid(tid);

        windowService.insert(window);
        User user = userService.findUserByNumber(number);
        user.setWid(window.getId());
        userService.updateUserWid(user);

        if (image.getSize() != 0) {
            String imageName = window.getId() + "_window.jpg";
            File file = new File(session.getServletContext().getRealPath("/images/window"), imageName);
            file.getParentFile().mkdirs();
            image.transferTo(file);
            Image image1 = new Image();
            image1.setId(window.getId());
            image1.setImgUrl("images/window/" + imageName);
            windowService.setImgUrl(image1);
        }
//      这里做一个带参数的重定向，重新打印一遍最新窗口数据
        redirectAttributes.addAttribute("id", tid);
        return "redirect:/findWindowByTid";

    }

    @RequestMapping("/delWindow")
    public String del(int id) {
        windowService.del(id);
        return "redirect:adminListCanteen";
    }

    /**
     * 管理员页面和窗口工作人员共用
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/editWindow")
    public String edit(int id, Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        Window window = windowService.get(id);
        model.addAttribute("window", window);
        if (user.getRole() == 2) {
            return "window/editWindow";
        }
        if (user.getRole() == 3) {
            return "admin/editWindow";
        }
        return null;
    }


    /**
     * 管理员更新窗口信息业务
     *
     * @param window
     * @param number
     * @param oldNumber
     * @param session
     * @param image
     * @return
     * @throws Exception
     */
    @RequestMapping("/updateWindow")
    public String update(Window window, @RequestParam(value = "number") String number, @RequestParam(value = "oldNumber") String oldNumber, HttpSession session, @RequestParam(value = "image") MultipartFile image) throws Exception {
//      这里的update不涉及更改属性tid
        windowService.update(window);
//      这里是更改窗口负责人的业务
//      number为当前提交表单输入框字符，oldNumber为原number字符
        if (!number.equals(oldNumber)) {
//      如果有更改，则要把原来的user的wid设置为空
            User oldUser = userService.findUserByNumber(oldNumber);
            userService.setWidNull(oldUser.getId());
            User user1 = userService.findUserByNumber(number);
            user1.setWid(window.getId());
            userService.updateUserWid(user1);

        }

        if (image.getSize() != 0) {
            String imageName = window.getId() + "_siseWindow.jpg";
            File file = new File("/Users/weiqisen/Desktop/myidea/wqs/src/main/webapp/images/window", imageName);
            file.getParentFile().mkdirs();
            image.transferTo(file);
            Image img = new Image();
            img.setId(window.getId());
            img.setImgUrl("images/window/" + imageName);
            windowService.setImgUrl(img);
        }

        return "redirect:adminListCanteen";
    }

    /**
     * 窗口管理人员更新窗口信息业务
     */
    @RequestMapping("/toUpdateWindow")
    public String toUpdateWindow(Window window, HttpSession session, @RequestParam(value = "image") MultipartFile image) throws Exception {
        windowService.update(window);
        if (image.getSize() != 0) {
            String imageName = window.getId() + "_siseWindow.jpg";
            File file = new File(session.getServletContext().getRealPath("/images/window"), imageName);
            file.getParentFile().mkdirs();
            image.transferTo(file);
            System.out.printf("窗口管理人员已更新窗口信息");
            Image img = new Image();
            img.setId(window.getId());
            img.setImgUrl("images/window/" + imageName);
            windowService.setImgUrl(img);
        }
        return "redirect:findWindowByWid";
    }


    /**
     * 员工后台根据员工对应窗口id查找对应窗口
     *
     * @return
     */
    @RequestMapping("/findWindowByWid")
    public String findWindowByWid(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        Window window = windowService.get(user.getWid());
        Canteen canteen = canteenService.get(user.getWid());
        model.addAttribute("window", window);
        model.addAttribute("canteen", canteen);
        return "staff/listWindows";
    }


    /**
     * 设置窗口营业/打烊
     */
    @ResponseBody
    @RequestMapping("setOpen")
    public String setOpen(HttpSession session) {
        User user = (User) session.getAttribute("user");
        windowService.setOpen(user.getWid());
        return "success";

    }

    @ResponseBody
    @RequestMapping("setClose")
    public String setClose(HttpSession session) {
        User user = (User) session.getAttribute("user");
        windowService.setClose(user.getWid());
        return "success";

    }

}
