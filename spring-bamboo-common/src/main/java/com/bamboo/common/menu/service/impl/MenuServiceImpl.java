package com.bamboo.common.menu.service.impl;

import com.bamboo.base.BaseResponse;
import com.bamboo.base.BaseService;
import com.bamboo.common.constant.CodeAndMsgEnum;
import com.bamboo.common.menu.dao.MenuDao;
import com.bamboo.common.menu.entity.Menu;
import com.bamboo.common.menu.service.IMenuService;
import com.bamboo.common.menu.vo.request.GetMenuRequest;
import com.bamboo.common.menu.vo.request.OperationMenuRequest;
import com.bamboo.common.menu.vo.response.GetMenuResponse;
import com.bamboo.common.role.vo.response.PermissionResponse;
import com.bamboo.common.user.entity.User;
import com.bamboo.exception.ServiceException;
import com.bamboo.utils.CommonUtil;
import com.bamboo.utils.SecureUtil;
import io.swagger.annotations.ApiModel;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 菜单表 服务实现类
 * </p>
 *
 * @author acumes
 * @since 2019-11-06
 */
@Service
public class MenuServiceImpl extends BaseService<MenuDao, Menu> implements IMenuService {

    @Autowired
    private MenuDao menuDao;

    @Override
    public BaseResponse<String> addMenu(OperationMenuRequest request) {
        isCheck(request);
        Menu menu = new Menu();
        BeanUtils.copyProperties(request,menu);
        this.save(menu);
        return new BaseResponse<>("成功");
    }

    @Override
    public BaseResponse<String> updateMenu(OperationMenuRequest request) {
        isCheck(request);
        Menu menu = (Menu) this.baseMapper.selectById(request.getId());
        if(CommonUtil.isEmpty(menu)){
            throw new ServiceException(CodeAndMsgEnum.MENU_NOT_EXIST_ERROR.getCode(),CodeAndMsgEnum.MENU_NOT_EXIST_ERROR.getMsg());
        }
        BeanUtils.copyProperties(request,menu);
        this.updateById(menu);
        return new BaseResponse<>("成功");
    }

    @Override
    public BaseResponse<List<GetMenuResponse>> tree() {
        GetMenuRequest permission = new GetMenuRequest();
        permission.setParentId(0);
        List<GetMenuResponse> permissionList = menuDao.getTree(permission);
        getChildrens(permissionList,true);
        return new BaseResponse<>(permissionList);
    }

    @Override
    public List<GetMenuResponse> routes() {
        User user = SecureUtil.getUser();
        GetMenuRequest permissionReq = new GetMenuRequest();
        permissionReq.setParentId(0);
        permissionReq.setRoleId(user.getRoleId());
        List<GetMenuResponse> parentIds = menuDao.selRolePermission(permissionReq);
        this.getChildrens(parentIds,true);
        return parentIds;
    }

    private void getChildrens(List<GetMenuResponse> list,Boolean isShowButton) {
        if(!CommonUtil.isEmpty(list)){
            for(GetMenuResponse permis : list){
                GetMenuRequest permissionReq = new GetMenuRequest();
                permissionReq.setParentId(permis.getParentId());
                List<GetMenuResponse> permissionList = menuDao.getTree(permissionReq);
                if(!CommonUtil.isEmpty(permissionList)) {
                    this.getChildrens(permissionList,isShowButton);
                    if(!isShowButton){
                        permis.setChildren(permissionList);
                    }else{
                        if(1 ==permissionList.get(0).getCategory()){
                            permis.setChildren(permissionList);
                        }else if(2 ==permissionList.get(0).getCategory()){
                            permis.setButtons(permissionList);
                        }
                    }
                }
            }
        }
    }

    private void isCheck(OperationMenuRequest request) {
    }
}
