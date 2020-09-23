package cn.sise.pojo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

@ToString
@Setter
@Getter
public class User implements Serializable {
    private Integer id;
    private String name;
    private String nickName;
    private String sex;
    private String password;
    private String phone;
    private String number;
    private Integer role;
    private Integer wid;
    private String imgUrl;
}



