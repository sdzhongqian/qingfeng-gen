package com.wdata.gen.controller;

import com.wdata.base.controller.BaseController;
import com.wdata.base.util.*;
import com.wdata.gen.service.GMessageService;
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
 * @Title: GMessageController
 * @ProjectName wdata
 * @Description: TODO
 * @author 青锋
 * @date 2019-1-13 11:03
 */
@Controller
@RequestMapping(value = "/gen/message")
public class GMessageController extends BaseController {

    @Autowired
    private GMessageService messageService;

    /**
     * @Description: index 
     * @Param: [map, request, response] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2018-9-3 15:00 
     */ 
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(ModelMap map, HttpServletRequest request, HttpServletResponse response) throws IOException {
        PageData pd = new PageData(request);
        map.put("pd",pd);
        return "web/gen/message/message_list";
    }

    /** 
     * @Description: findListPage 
     * @Param: [page, request, response, session] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-9-3 15:00 
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
        List<PageData> list = messageService.findListPage(page);
        int num = messageService.findListSize(page);
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
     * @Date: 2018-9-3 15:01 
     */ 
    @RequestMapping(value = "/findList", method = RequestMethod.GET)
    public void findList(HttpServletRequest request,HttpServletResponse response) throws IOException  {
        PageData pd = new PageData(request);

        List<PageData> list = messageService.findList(pd);
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
     * @Date: 2018-9-3 15:01 
     */ 
    @RequestMapping(value = "/findInfo", method = RequestMethod.GET)
    public String findInfo(ModelMap map,HttpServletRequest request)  {
        PageData pd = new PageData(request);
        PageData p = messageService.findInfo(pd);
        map.addAttribute("p",p);
        return "web/gen/message/message_info";
    }


    /** 
     * @Description: toAdd 
     * @Param: [map, request] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2018-9-3 15:01 
     */ 
    @RequestMapping(value = "/toAdd", method = RequestMethod.GET)
    public String toAdd(ModelMap map,HttpServletRequest request)  {
        PageData pd = new PageData(request);
        map.put("pd",pd);
        return "web/gen/message/message_add";
    }

    /** 
     * @Description: save
     * @Param: [request, response, session] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-9-3 15:01 
     */ 
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public void save(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException  {
        PageData pd = new PageData(request);

        String time = DateTimeUtil.getDateTimeStr();
        pd.put("create_time", time);
        pd.put("update_time", time);
        pd.put("status","N");
        //处理数据权限
        PageData user = (PageData) session.getAttribute("loginUser");
        pd.put("create_user",user.get("id"));
        pd.put("create_organize",user.get("organize_id"));
        pd.put("create_org_cascade",user.get("org_cascade"));
        int num = messageService.save(pd);
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
     * @Date: 2018-9-3 15:02 
     */ 
    @RequestMapping(value = "/toUpdate", method = RequestMethod.GET)
    public String toUpdate(ModelMap map,HttpServletRequest request)  {
        PageData pd = new PageData(request);
        PageData p = messageService.findInfo(pd);
        map.put("p",p);
        return "web/gen/message/message_update";
    }

    /** 
     * @Description: update
     * @Param: [request, response] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-9-3 15:03 
     */ 
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void update(HttpServletRequest request,HttpServletResponse response) throws IOException  {
        PageData pd = new PageData(request);

        String time = DateTimeUtil.getDateTimeStr();
        pd.put("create_time", time);
        pd.put("update_time", time);
        int num = messageService.update(pd);
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
     * @Date: 2018-9-3 15:03 
     */
    @RequestMapping(value = "/del", method = RequestMethod.GET)
    public void del(HttpServletRequest request,HttpServletResponse response) throws IOException  {
        PageData pd = new PageData(request);
        String[] ids = pd.get("ids").toString().split(",");
        messageService.del(ids);
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
     * @Date: 2018-9-3 15:04 
     */ 
    @RequestMapping(value = "/updateStatus", method = RequestMethod.GET)
    public void updateStatus(HttpServletRequest request,HttpServletResponse response) throws IOException  {
        PageData pd = new PageData(request);
        String time = DateTimeUtil.getDateTimeStr();

        PageData p = new PageData();
        p.put("status","N");
        p.put("update_time",time);
        messageService.updateStatus(p);
        p.put("id",pd.get("id"));
        p.put("status","Y");
        messageService.updateStatus(p);

        Json json = new Json();
        json.setSuccess(true);
        json.setFlag("操作成功。");
        this.writeJson(response,json);
    }



}
