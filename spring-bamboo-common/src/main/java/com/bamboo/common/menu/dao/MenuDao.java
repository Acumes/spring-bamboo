package com.bamboo.common.menu.dao;

import com.bamboo.common.menu.entity.Menu;
import com.bamboo.common.menu.vo.request.GetMenuRequest;
import com.bamboo.common.menu.vo.request.OperationMenuRequest;
import com.bamboo.common.menu.vo.response.GetMenuResponse;
import com.bamboo.common.menu.vo.response.MenuVoResponse;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * 菜单表 Mapper 接口
 * </p>
 *
 * @author acumes
 * @since 2019-11-06
 */
public interface MenuDao extends BaseMapper<Menu> {

    /**
     * 获取菜单树
     * @param permission
     * @return
     */
    List<GetMenuResponse> getTree(GetMenuRequest permission);

    /**
     * 查询授权的菜单列表
     * @param permissionReq
     * @return
     */
    List<GetMenuResponse> selRolePermission(GetMenuRequest permissionReq);

    /**
     * 查询前端按钮
     * @return
     */
    List<GetMenuResponse> buttons();

    /**
     * 查询列表
     * @param request
     * @return
     */
    List<MenuVoResponse> getList(OperationMenuRequest request);
}
