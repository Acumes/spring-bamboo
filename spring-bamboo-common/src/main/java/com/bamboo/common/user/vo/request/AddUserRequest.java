package com.bamboo.common.user.vo.request;

import com.baomidou.mybatisplus.annotation.TableLogic;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author: acumes
 * @create: 2019-11-05 19:15:28
 * @description:
 */
@Data
@ApiModel("添加用户请求类")
public class AddUserRequest implements Serializable {

    private static final long serialVersionUID = 718244950311344014L;
    @ApiModelProperty(value = "账号")
    private String account;

    @ApiModelProperty(value = "密码")
    private String password;

    @ApiModelProperty(value = "昵称")
    private String name;

    @ApiModelProperty(value = "真名")
    private String realName;

    @ApiModelProperty(value = "邮箱")
    private String email;

    @ApiModelProperty(value = "手机")
    private String phone;

    @ApiModelProperty(value = "生日")
    private Date birthday;

    @ApiModelProperty(value = "性别")
    private Integer sex;

    @ApiModelProperty(value = "角色id")
    private String roleId;

}
