package com.wdata.system.controller;

import com.wdata.base.controller.BaseController;
import com.wdata.base.util.*;
import com.wdata.system.model.Menu;
import com.wdata.system.service.RoleService;
import com.wdata.system.service.UserService;
import net.sf.json.JSONArray;
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
 * @Title: RoleController
 * @ProjectName wdata
 * @Description: 角色管理
 * @author 青锋
 * @date 2018-8-24 13:40
 */
@Controller
@RequestMapping(value = "/system/role")
public class RoleController extends BaseController {

    @Autowired
    private RoleService roleService;


    /** 
     * @Description: index 
     * @Param: [page, map, request, response] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2018-8-27 15:09
     */ 
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(ModelMap map,HttpServletRequest request, HttpServletResponse response) throws IOException {
        PageData pd = new PageData(request);
        map.put("pd",pd);
        return "web/system/role/role_list";
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
        List<PageData> list = roleService.findListPage(page);
        int num = roleService.findListSize(page);
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

        List<PageData> list = roleService.findList(pd);
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
        PageData p = roleService.findInfo(pd);
        map.addAttribute("p",p);
        return "web/system/role/role_info";
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
        return "web/system/role/role_add";
    }

    /** 
     * @Description: save 
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
        //处理数据权限
        PageData user = (PageData) session.getAttribute("loginUser");
        pd.put("create_user",user.get("id"));
        pd.put("create_organize",user.get("organize_id"));
        pd.put("create_org_cascade",user.get("org_cascade"));
        int num = roleService.save(pd);
        if(num==1){//处理角色用户组织信息
            pd.put("role_id",pd.get("id"));
            pd.put("role_auth","0");
            roleService.saveRoleUserOrg(pd);
        }
        Json json = new Json();
        json.setSuccess(true);
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
        PageData p = roleService.findInfo(pd);
        map.put("p",p);
        return "web/system/role/role_update";
    }

    /** 
     * @Description: update 
     * @Param: [request, response] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-8-24 13:03 
     */ 
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void update(HttpServletRequest request,HttpServletResponse response) throws IOException  {
        PageData pd = new PageData(request);

        String time = DateTimeUtil.getDateTimeStr();
        pd.put("create_time", time);
        pd.put("update_time", time);
        int num = roleService.update(pd);
        if(num==1){//处理角色用户组织信息
            pd.put("role_id",pd.get("id"));
            roleService.updateRoleUserOrg(pd);
        }
        Json json = new Json();
        json.setSuccess(true);
        json.setMsg("操作成功。");
        this.writeJson(response,json);
    }


    /** 
     * @Description: del 
     * @Param: [request, response] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-8-27 14:46
     */ 
    @RequestMapping(value = "/del", method = RequestMethod.GET)
    public void del(HttpServletRequest request,HttpServletResponse response) throws IOException  {
        PageData pd = new PageData(request);
        String[] ids = pd.get("ids").toString().split(",");
        roleService.del(ids);
        //删除角色用户组织信息
        roleService.delRoleUserOrg(ids);
        //2、角色菜单信息
        for (int i = 0; i < ids.length; i++) {
            roleService.delRoleMenu(ids[i]);
        }

        Json json = new Json();
        json.setSuccess(true);
        json.setMsg("操作成功。");
        this.writeJson(response,json);
    }


    /** 
     * @Description: toAuth
     * @Param: [map, request] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2018-8-27 21:42 
     */ 
    @RequestMapping(value = "/toAuth", method = RequestMethod.GET)
    public String toAuth(ModelMap map,HttpServletRequest request)  {
        PageData pd = new PageData(request);
        map.put("pd",pd);
        return "web/system/role/role_auth";
    }


    /** 
     * @Description: findRoleMenuList
     * @Param: [request, response] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-8-28 22:59 
     */ 
    @RequestMapping(value = "/findRoleMenuList", method = RequestMethod.GET)
    public void findRoleMenuList(HttpServletRequest request,HttpServletResponse response) throws IOException  {
        PageData pd = new PageData(request);

        List<PageData> list = roleService.findRoleMenuList(pd);

        Json json = new Json();
        json.setMsg("获取数据成功。");
        json.setData(list);
        json.setSuccess(true);
        this.writeJson(response,json);
    }


    @RequestMapping(value = "/saveRoleMenu", method = RequestMethod.POST)
    public void saveRoleMenu(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException  {
        PageData pd = new PageData(request);
        String time = DateTimeUtil.getDateTimeStr();
        pd.put("create_time", time);
        pd.put("update_time", time);
        PageData user = (PageData) session.getAttribute("loginUser");
        pd.put("create_user",user.get("id"));

        String[] ids = pd.get("ids").toString().split(",");

        roleService.delRoleMenu(pd.get("role_id").toString());
        for (int i = 0; i < ids.length; i++) {
            pd.put("menu_id",ids[i]);
            roleService.saveRoleMenu(pd);
        }
        Json json = new Json();
        json.setSuccess(true);
        json.setMsg("操作成功。");
        this.writeJson(response,json);
    }



}
