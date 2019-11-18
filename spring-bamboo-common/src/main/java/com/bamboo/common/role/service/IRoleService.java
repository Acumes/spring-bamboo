package com.bamboo.common.role.service;

import com.bamboo.base.BaseResponse;
import com.bamboo.base.Service;
import com.bamboo.common.role.entity.Role;
import com.bamboo.common.role.vo.request.OperationRoleRequest;
import com.bamboo.common.role.vo.request.RolePageRequest;
import com.bamboo.common.role.vo.response.RolePageResponse;

/**
 * <p>
 * 角色表 服务类
 * </p>
 *
 * @author acumes
 * @since 2019-11-06
 */
public interface IRoleService extends Service<Role> {

    /**
     * 添加角色
     * @param request
     * @return
     */
    BaseResponse add(OperationRoleRequest request);

    /**
     * 修改角色
     * @param request
     * @return
     */
    BaseResponse updateRole(OperationRoleRequest request);

    /**
     * 分页列表
     * @param request
     * @return
     */
    BaseResponse<RolePageResponse> pageList(RolePageRequest request);
}
