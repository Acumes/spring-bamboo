package com.bamboo.web.user;

import com.bamboo.base.BaseResponse;
import com.bamboo.common.user.entity.User;
import com.bamboo.common.user.service.IUserService;
import com.bamboo.common.user.vo.request.AddUserRequest;
import com.bamboo.utils.CommonUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author: acumes
 * @create: 2019-11-04 14:07:20
 * @description:
 */
@RestController
@Api(tags = "用户接口")
public class UserController {

    @Autowired
    private IUserService userService;

    @ApiOperation(value = "获取用户")
    @GetMapping("/getUser")
    public BaseResponse<User> getUser(Long id){
        User user = (User) userService.getById(id);
        return new BaseResponse<>(user);
    }
    @ApiOperation(value = "添加用户")
    @GetMapping("/addUser")
    public User addUser(@RequestBody AddUserRequest request){
        User user = new User();
        BeanUtils.copyProperties(request,user);
        CommonUtil.setCreate(user);
        userService.save(user);
        return user;
    }
    @ApiOperation(value = "添加用户")
    @GetMapping("/updateUser")
    public User updateUser(){
        User user = (User) userService.getById(1191253966197882881l);
        user.setAccount("44444444444");
        userService.updateById(user);
        return user;
    }

    public static void main(String[] args) {
        String random = CommonUtil.createRandom(false, 9);
        System.out.println(random);
        System.out.println(DigestUtils.md5Hex("123456"+ random));
    }
}
