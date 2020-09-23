package cn.sise.controller;

import cn.sise.pojo.Db;
import cn.sise.service.DbService;
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
import java.util.Date;
import java.util.List;

/**
 * 数据库管理Controller
 */


@Controller
public class DbController {
    @Autowired
    DbService dbService;


    @RequestMapping("/listDb")
    public String listDb(Model model, Page page) {
        PageHelper.offsetPage(page.getStart(), page.getCount());//分页查询
        List<Db> dbs = dbService.list();
        int total = (int) new PageInfo<>(dbs).getTotal();//总条数
        page.setTotal(total);
        model.addAttribute("page", page);
        model.addAttribute("total", total);
        model.addAttribute("dbs", dbs);
        return "admin/backUp";
    }


    @RequestMapping("/backUp")
    @ResponseBody
    public String backUp(HttpSession session) throws Exception {
        String user = "root";
        String password = "helloworld01";
        String database = "sise";
        String dbName = new SimpleDateFormat("yyyyMMddHHmm").format(new Date()) + "sise.sql";
        String url = session.getServletContext().getRealPath("db_backup");
        System.out.println(url);
        String dbUrl = url + "/" + dbName;
        String backUpDb = "mysqldump" + " " + "-u" + user + " " + "-p" + password + " "
                + "--databases" + " " + database + " " + ">" + " " + dbUrl;
        System.out.println(backUpDb);
        Runtime.getRuntime().exec((new String[]{"/bin/sh", "-c", backUpDb}));
        System.out.println("数据备份完成！");
        //拿到日期时间
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = formatter.format(calendar.getTime());
        Db db = new Db();
        db.setTime(time);
        db.setUrl("/" + dbName);
        dbService.setDb(db);
        return "success";
    }

    /**
     * 删除数据库
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/delDb")
    public String delDb(int id) {
        dbService.delDb(id);
        return "success";
    }


    /**
     * 数据库还原
     *
     * @return
     */

    @RequestMapping("/resetDb")
    @ResponseBody
    public String resetDb(int id, HttpSession session) throws Exception {
        Db db = dbService.get(id);
        String url = db.getUrl();
        String dbUrl = session.getServletContext().getRealPath("db_backup") + url;
        System.out.println(dbUrl);
        String user = "root";
        String password = "helloworld01";
        String database = "sise";
        String resetDb = "mysql" + " " + "-u" + user + " " + "-p" + password + " " + database + " " + "<" + " " + dbUrl;
        Runtime.getRuntime().exec((new String[]{"/bin/sh", "-c", resetDb}));
        System.out.println("还原命令为：" + resetDb);
        System.out.println("还原数据成功！");
        return "success";
    }
}
