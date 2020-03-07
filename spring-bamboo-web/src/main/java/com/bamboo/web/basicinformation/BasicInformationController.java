package com.bamboo.web.basicinformation;


import com.bamboo.base.BaseResponse;
import com.bamboo.basicinformation.entity.BasicInformation;
import com.bamboo.basicinformation.service.IBasicInformationService;
import com.bamboo.basicinformation.vo.request.BasicInformationRequest;
import com.bamboo.common.menu.vo.response.GetMenuResponse;
import com.bamboo.utils.DateUtils;
import com.github.pagehelper.PageInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiOperationSupport;
import org.apache.poi.ss.usermodel.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@RequestMapping("/basic")
@Api(tags = "菜单服务接口")
public class BasicInformationController {

    @Autowired
    private IBasicInformationService basicInformationService;

    /**
     * 前端菜单数据
     */
    @PostMapping("/list")
    @ApiOperation(value = "前端菜单数据", notes = "前端菜单数据")
    public BaseResponse<PageInfo<BasicInformation>> getList(@RequestBody  BasicInformationRequest request) {
        PageInfo list = basicInformationService.getList(request);
        return new BaseResponse(list);
    }

    /**
     * 前端菜单数据
     */
    @PostMapping("/add")
    @ApiOperation(value = "前端菜单数据", notes = "前端菜单数据")
    public BaseResponse add(@RequestBody  BasicInformationRequest request) {
        basicInformationService.add(request);
        return new BaseResponse("成功");
    }

    public static void main(String[] args) {
        Long a = 123L;
        Long b = 1213L;
        System.out.println(a == b);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH");
        System.out.println(sdf.format(new Date()));
        Date now = new Date();
        List<String> time = new ArrayList<>();
        for(int i = 5 ; i > 0; i--){
            time.add(String.valueOf(i));
        }
        System.out.println(time);
    }
}
