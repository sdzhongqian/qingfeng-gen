package com.wdata.system.controller;

import com.wdata.base.controller.BaseController;
import com.wdata.base.util.*;
import com.wdata.system.service.MenuService;
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
import java.util.List;

/**  
 * @Title: UserController
 * @ProjectName wdata
 * @Description: 用户基础信息
 * @author 青锋
 * @date 2018-8-24 11:51
 */
@Controller
@RequestMapping(value = "/system/menu")
public class MenuController extends BaseController {

    @Autowired
    private MenuService menuService;


    /** 
     * @Description: index 
     * @Param: [page, map, request, response] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2018-8-27 20:55 
     */ 
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(ModelMap map,HttpServletRequest request, HttpServletResponse response) throws IOException {
        PageData pd = new PageData(request);
        map.put("pd",pd);
        return "web/system/menu/menu_list";
    }

    /** 
     * @Description: findByPage 
     * @Param: [request, response] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-8-24 11:51 
     */ 
    @RequestMapping(value = "/findListPage", method = RequestMethod.GET)
    public void findListPage(Page page, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        PageData pd = new PageData(request);
        //处理数据权限
        page = dealDataAuth(page,pd,session);
        //处理分页
        if(Verify.verifyIsNotNull(pd.get("page"))){
            page.setIndex(Integer.parseInt(pd.get("page").toString()));
        }else{
            page.setIndex(1);
        }
        if(Verify.verifyIsNotNull(pd.get("limit"))){
            page.setShowCount(Integer.parseInt(pd.get("limit").toString()));
        }else{
            page.setShowCount(10);
        }
        page.setPd(pd);
        List<PageData> list = menuService.findListPage(page);
        int num = menuService.findListSize(page);
        Json json = new Json();
        json.setMsg("获取数据成功。");
        json.setCode(0);
        json.setCount(num);
        json.setData(list);
        json.setSuccess(true);
        this.writeJson(response,json);
    }

    /** 
     * @Description: findList 
     * @Param: [map] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2018-8-24 11:52
     */ 
    @RequestMapping(value = "/findList", method = RequestMethod.GET)
    public void findList(HttpServletRequest request,HttpServletResponse response) throws IOException  {
        PageData pd = new PageData(request);

        List<PageData> list = menuService.findList(pd);
        Json json = new Json();
        json.setMsg("获取数据成功。");
        json.setData(list);
        json.setSuccess(true);
        this.writeJson(response,json);
    }

    /** 
     * @Description: findInfo 
     * @Param: [map] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2018-8-24 11:53 
     */ 
    @RequestMapping(value = "/findInfo", method = RequestMethod.GET)
    public String findInfo(ModelMap map,HttpServletRequest request)  {
        PageData pd = new PageData(request);
        PageData p = menuService.findInfo(pd);
        //查询菜单下的功能菜单
        pd.put("parent_id",pd.get("id"));
        pd.put("type","button");
        List<PageData> list = menuService.findList(pd);
        if(list.size()>0){
            pd.put("open_button","Y");
        }else{
            pd.put("open_button","N");
        }
        map.put("list",list);
        map.put("pd",pd);
        map.addAttribute("p",p);
        return "web/system/menu/menu_info";
    }


    /** 
     * @Description: toAdd
     * @Param: [map, request] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2018-8-24 12:58 
     */ 
    @RequestMapping(value = "/toAdd", method = RequestMethod.GET)
    public String toAdd(ModelMap map,HttpServletRequest request)  {
        PageData pd = new PageData(request);
        map.put("pd",pd);
        return "web/system/menu/menu_add";
    }

    /** 
     * @Description: toAddMore 
     * @Param: [map, request] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2018-8-27 20:56 
     */ 
    @RequestMapping(value = "/toAddMore", method = RequestMethod.GET)
    public String toAddMore(ModelMap map,HttpServletRequest request)  {
        PageData pd = new PageData(request);
        map.put("pd",pd);
        String return_url = "web/system/menu/menu_addMore";
        return return_url;
    }


