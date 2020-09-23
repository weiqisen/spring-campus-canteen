package cn.sise.controller;

import cn.sise.pojo.Canteen;
import cn.sise.pojo.Product;
import cn.sise.pojo.User;
import cn.sise.pojo.Window;
import cn.sise.service.CanteenService;
import cn.sise.service.ProductService;
import cn.sise.service.WindowService;
import cn.sise.util.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
public class ForeController {
    @Autowired
    private ProductService productService;
    @Autowired
    private WindowService windowService;
    @Autowired
    private CanteenService canteenService;

    /**
     * 设置主页跳转
     *
     * @return
     */
    @RequestMapping("index")
    public String index(HttpSession session, Model model, HttpServletRequest request) {
        User user = (User) session.getAttribute("user");
        String myIp = request.getRemoteAddr();
        model.addAttribute("myIp", myIp);
        if (user.getRole() == 1) {

            List<Window> windows=windowService.list();
            for (Window w:windows){
                List<Product> products=productService.findByWid(w.getId());
                w.setProducts(products);
            }
            System.out.println(windows.toString());
            model.addAttribute("windows",windows);
            session.setAttribute("windows",windows);
            return "fore/index";
        }
        if (user.getRole() == 2) {
            Window window = windowService.get(user.getWid());
            model.addAttribute("window", window);
            model.addAttribute("user", user);
            return "staff/index";
        }
        if (user.getRole() == 3) {
            return "admin/index";
        }
        return null;

    }



    /**
     * 管理员跳转前台页面
     *
     * @param session
     * @return
     */
    @RequestMapping("adminFore")
    public String adminFore(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user.getRole() == 3) {
            return "fore/index";
        }
        return "redirect:index";
    }


    /**
     * 前台/管理员后台打印Canteen目录下对应的窗口信息
     * 这里带上一个窗口对应的窗口工作人员属性
     *
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("/findWindowByTid")
    public String findWindowByTid(Model model, HttpSession session, int id, Page page) {
        PageHelper.offsetPage(page.getStart(), page.getCount());//分页查询
        User user = (User) session.getAttribute("user");
        List<Window> windows = windowService.findByTid(id);
        Canteen canteen = canteenService.get(id);
        int total = (int) new PageInfo<>(windows).getTotal();//总条数
        page.setTotal(total);
        model.addAttribute("total", total);
        model.addAttribute("page", page);
        model.addAttribute("windows", windows);
        model.addAttribute("canteen", canteen);
        if (user.getRole() == 3) {
            return "admin/listWindows";
        }
        return "fore/findWindows";
    }

    /**
     * 前台页面根据从饭堂进入窗口再进入到菜品列表页面，打印菜品列表信息
     */
    @RequestMapping("foreFindProduct")
    public String foreFindProduct(int id, Model model, Page page) {
        PageHelper.offsetPage(page.getStart(), page.getCount());//分页查询
        List<Product> products = productService.findByWid(id);
        int total = (int) new PageInfo<>(products).getTotal();//总条数
        page.setTotal(total);
        model.addAttribute("total", total);
        model.addAttribute("page", page);
        model.addAttribute("products", products);
        return "fore/listProductByWindow";
    }


    /**
     * 主页搜索菜品
     */
    @RequestMapping("findProductByName")
    public String findProductByName(String pName, Model model, Page page) {
        PageHelper.offsetPage(page.getStart(), page.getCount());
        List<Product> products = productService.findProductByName(pName);
        int total = (int) new PageInfo<>(products).getTotal();//总条数
        page.setTotal(total);
        model.addAttribute("total", total);
        model.addAttribute("page", page);
        model.addAttribute("products", products);
        return "fore/productSearch";
    }
}
