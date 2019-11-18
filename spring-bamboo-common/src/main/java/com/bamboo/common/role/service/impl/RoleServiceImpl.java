package com.bamboo.common.role.service.impl;

import com.bamboo.base.BaseResponse;
import com.bamboo.base.BaseService;
import com.bamboo.common.constant.CodeAndMsgEnum;
import com.bamboo.common.role.dao.RoleDao;
import com.bamboo.common.role.entity.Role;
import com.bamboo.common.role.service.IRoleService;
import com.bamboo.common.role.vo.request.OperationRoleRequest;
import com.bamboo.common.role.vo.request.RolePageRequest;
import com.bamboo.common.role.vo.response.GetRoleResponse;
import com.bamboo.common.role.vo.response.RolePageResponse;
import com.bamboo.exception.ServiceException;
import com.bamboo.utils.CommonUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 角色表 服务实现类
 * </p>
 *
 * @author acumes
 * @since 2019-11-06
 */
@Service
public class RoleServiceImpl extends BaseService<RoleDao, Role> implements IRoleService {

    @Autowired
    private RoleDao roleDao;

    @Override
    public BaseResponse add(OperationRoleRequest request) {
        isCheck(request);
        Role role = new Role();
        BeanUtils.copyProperties(request,role);
        this.save(role);
        return new BaseResponse("添加成功");
    }

    @Override
    public BaseResponse updateRole(OperationRoleRequest request) {
        isCheck(request);
        Role role = (Role) this.getById(request.getId());
        if(CommonUtil.isEmpty(role)){
            throw new ServiceException(CodeAndMsgEnum.ROLE_NOT_EXIST_ERROR.getCode(),CodeAndMsgEnum.ROLE_NOT_EXIST_ERROR.getMsg());
        }
        BeanUtils.copyProperties(request,role);
        this.updateById(role);
        return new BaseResponse("修改成功");
    }

    @Override
    public BaseResponse<RolePageResponse> pageList(RolePageRequest request) {
        RolePageResponse result=new RolePageResponse();
        Page<GetRoleResponse> page = PageHelper.startPage(request.getPageNo(), request.getPageSize(), true);
        List<GetRoleResponse> list = roleDao.list(request);
        result.setData(list);
        CommonUtil.setPage(result,page);
        return new BaseResponse<>(result);
    }

    private void isCheck(OperationRoleRequest request) {
    }
}
