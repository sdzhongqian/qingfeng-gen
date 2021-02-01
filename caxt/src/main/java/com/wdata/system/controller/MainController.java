package com.wdata.system.controller;

/**
 * Created by 青锋 on 2018/2/7.
 */

import com.wdata.base.controller.BaseController;
import com.wdata.base.util.*;
import com.wdata.system.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * DemoController
 *
 */
@Controller
@RequestMapping(value = "/")
public class MainController extends BaseController {

    @Autowired
    private MenuService menuService;

    @RequestMapping("/")
    public ModelAndView index(HttpServletRequest request, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        PageData pd = new PageData(request);
        mv.setViewName("redirect:/main.do ");
        return mv;
    }

    @RequestMapping("/main")
    public ModelAndView main(HttpServletRequest request, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        PageData pd = new PageData(request);
        String parent_id = "";
        if(Verify.verifyIsNotNull(pd.get("parent_id"))){
            parent_id=pd.get("parent_id").toString();
        }

        PageData user = (PageData) session.getAttribute("loginUser");
        pd.put("user_id",user.get("id"));
        pd.put("organize_id",user.get("organize_id"));
        //处理路径
        String contextPath = request.getContextPath();
        pd.put("contextPath",contextPath);
//        pd.put("contextPath","");

        //查询头部菜单
        pd.put("type","menu");
        pd.put("level","0");
        pd.put("parent_id","0");
        List<PageData> ls = menuService.findMList(pd);//查找一级菜单

        List<PageData> list = new ArrayList<PageData>();
        if(ls.size()>0){
            if(!Verify.verifyIsNotNull(parent_id)){
                pd.put("parent_id",ls.get(0).get("id"));
                parent_id = ls.get(0).get("id").toString();
            }else{
                pd.put("parent_id",parent_id);
            }

            pd.put("type","menu");
            pd.put("level","1");
            System.out.println(pd);
            list = menuService.findMenuList(pd);
            System.out.println(list);
        }

        //查询待办数量
        Page page = new Page();
        pd.clear();
        pd.put("status","1");
        pd.put("curr_user",user.get("id")+"#"+user.get("nickname"));
        page.setPd(pd);
        mv.addObject("menu_data",JsonToMap.list2json(list));
        mv.addObject("list",list);
        mv.addObject("ls",ls);
        pd.put("parent_id",parent_id);
        mv.addObject("pd",pd);

        mv.setViewName("web/system/admin/main");
        return mv;
    }



    /**
     * @Description: 查询菜单
     * @Param: [request, session]
     * @return: org.springframework.web.servlet.ModelAndView
     * @Author: 青锋
     * @Date: 2018-11-1 0:28
     */
    @RequestMapping("/findMenu")
    public void findMenu(HttpServletRequest request, HttpSession session,HttpServletResponse response) throws Exception {
        PageData pd = new PageData(request);

        PageData user = (PageData) session.getAttribute("loginUser");
        pd.put("user_id",user.get("id"));
        pd.put("organize_id",user.get("organize_id"));
        //处理路径
        String contextPath = request.getContextPath();
        pd.put("contextPath",contextPath);
//        pd.put("contextPath","");
        pd.put("type","menu");
        pd.put("level","1");
        List<PageData> list = menuService.findMenuList(pd);
        System.out.println(list);
        //查询待办数量
        Page page = new Page();
        pd.clear();
        pd.put("status","1");
        pd.put("curr_user",user.get("id")+"#"+user.get("nickname"));
        page.setPd(pd);
        Json json = new Json();
        json.setData(list);
        json.setSuccess(true);
        json.setMsg("查询成功。");
        this.writeJson(response,json);
    }



    public static void main(String[] args) {
        String str = "/customize/ttask/index.do?menu_id=13";
        String menu_id = str.substring(str.indexOf("menu_id")+8);
        System.out.println(menu_id);
    }


}