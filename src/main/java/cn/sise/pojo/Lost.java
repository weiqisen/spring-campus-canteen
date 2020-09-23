package cn.sise.pojo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Lost {
    private Integer id;
    private Integer uid;
    private String imgUrl;
    private String time;
    private String content;
    private String kind;
    private User user;
}
