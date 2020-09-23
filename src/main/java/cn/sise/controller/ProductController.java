package cn.sise.controller;

import cn.sise.pojo.Image;
import cn.sise.pojo.Product;
import cn.sise.pojo.User;
import cn.sise.pojo.Window;
import cn.sise.service.ProductService;
import cn.sise.service.WindowService;
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
import java.io.IOException;
import java.util.List;


@Controller

public class ProductController {
    @Autowired
    private ProductService productService;
    @Autowired
    private WindowService windowService;


    @RequestMapping("/addProduct")
    public String addProduct() {
        return "product/productAdd";
    }

    /**
     * 菜品添加：
     * 前面三句，默认把这个员工绑定的窗口id设置进对应添加的菜品上
     *
     * @param session,product,image
     * @return
     * @throws IOException ps:System.currentTimeMillis()也用可以
     */
    @RequestMapping("/add")
    public String add(HttpSession session, Product product, @RequestParam(value = "image") MultipartFile image) throws IOException {
        User user = (User) session.getAttribute("user");
        product.setWid(user.getWid());
        productService.insert(product);
        if (image.getSize() != 0) {
            String imageName = product.getId() + "_sise.jpg";
            File file = new File(session.getServletContext().getRealPath("/images/product"), imageName);
            file.getParentFile().mkdirs();
            image.transferTo(file);
            Image img = new Image();
            img.setId(product.getId());
            img.setImgUrl("images/product/" + imageName);
            productService.setImgUrl(img);
        }
        return "redirect:findProductByWid";
    }

    @RequestMapping("toUpdate")
    public String toUpdate(int id, Model model) {
        Product p = productService.get(id);
        model.addAttribute("p", p);
        return "product/editProduct";
    }

    /**
     * 菜品状态调整：在售/无货
     *
     * @param id
     * @return
     */
    @RequestMapping("lockProduct")
    public String lockProduct(int id) {
        productService.lock(id);
        return "redirect:findProductByWid";
    }


    @RequestMapping("unlockProduct")
    public String unlockProduct(int id) {
        productService.unlock(id);
        System.out.printf("菜品状态已更新为在售！");
        return "redirect:findProductByWid";
    }

    /*菜品更新*/
    @RequestMapping("/updateProduct")
    public String updateProduct(Product product, HttpSession session, @RequestParam(value = "image") MultipartFile image, Model model) throws Exception {
        productService.update(product);
        if (image.getSize() != 0) {
            String imageName = product.getId() + "_sise.jpg";
            File file = new File(session.getServletContext().getRealPath("/images/product"), imageName);
            file.getParentFile().mkdirs();
            image.transferTo(file);
            Image img = new Image();
            System.out.println("!");
            img.setId(product.getId());
            img.setImgUrl("images/product/" + imageName);
            productService.setImgUrl(img);
        }
        return "redirect:findProductByWid";
    }


    /**
     * 前台菜品热度页面打印所有菜品信息
     *
     * @param model
     * @param page
     * @return
     */
    @RequestMapping("/listProductFore")
    public String listProductFore(Model model, Page page) {
        PageHelper.offsetPage(page.getStart(), page.getCount());
        List<Product> listHotProduct = productService.list();
        int total = (int) new PageInfo<>(listHotProduct).getTotal();//总条数
        page.setTotal(total);
        model.addAttribute("listHotProduct", listHotProduct);
        model.addAttribute("total", total);
        model.addAttribute("page", page);
        return "fore/listProduct";
    }


    /**
     * 后台窗口工作人员打印出该窗口下所管理的菜品信息
     *
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("findProductByWid")
    public String findProductByWid(Model model, HttpSession session, Page page) {
        PageHelper.offsetPage(page.getStart(), page.getCount());//分页查询
        User user = (User) session.getAttribute("user");
        List<Product> products = productService.findByWid(user.getWid());
        Window window = windowService.get(user.getWid());
        int total = (int) new PageInfo<>(products).getTotal();//总条数
        page.setTotal(total);
        model.addAttribute("total", total);
        model.addAttribute("page", page);
        model.addAttribute("products", products);
        model.addAttribute("window", window);
        return "staff/listProduct";
    }

    /**
     * 菜品删除
     *
     * @param id
     * @return
     */
    @RequestMapping("/delProduct")
    public String delProduct(int id) {
        productService.delete(id);
        return "staff/listProduct";
    }


    /**
     * 菜品详情页面跳转
     */
    @RequestMapping("/productDetail")
    public String productDetail(int id, Model model) {
        Product product = productService.get(id);
        model.addAttribute("product", product);
        return "product/productDetail";
    }


}
