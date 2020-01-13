package com.bamboo.web.menu;


import com.bamboo.base.BaseResponse;
import com.bamboo.common.constant.CodeAndMsgEnum;
import com.bamboo.common.menu.entity.Menu;
import com.bamboo.common.menu.service.IMenuService;
import com.bamboo.common.menu.vo.request.OperationMenuRequest;
import com.bamboo.common.menu.vo.response.GetMenuResponse;
import com.bamboo.common.menu.vo.response.MenuVoResponse;
import com.bamboo.exception.ServiceException;
import com.bamboo.utils.CommonUtil;
import com.bamboo.utils.list.ForestNodeMerger;
import com.baomidou.mybatisplus.extension.api.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiOperationSupport;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.concurrent.locks.Condition;
import java.util.stream.Collectors;

/**
 * <p>
 * 菜单表 前端控制器
 * </p>
 *
 * @author acumes
 * @since 2019-11-06
 */
@RestController
@RequestMapping("/menu")
@Api(tags = "菜单接口")
public class MenuController {

    @Autowired
    private IMenuService menuService;


    @ApiOperation(value = "添加菜单")
    @PostMapping(value = "add")
    @ApiOperationSupport(order = 1)
    public BaseResponse<String> addMenu(@RequestBody OperationMenuRequest request){
        return menuService.addMenu(request);
    }
    @ApiOperation(value = "修改菜单")
    @PostMapping(value = "update")
    @ApiOperationSupport(order = 2)
    public BaseResponse<String> updateMenu(@RequestBody OperationMenuRequest request){
        return menuService.updateMenu(request);
    }
    @ApiOperation(value = "删除菜单")
    @PostMapping(value = "del/{id}")
    @ApiOperationSupport(order = 3)
    public BaseResponse delMenu(@PathVariable String id){
        boolean b = menuService.removeById(id);
        return new BaseResponse("删除成功");
    }
    @ApiOperation(value = "菜单列表")
    @PostMapping(value = "list")
    @ApiOperationSupport(order = 3)
    public BaseResponse<List<MenuVoResponse>> list(@RequestBody OperationMenuRequest request){
        List<MenuVoResponse> list = menuService.getList(request);
        return new BaseResponse(ForestNodeMerger.merge(list));
    }
    @ApiOperation(value = "查看菜单")
    @GetMapping(value = "detail/{id}")
    @ApiOperationSupport(order = 4)
    public BaseResponse<GetMenuResponse> menuDetail(@PathVariable String id){
        Menu menu = (Menu) menuService.getById(id);
        if(CommonUtil.isEmpty(menu)){
            throw new ServiceException(CodeAndMsgEnum.MENU_NOT_EXIST_ERROR.getCode(),CodeAndMsgEnum.MENU_NOT_EXIST_ERROR.getMsg());
        }
        GetMenuResponse response = new GetMenuResponse();
        BeanUtils.copyProperties(menu,response);
        return new BaseResponse<>(response);
    }

    @ApiOperation(value = "获取菜单树")
    @GetMapping(value = "tree")
    @ApiOperationSupport(order = 5)
    public BaseResponse<List<GetMenuResponse>> tree(){
        return menuService.tree();
    }

    /**
     * 前端菜单数据
     */
    @GetMapping("/routes")
    @ApiOperationSupport(order = 6)
    @ApiOperation(value = "前端菜单数据", notes = "前端菜单数据")
    public BaseResponse<List<GetMenuResponse>> routes() {
        List<GetMenuResponse> list = menuService.routes();
        return new BaseResponse(list);
    }

    /**
     * 前端按钮数据
     */
    @GetMapping("/buttons")
    @ApiOperationSupport(order = 7)
    @ApiOperation(value = "前端按钮数据", notes = "前端按钮数据")
    public BaseResponse<List<GetMenuResponse>> buttons() {
        List<GetMenuResponse> list = menuService.buttons();
        return new BaseResponse(list);
    }



}

