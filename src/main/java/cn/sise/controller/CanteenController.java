package cn.sise.controller;

import cn.sise.pojo.Canteen;
import cn.sise.pojo.Image;
import cn.sise.service.CanteenService;
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

public class CanteenController {
    @Autowired
    private CanteenService canteenService;

    /**
     * 前台打印Canteen数据
     *
     * @param model
     * @param
     * @return
     */
    @RequestMapping("/listCanteen")
    public String list(Model model) {
        List<Canteen> canteens = canteenService.list();
        model.addAttribute("canteens", canteens);
        return "canteen/listCanteen";

    }

    /**
     * 管理员后台打印Canteen信息
     *
     * @param model
     * @return
     */
    @RequestMapping("/adminListCanteen")
    public String list(Model model, Page page) {
        PageHelper.offsetPage(page.getStart(), page.getCount());//分页查询
        List<Canteen> canteens = canteenService.list();
        int total = (int) new PageInfo<>(canteens).getTotal();//总条数
        page.setTotal(total);
        model.addAttribute("page", page);
        model.addAttribute("total", total);
        model.addAttribute("canteens", canteens);
        return "admin/listCanteen";

    }

    /**
     * 跳转到添加页面
     *
     * @return
     */
    @RequestMapping("/toAddCanteen")
    public String toAddCanteen() {
        return "canteen/addCanteen";
    }


    /**
     * 执行添加动作
     *
     * @param canteen
     * @param image
     * @return
     * @throws Exception
     */
    @RequestMapping("/addCanteen")
    public String add(Canteen canteen, HttpSession session, @RequestParam(value = "image") MultipartFile image) throws Exception {
        canteenService.insert(canteen);
        if (image.getSize() != 0) {
            String imageName = canteen.getId() + "_siseCanteen.jpg";
            // File file = new File(session.getServletContext().getRealPath("/images/canteen"), imageName);
            File file = new File(session.getServletContext().getRealPath("/images/canteen"), imageName);
            file.getParentFile().mkdirs();
            image.transferTo(file);
            Image img = new Image();
            img.setId(canteen.getId());
            img.setImgUrl("images/canteen/" + imageName);
            canteenService.setImgUrl(img);
        }
        return "redirect:adminListCanteen";
    }

    @RequestMapping("/delCanteen")
    public String del(@RequestParam(value = "id") int id) {
        canteenService.deleteById(id);
        return "redirect:adminListCanteen";
    }


    @RequestMapping("/editCanteen")
    public String edit(@RequestParam(value = "id") int id, Model model) {
        Canteen canteen = canteenService.selectById(id);
        model.addAttribute("canteen", canteen);
        return "canteen/editCanteen";
    }

    @RequestMapping("/updateCanteen")
    public String updateCanteen(Canteen canteen, HttpSession session, @RequestParam(value = "image") MultipartFile image) throws Exception {
        canteenService.updateById(canteen);
        if (image.getSize() != 0) {
            String imageName = canteen.getId() + "_siseCanteen.jpg";
            File file = new File(session.getServletContext().getRealPath("/images/canteen"), imageName);
            file.getParentFile().mkdirs();
            image.transferTo(file);
            Image img = new Image();
            img.setId(canteen.getId());
            img.setImgUrl("images/canteen/" + imageName);
            canteenService.setImgUrl(img);
            System.out.println("饭堂信息更新成功！！");
        }
        return "redirect:adminListCanteen";
    }

}
