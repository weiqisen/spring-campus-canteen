package cn.sise.pojo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Comment {
    private Integer id;
    private String content;
    private int uid;
    private int oid;
    private int status;
    private String time;
    private Order order;
    private User user;

}