    /** 
     * @Description: save type=0 菜单；type=1 按钮
     * @Param: [request, response] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-8-24 13:02 
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public void save(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException  {
        PageData pd = new PageData(request);
        String time = DateTimeUtil.getDateTimeStr();
        pd.put("create_time", time);
        pd.put("update_time", time);
        PageData user = (PageData) session.getAttribute("loginUser");
        pd.put("create_user",user.get("id"));
        pd.put("create_organize",user.get("organize_id"));
        pd.put("create_org_cascade",user.get("org_cascade"));

        int level = Integer.parseInt(pd.get("level").toString());
        pd.put("level", level+1);
        int num = menuService.save(pd);
        if(num==1){
            pd.put("menu_cascade", pd.get("parent_menu_cascade").toString()+pd.get("id").toString()+"_");
            menuService.update(pd);
            //添加功能菜单
            if(Verify.verifyIsNotNull(pd.get("open_button"))){
                if(pd.get("open_button").equals("on")){
                    String[] button_name = request.getParameterValues("button_name");
                    String[] button_code = request.getParameterValues("button_code");
                    String[] button_order_by = request.getParameterValues("button_order_by");
                    int lv = Integer.parseInt(pd.get("level").toString());
                    for (int i = 0; i < button_name.length; i++) {
                        PageData p = new PageData();
                        p.put("menu_cascade",pd.get("parent_menu_cascade").toString()+pd.get("id").toString()+"_"+GuidUtil.getGuid());
                        p.put("name",button_name[i]);
                        p.put("code",button_code[i]);
                        p.put("parent_id",pd.get("id"));
                        p.put("type","button");
                        p.put("level", lv+1);
                        p.put("classify",pd.get("classify"));
                        p.put("order_by",button_order_by[i]);
                        p.put("create_time", time);
                        p.put("update_time", time);
                        p.put("create_user",user.get("id"));
                        menuService.save(p);
                    }
                }
            }
        }
        pd.put("num",num);
        Json json = new Json();
        json.setSuccess(true);
        json.setData(pd);
        json.setMsg("操作成功。");
        this.writeJson(response,json);
    }


    /** 
     * @Description: saveMore
     * @Param: [request, response] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-8-27 20:58 
     */ 
    @RequestMapping(value = "/saveMore", method = RequestMethod.POST)
    public void saveMore(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException  {
        PageData pd = new PageData(request);
        int level = Integer.parseInt(pd.get("level").toString());
        String[] name = request.getParameterValues("name");
        String[] code = request.getParameterValues("code");
        String[] url = request.getParameterValues("url");
        String[] icon = request.getParameterValues("icon");
        String[] order_by = request.getParameterValues("order_by");
        String[] remark = request.getParameterValues("remark");

        //处理时间
        String time = DateTimeUtil.getDateTimeStr();
        pd.put("create_time", time);
        pd.put("update_time", time);
        //处理数据权限
        PageData user = (PageData) session.getAttribute("loginUser");
        pd.put("create_user",user.get("id"));
        pd.put("create_organize",user.get("organize_id"));
        pd.put("create_org_cascade",user.get("org_cascade"));

        for (int i = 0; i < name.length; i++) {
            pd.put("name",name[i]);
            pd.put("code",code[i]);
            pd.put("url",url[i]);
            pd.put("icon",icon[i]);
            pd.put("order_by",order_by[i]);
            pd.put("remark",remark[i]);

            pd.put("level", level+1);
            int num = menuService.save(pd);
            if(num==1){
                pd.put("menu_cascade", pd.get("parent_menu_cascade").toString()+pd.get("id").toString()+"_");
                menuService.update(pd);
            }
        }
        Json json = new Json();
        json.setSuccess(true);
        json.setData(pd);
        json.setMsg("操作成功。");
        this.writeJson(response,json);
    }


    /** 
     * @Description: toUpdate
     * @Param: [map, request] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2018-8-24 13:02 
     */ 
    @RequestMapping(value = "/toUpdate", method = RequestMethod.GET)
    public String toUpdate(ModelMap map,HttpServletRequest request)  {
        PageData pd = new PageData(request);
        PageData p = menuService.findInfo(pd);
        //查询菜单下的功能菜单
        pd.put("parent_id",pd.get("id"));
        pd.put("type","button");
        List<PageData> list = menuService.findList(pd);
        if(list.size()>0){
            pd.put("open_button","Y");
        }else{
            pd.put("open_button","N");
        }

        map.put("list",list);
        map.put("pd",pd);
        map.put("p",p);
        return "web/system/menu/menu_update";
    }

    /** 
     * @Description: update 
     * @Param: [request, response] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-8-24 13:03 
     */ 
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void update(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException  {
        PageData pd = new PageData(request);
        PageData user = (PageData) session.getAttribute("loginUser");

        int lv = Integer.parseInt(pd.get("level").toString());
        String time = DateTimeUtil.getDateTimeStr();
        pd.put("create_time", time);
        pd.put("update_time", time);
        int num = menuService.update(pd);
        if(num==1){
            //先删除菜单
            pd.put("type","button");
            pd.put("parent_id",pd.get("id"));
            menuService.delForParam(pd);
            //添加功能菜单
            if(Verify.verifyIsNotNull(pd.get("open_button"))){
                if(pd.get("open_button").equals("on")) {
                    String[] button_name = request.getParameterValues("button_name");
                    String[] button_code = request.getParameterValues("button_code");
                    String[] button_order_by = request.getParameterValues("button_order_by");
                    for (int i = 0; i < button_name.length; i++) {
                        PageData p = new PageData();
                        p.put("menu_cascade", pd.get("menu_cascade").toString()+ "_"+GuidUtil.getGuid());
                        p.put("name", button_name[i]);
                        p.put("code", button_code[i]);
                        p.put("parent_id", pd.get("id"));
                        p.put("type", "button");
                        p.put("level", lv + 1);
                        p.put("classify",pd.get("classify"));
                        p.put("order_by", button_order_by[i]);
                        p.put("create_time", time);
                        p.put("update_time", time);
                        p.put("create_user", user.get("id"));
                        menuService.save(p);
                    }
                }
            }
        }

        Json json = new Json();
        json.setSuccess(true);
        json.setData(pd);
        json.setMsg("操作成功。");
        this.writeJson(response,json);
    }


    /** 
     * @Description: del
     * @Param: [request, response] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-8-27 21:00 
     */ 
    @RequestMapping(value = "/del", method = RequestMethod.GET)
    public void del(HttpServletRequest request,HttpServletResponse response) throws IOException  {
        PageData pd = new PageData(request);
        String[] ids = pd.get("ids").toString().split(",");
        for (String id:ids) {
            menuService.delOne(id);
            //1、角色菜单信息
            menuService.delRoleMenu(id);
        }
        Json json = new Json();
        json.setSuccess(true);
        json.setData(pd);
        json.setMsg("操作成功。");
        this.writeJson(response,json);
    }



    /** 
     * @Description: findMenuList 展示菜单
     * @Param: [request, response] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-9-1 23:01 
     */ 
    @RequestMapping(value = "/findMenuList", method = RequestMethod.GET)
    public void findMenuList(HttpServletRequest request,HttpServletResponse response) throws IOException  {
        PageData pd = new PageData(request);

        List<PageData> list = menuService.findMenuList(pd);
        Json json = new Json();
        json.setMsg("获取数据成功。");
        json.setData(JsonToMap.list2json(list));
        json.setSuccess(true);
        this.writeJson(response,json);
    }



}
