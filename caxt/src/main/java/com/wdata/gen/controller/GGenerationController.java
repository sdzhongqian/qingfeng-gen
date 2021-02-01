package com.wdata.gen.controller;

import com.wdata.base.controller.BaseController;
import com.wdata.base.util.*;
import com.wdata.gen.service.GFamilyService;
import com.wdata.gen.service.GGenerationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**  
 * @Title: generationController
 * @ProjectName wdata
 * @Description: TODO
 * @author 青锋
 * @date 2018-12-30 20:40
 */
@Controller
@RequestMapping(value = "/gen/generation")
public class GGenerationController extends BaseController {

    @Autowired
    private GGenerationService generationService;
    @Autowired
    private GFamilyService familyService;

    /** 
     * @Description: index 
     * @Param: [map, request, response] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2018-12-30 20:41 
     */ 
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(ModelMap map, HttpServletRequest request, HttpServletResponse response) throws IOException {
        PageData pd = new PageData(request);

        pd.put("status","Y");
        List<PageData> list = familyService.findList(pd);
        map.put("list",list);

        map.put("pd",pd);
        return "web/gen/generation/generation_list";
    }

    /** 
     * @Description: findListPage 
     * @Param: [page, request, response, session] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-12-30 20:41 
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
        List<PageData> list = generationService.findListPage(page);
        int num = generationService.findListSize(page);
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
     * @Param: [request, response] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-12-30 20:41 
     */ 
    @RequestMapping(value = "/findList", method = RequestMethod.GET)
    public void findList(HttpServletRequest request,HttpServletResponse response) throws IOException  {
        PageData pd = new PageData(request);

        List<PageData> list = generationService.findList(pd);
        Json json = new Json();
        json.setMsg("获取数据成功。");
        json.setData(list);
        json.setSuccess(true);
        this.writeJson(response,json);
    }

    /** 
     * @Description: findInfo 
     * @Param: [map, request] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2018-12-30 20:41 
     */ 
    @RequestMapping(value = "/findInfo", method = RequestMethod.GET)
    public String findInfo(ModelMap map,HttpServletRequest request)  {
        PageData pd = new PageData(request);
        PageData p = generationService.findInfo(pd);

        pd.put("status","Y");
        List<PageData> list = familyService.findList(pd);
        map.put("list",list);

        map.addAttribute("p",p);
        return "web/gen/generation/generation_info";
    }


    /** 
     * @Description: toAdd 
     * @Param: [map, request] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2018-12-30 20:41 
     */ 
    @RequestMapping(value = "/toAdd", method = RequestMethod.GET)
    public String toAdd(ModelMap map,HttpServletRequest request)  {
        PageData pd = new PageData(request);

        pd.put("status","Y");
        List<PageData> list = familyService.findList(pd);
        map.put("list",list);

        map.put("pd",pd);
        return "web/gen/generation/generation_add";
    }

    /** 
     * @Description: save 
     * @Param: [request, response, session] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-12-30 20:42 
     */ 
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public void save(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException  {
        PageData pd = new PageData(request);

        String time = DateTimeUtil.getDateTimeStr();
        pd.put("create_time", time);
        pd.put("update_time", time);
        pd.put("status","Y");
        //处理数据权限
        PageData user = (PageData) session.getAttribute("loginUser");
        pd.put("create_user",user.get("id"));
        pd.put("create_organize",user.get("organize_id"));
        pd.put("create_org_cascade",user.get("org_cascade"));
        int num = generationService.save(pd);
        Json json = new Json();
        json.setCode(num);
        json.setSuccess(true);
        json.setMsg("操作成功。");
        this.writeJson(response,json);
    }

    /** 
     * @Description: toUpdate 
     * @Param: [map, request] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2018-12-30 20:42 
     */ 
    @RequestMapping(value = "/toUpdate", method = RequestMethod.GET)
    public String toUpdate(ModelMap map,HttpServletRequest request)  {
        PageData pd = new PageData(request);
        PageData p = generationService.findInfo(pd);

        pd.put("status","Y");
        List<PageData> list = familyService.findList(pd);
        map.put("list",list);

        map.put("p",p);
        return "web/gen/generation/generation_update";
    }

    /** 
     * @Description: update 
     * @Param: [request, response] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-12-30 20:42 
     */ 
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void update(HttpServletRequest request,HttpServletResponse response) throws IOException  {
        PageData pd = new PageData(request);

        String time = DateTimeUtil.getDateTimeStr();
        pd.put("create_time", time);
        pd.put("update_time", time);
        int num = generationService.update(pd);
        Json json = new Json();
        json.setCode(num);
        json.setSuccess(true);
        json.setMsg("操作成功。");
        this.writeJson(response,json);
    }


    /** 
     * @Description: del 
     * @Param: [request, response] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-12-30 20:42 
     */ 
    @RequestMapping(value = "/del", method = RequestMethod.GET)
    public void del(HttpServletRequest request,HttpServletResponse response) throws IOException  {
        PageData pd = new PageData(request);
        String[] ids = pd.get("ids").toString().split(",");
        generationService.del(ids);
        Json json = new Json();
        json.setSuccess(true);
        json.setMsg("操作成功。");
        this.writeJson(response,json);
    }


    /** 
     * @Description: updateStatus
     * @Param: [request, response] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-12-30 20:42 
     */ 
    @RequestMapping(value = "/updateStatus", method = RequestMethod.GET)
    public void updateStatus(HttpServletRequest request,HttpServletResponse response) throws IOException  {
        PageData pd = new PageData(request);
        String time = DateTimeUtil.getDateTimeStr();
        pd.put("update_time", time);
        generationService.update(pd);

        Json json = new Json();
        json.setSuccess(true);
        json.setFlag("操作成功。");
        this.writeJson(response,json);
    }

    


}
