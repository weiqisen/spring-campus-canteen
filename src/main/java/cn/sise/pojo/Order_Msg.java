package cn.sise.pojo;

import lombok.Setter;
import lombok.Getter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class Order_Msg {
    private Integer id;
    private int number;
    private int pid;
    private int uid;
    private int oid;
    //连接一个Product
    private Product product;
}
