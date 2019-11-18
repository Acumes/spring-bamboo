package com.bamboo.utils;

import com.bamboo.base.BasePageResponse;
import com.bamboo.base.BaseResponse;
import com.bamboo.common.constant.CommonConstant;
import com.bamboo.common.role.vo.response.GetRoleResponse;
import com.github.pagehelper.Page;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;

import javax.script.*;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Field;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author: acumes
 * @create: 2019-11-03 20:08:20
 * @description: 公共工具类
 */
@Slf4j
public class CommonUtil {


    /**
     * 创建指定数量的随机字符串
     *
     * @param numberFlag
     *            是否是数字
     * @param length
     * @return
     */
    public static String createRandom(boolean numberFlag, int length) {
        String retStr = "";
        String strTable = numberFlag ? "1234567890" : "1234567890abcdefghijkmnpqrstuvwxyz";
        int len = strTable.length();
        boolean bDone = true;
        do {
            retStr = "";
            int count = 0;
            for (int i = 0; i < length; i++) {
                double dblR = Math.random() * len;
                int intR = (int) Math.floor(dblR);
                char c = strTable.charAt(intR);
                if (('0' <= c) && (c <= '9')) {
                    count++;
                }
                retStr += strTable.charAt(intR);
            }
            if (count >= 2) {
                bDone = false;
            }
        } while (bDone);
        return retStr;
    }

    /**
     * 获取运算符
     * @return
     */
    public static String getOperator(String operator) {
        String retStr = "";
        if(CommonUtil.isEmpty(operator)){
            operator = CommonConstant.OPERATOR_A_S;
        }
        int len = operator.length();
        double dblR = Math.random() * len;
        int intR = (int) Math.floor(dblR);
        retStr += operator.charAt(intR);
        return retStr;
    }

    /**
     * 获取简单运算公示
     * @return
     */
    public static String getPublicity(String operator){
        int a = (int) (Math.random() * 100);
        int b = (int) (Math.random() * 100);
        return a + getOperator(operator) + b;
    }

    /**
     * 判断空
     *
     * @params
     * @createDate 下午2:07:04
     */
    public static boolean isEmpty(Object obj) {
        if (null == obj) {
            return true;
        } else {
            if (obj instanceof String) {
                return "".equals(null2String(obj))
                        || "null".equals(null2String(obj));
            } else if (obj instanceof Collection) {
                return ((Collection) obj).isEmpty();
            } else if (obj instanceof Map) {
                return ((Map) obj).isEmpty();
            } else if (obj instanceof Object[]) {
                return ((Object[]) obj).length == 0;
            } else {
                return false;
            }
        }
    }

    /**
     * 对象转换成字符串
     *
     * @params
     * @createDate 下午2:06:47
     */
    public static String null2String(Object obj) {
        if (null == obj || "".equals(((String) obj).trim()) || "null".equals(((String) obj).trim())) {
            return "";
        }
        return obj.toString().trim();
    }

    public static Boolean getIncludeStr(String str, List<String> list){
        Boolean isInclude = false;
        for(String s : list){
            if(str.startsWith(s)){
                isInclude = true;
                break;
            }
        }
        return isInclude;
    }

    /**
     * 查看请求的ip地址
     * @author zealweiyu
     * 2018年12月11日
     * @param request
     * @return
     */
    public static String getIpAddress(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        // 如果是多级代理，那么取第一个ip为客户端ip
        if (ip != null && ip.indexOf(",") != -1) {
            ip = ip.substring(0, ip.indexOf(",")).trim();
        }
        return ip;
    }

    public static BaseResponse commonResponse(Integer code, String msg){
        return new BaseResponse(code,msg);
    }

    /**
     * 获取公式结果
     * @param str
     * @return
     */
    public static String getResult(String str,Bindings bindings){
        ScriptEngine engine = new ScriptEngineManager().getEngineByName("javascript");
        Compilable compilable = (Compilable) engine;
//        String script = "(1+0.1 * (F/100) * T)*P0"; //定义函数并调用
        CompiledScript JSFunction = null; //解析编译脚本函数
        String result = "";
        try {
            JSFunction = compilable.compile(str);
//            bindings.put("F", 2.5);
//            bindings.put("T", 30);
////            bindings.put("A", 100);
//            bindings.put("P0", 100);
            result = String.valueOf(JSFunction.eval(bindings));
            System.out.println(result); //调用缓存着的脚本函数对象，Bindings作为参数容器传入
        } catch (ScriptException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static void main(String[] args) {
        String publicity = getPublicity(null);
        System.out.println(publicity);
        String result = getResult(publicity, null);
    }

    /**
     * 设置对象的创建者，创建时间
     * @param o
     */
    public static void setCreate(Object o){
        // 获取obj类的字节文件对象
        try {
            setField(o,"createUser", SecureUtil.getUser().getId());
            setField(o,"createTime", new Date());
        }catch (Exception e){
            log.error("设置创建用户信息失败");
            log.error("====================================================");
            log.error(e.getMessage());
        }
    }

    /**
     * 设置对象的修改者，修改时间
     * @param o
     */
    public static void setUpdate(Object o){
        // 获取obj类的字节文件对象
        try {
            setField(o,"updateTime", new Date());
            setField(o,"updateUser", SecureUtil.getUser().getId());
        }catch (Exception e){
            log.error("设置修改用户信息失败");
            log.error("====================================================");
            log.error(e.getMessage());
        }
    }

    public static void setField(Object o, String fieldName, Object value) throws Exception {
        Class c = o.getClass();
        Field f = c.getDeclaredField(fieldName);
        f.setAccessible(true);
        Object obj = o.getClass().newInstance();
        f.set(o,value);
        System.out.println(f.get(obj));
    }

    public static void setPage(Object o, Page<GetRoleResponse> page) {
            // 获取obj类的字节文件对象
        try {
            BasePageResponse response = new BasePageResponse();
            response.setPageNo(page.getPageNum());
            response.setPageSize(page.getPageSize());
            response.setTotal(page.getTotal());
            BeanUtils.copyProperties(response,o);
        }catch (Exception e){
            log.error("设置分页数据失败");
            log.error("====================================================");
            log.error(e.getMessage());
        }
    }
}
