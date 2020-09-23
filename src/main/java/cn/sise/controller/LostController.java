package cn.sise.controller;

import cn.sise.pojo.Image;
import cn.sise.pojo.Lost;
import cn.sise.pojo.User;
import cn.sise.service.LostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

/**
 * 失物发布Controller
 */
@Controller
public class LostController {
    @Autowired
    private LostService lostService;

    //   前台失物信息记录
    @RequestMapping("lost")
    public String lost(Model model) {
        List<Lost> losts = lostService.listAll();
        model.addAttribute("losts", losts);
        return "lost/lost";
    }

    //前台进入失物信息详细页面
    @RequestMapping("lostDetail")
    public String lostDetail(Model model, int id) {
        Lost lost = lostService.get(id);
        model.addAttribute("lost", lost);
        return "lost/lostDetail";
    }


    @RequestMapping("toAddLost")
    public String toAdd() {
        return "lost/addLost";

    }

    @RequestMapping("delLost")
    public String toAdd(int id) {
        lostService.del(id);
        return "redirect:myLost";

    }


    //  发布失物信息
    @RequestMapping("addLost")
    public String addDetail(HttpSession session, Lost lost, MultipartFile image) {
        User user = (User) session.getAttribute("user");
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String time = formatter.format(calendar.getTime());
        lost.setUid(user.getId());
        lost.setTime(time);
        lostService.insert(lost);
        //加日期
        if (image.getSize() != 0) {
            String imageName = time + "_lost.jpg";
            File file = new File(session.getServletContext().getRealPath("/images/lost"), imageName);
            file.getParentFile().mkdirs();
            try {
                image.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
            Image img = new Image();
            img.setId(lost.getId());
            img.setImgUrl("images/lost/" + imageName);
            lostService.setImgUrl(img);
        }

        return "redirect:lost";

    }

    @RequestMapping("myLost")
    public String myLost(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        List<Lost> losts = lostService.findMyLost(user.getId());
        model.addAttribute("losts", losts);
        return "lost/myLost";

    }
}
