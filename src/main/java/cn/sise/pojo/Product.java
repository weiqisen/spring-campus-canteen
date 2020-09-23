package cn.sise.pojo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Product {
    private Integer id;
    private String name;
    private Float price;
    private String detail;
    private String imgUrl;
    private int hot;
    private int like;
    private Integer status;
    private Integer wid;
    private Integer uid;
    private User user;
    private Window window;
    private Canteen canteen;
}

