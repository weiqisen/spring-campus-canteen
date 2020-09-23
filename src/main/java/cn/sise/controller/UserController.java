package cn.sise.controller;

import cn.sise.pojo.Image;
import cn.sise.pojo.User;
import cn.sise.service.UserService;
import cn.sise.util.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/showUser")
    public String showUser(Model model, HttpSession session) {
        User user1 = (User) session.getAttribute("user");
        User user = userService.get(user1.getId());
        model.addAttribute("user", user);
        if (user1.getRole() == 4) {
            return "back/showUser";
        }
        if (user1.getRole() == 2) {
            return "staff/showUser";
        }
        if (user1.getRole() == 3) {
            return "admin/showUser";
        }
        return "user/showUser";
    }

    /**
     * 后台管理员页面的所有用户数据展示
     *
     * @param model
     * @param page
     * @return
     */
    @RequestMapping("/findAllUser")
    public String findAllUser(Model model, Page page) {
        PageHelper.offsetPage(page.getStart(), page.getCount());//分页查询
        List<User> users = userService.findAllUser();
        int total = (int) new PageInfo<>(users).getTotal();//总条数
        page.setTotal(total);
        model.addAttribute("users", users);
        model.addAttribute("total", total);
        model.addAttribute("page", page);
        return "admin/listUserAll";
    }

    /**
     * 后台管理员页面的普通用户数据展示
     *
     * @param model
     * @param page
     * @return
     */
    @RequestMapping("/listUserA")
    public String findUserA(Model model, Page page) {
        PageHelper.offsetPage(page.getStart(), page.getCount());//分页查询
        List<User> users = userService.listUserA();
        int total = (int) new PageInfo<>(users).getTotal();//总条数
        page.setTotal(total);
        model.addAttribute("users", users);
        model.addAttribute("total", total);
        model.addAttribute("page", page);
        return "admin/listUserA";
    }

    /**
     * 后台管理员页面的员工用户数据展示
     *
     * @param model
     * @param page
     * @return
     */

    @RequestMapping("/listUserB")
    public String findUserB(Model model, Page page) {
        PageHelper.offsetPage(page.getStart(), page.getCount());//分页查询
        List<User> users = userService.listUserB();
        int total = (int) new PageInfo<>(users).getTotal();//总条数
        page.setTotal(total);
        model.addAttribute("total", total);
        model.addAttribute("page", page);
        model.addAttribute("users", users);
        return "admin/listUserB";
    }


    //跳转到添加页面
    @RequestMapping("/toAdd")
    public String toAdd() {
        return "user/addUser";
    }


    @RequestMapping("/addUser")
    public String addUser(User user) {
        //做一个判断，性别为男设置男生头像，性别为女设置女默认头像
        if (user.getSex().equals("男")) {
            user.setImgUrl("images/user/man.jpg");
        } else {
            user.setImgUrl("images/user/women.jpg");
        }
        userService.addUser(user);

        return "redirect:findAllUser";
    }

    //修改功能判断角色类型跳转相应页面
    @RequestMapping("/editUser")
    public String showUser(int id, Model model, HttpSession session) {
        User userRole = (User) session.getAttribute("user");
        User user = userService.get(id);
        model.addAttribute("user", user);
        if (userRole.getRole() == 1) {
            return "user/editUser";
        } else if (userRole.getRole() == 3) {
            return "admin/editUser";
        }
        if (userRole.getRole() == 2) {
            return "staff/editUser";
        }
        return null;
    }

    /**
     * 前台修改个人信息
     *
     * @param user
     * @param image
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/updateUser")
    public String updateUser(User user, @RequestParam(value = "image") MultipartFile image,
                             HttpSession session) throws Exception {
        userService.updateUser(user);
        if (image.getSize() != 0) {
            String imageName = user.getNumber() + ".jpg";
            File file = new File(session.getServletContext().getRealPath("/images/user"), imageName);
            file.getParentFile().mkdirs();
            image.transferTo(file);
            Image image1 = new Image();
            image1.setId(user.getId());
            image1.setImgUrl("images/user/" + imageName);
            userService.setImgUrl(image1);
        }
        return "redirect:showUser";

    }

    //管理端修改用户信息
    @RequestMapping("/updateUserByCondition")
    public String updateUser(User user) {
        userService.updateUser(user);
        return "redirect:findAllUser";

    }

    @RequestMapping("/delUser")
    public String delUser(int id) {
        userService.deleteUser(id);
        return "redirect:findAllUser";

    }

    @RequestMapping("findByName")
    public String findByName(String name, Model model, Page page) {
        List<User> users = userService.findByName(name);
        int total = (int) new PageInfo<>(users).getTotal();//总条数
        page.setTotal(total);
        model.addAttribute("users", users);
        model.addAttribute("total", total);
        model.addAttribute("users", users);
        System.out.println("模糊查询返回结果：" + users.toString());
        return "admin/listUserAll";
    }
}
