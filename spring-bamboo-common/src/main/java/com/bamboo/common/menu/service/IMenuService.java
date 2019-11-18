package com.bamboo.common.menu.service;

import com.bamboo.base.BaseResponse;
import com.bamboo.base.Service;
import com.bamboo.common.menu.entity.Menu;
import com.bamboo.common.menu.vo.request.OperationMenuRequest;
import com.bamboo.common.menu.vo.response.GetMenuResponse;

import java.util.List;

/**
 * <p>
 * 菜单表 服务类
 * </p>
 *
 * @author acumes
 * @since 2019-11-06
 */
public interface IMenuService extends Service<Menu> {

    /**
     * 添加菜单
     * @param request
     * @return
     */
    BaseResponse<String> addMenu(OperationMenuRequest request);

    /**
     * 修改菜单
     * @param request
     * @return
     */
    BaseResponse<String> updateMenu(OperationMenuRequest request);

    /**
     * 获取菜单树
     * @return
     */
    BaseResponse<List<GetMenuResponse>> tree();

    /**
     * 获取前端菜单权限
     * @return
     */
    List<GetMenuResponse> routes();
}
