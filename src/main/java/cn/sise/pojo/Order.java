package cn.sise.pojo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.xml.soap.SAAJResult;
import java.util.List;

@Getter
@Setter
@ToString

public class Order {
    private Integer id;
    private String number;
    private String detail;
    private String time;
    private int status;
    private int uid;
    private Float totalPrice;
    //用于myOrder里面的关联
    private List<Order_Msg> order_msgs;
}
