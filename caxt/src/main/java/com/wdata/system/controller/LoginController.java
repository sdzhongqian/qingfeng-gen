package com.wdata.system.controller;

import com.wdata.base.controller.BaseController;
import com.wdata.base.util.*;
import com.wdata.system.service.LoginService;
import com.wdata.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

/**  
 * @Title: UserController
 * @ProjectName wdata
 * @Description: 用户基础信息
 * @author 青锋
 * @date 2018-8-24 11:51
 */
@Controller
@RequestMapping(value = "/system/login")
public class LoginController extends BaseController {

    @Autowired
    private LoginService loginService;


    /** 
     * @Description: index
     * @Param: [page, map, request, response] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2018-9-1 7:43 
     */ 
    @RequestMapping(value = "/toLogin", method = RequestMethod.GET)
    public String toLogin(ModelMap map,HttpServletRequest request, HttpServletResponse response) throws IOException {
        PageData pd = new PageData(request);
        map.put("pd",pd);
        return "web/system/login/login";
    }


    /** 
     * @Description: login
     * @Param: [page, map, request, response] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2018-9-1 7:44 
     */ 
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(ModelMap map,HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException {
        PageData pd = new PageData(request);
        String errMsg = "";
        boolean errBol = false;
        String ym = "web/system/login/login";
        if(!Verify.verifyIsNotNull(pd.getString("login_name"))){
            errMsg="登录名称不可为空。";
        }else if(!Verify.verifyIsNotNull(pd.getString("login_password"))){
            errMsg="登录密码不可为空。";
        }else{
            PageData uPd = loginService.findUserInfo(pd);
            if(Verify.verifyIsNotNull(uPd)){
                if(uPd.getString("login_password").equals(MD5.md5(pd.getString("login_password")))){
                    if(uPd.getString("status").equals("Y")){
                        //登录成功
                        errBol=true;
                        session.setAttribute("loginUser", uPd);
                        ym = "redirect:/main.do";
                    }else{
                        errMsg="账号已被冻结，请联系管理员";
                    }
                }else{
                    errMsg="登录密码不正确。";
                }
            }else{
                errMsg="登录名称不存在。";
            }
        }
        map.put("errMsg", errMsg);
        map.put("errBol", errBol);
        map.put("pd",pd);
        return ym;
    }


    /** 
     * @Description: outLogin
     * @Param: [page, map, request, response] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2018-9-1 7:45 
     */ 
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String outLogin(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        PageData pd = new PageData(request);
        session.removeAttribute("loginUser");//清除用户
        Enumeration em = request.getSession().getAttributeNames();
        while(em.hasMoreElements()){
            request.getSession().removeAttribute(em.nextElement().toString());
        }
        return "web/system/login/login";
    }


}
