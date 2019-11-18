package com.bamboo.web.role;


import com.bamboo.base.BaseResponse;
import com.bamboo.common.constant.CodeAndMsgEnum;
import com.bamboo.common.role.entity.Role;
import com.bamboo.common.role.service.IRoleService;
import com.bamboo.common.role.vo.request.OperationRoleRequest;
import com.bamboo.common.role.vo.request.RolePageRequest;
import com.bamboo.common.role.vo.response.GetRoleResponse;
import com.bamboo.common.role.vo.response.RolePageResponse;
import com.bamboo.exception.ServiceException;
import com.bamboo.utils.CommonUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 角色表 前端控制器
 * </p>
 *
 * @author acumes
 * @since 2019-11-06
 */
@RestController
@RequestMapping("/role")
@Api(tags = "角色接口")
public class RoleController {

    @Autowired
    private IRoleService roleService;

    @ApiOperation(value = "添加角色")
    @PostMapping(value = "add")
    public BaseResponse add(@RequestBody OperationRoleRequest request){
        return roleService.add(request);
    }
    @ApiOperation(value = "修改角色")
    @PostMapping(value = "update")
    public BaseResponse update(@RequestBody OperationRoleRequest request){
        return roleService.updateRole(request);
    }
    @ApiOperation(value = "删除角色")
    @PostMapping(value = "del/{id}")
    public BaseResponse del(@PathVariable Long id){
        roleService.removeById(id);
        return new BaseResponse("删除成功");
    }
    @ApiOperation(value = "查看角色")
    @GetMapping(value = "detail/{id}")
    public BaseResponse<GetRoleResponse> detail(@PathVariable Long id){
        Role role = (Role) roleService.getById(id);
        if(CommonUtil.isEmpty(role)){
            throw new ServiceException(CodeAndMsgEnum.ROLE_NOT_EXIST_ERROR.getCode(),CodeAndMsgEnum.ROLE_NOT_EXIST_ERROR.getMsg());
        }
        GetRoleResponse response = new GetRoleResponse();
        BeanUtils.copyProperties(role,response);
        return new BaseResponse(response);
    }

    @ApiOperation(value = "角色列表")
    @GetMapping(value = "pageList")
    public BaseResponse<RolePageResponse> pageList(@RequestBody RolePageRequest request){
        return roleService.pageList(request);
    }

}

