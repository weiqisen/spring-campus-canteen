package cn.sise.pojo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter
@Setter
@ToString
public class Window {
    private Integer id;
    private String name;
    private Integer tid;
    private String imgUrl;
    private String detail;
    private Integer status;
    //  用于后台管理员页面打印窗口信息的时候显示对应负责人信息
    private User user;
    private List<Product> products;
}
