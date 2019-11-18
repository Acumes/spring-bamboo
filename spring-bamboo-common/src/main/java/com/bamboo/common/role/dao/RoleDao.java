package com.bamboo.common.role.dao;

import com.bamboo.common.role.entity.Role;
import com.bamboo.common.role.vo.request.RolePageRequest;
import com.bamboo.common.role.vo.response.GetRoleResponse;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;

import java.util.List;

/**
 * <p>
 * 角色表 Mapper 接口
 * </p>
 *
 * @author acumes
 * @since 2019-11-06
 */
public interface RoleDao extends BaseMapper<Role> {

    /**
     * 获取角色list
     * @param request
     * @return
     */
    List<GetRoleResponse> list(RolePageRequest request);
}
