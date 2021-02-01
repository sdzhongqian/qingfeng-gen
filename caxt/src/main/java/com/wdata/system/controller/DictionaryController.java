package com.wdata.system.controller;

import com.wdata.base.controller.BaseController;
import com.wdata.base.util.*;
import com.wdata.system.service.DictionaryService;
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
 * @Title: DictionaryController
 * @ProjectName wdata
 * @Description: TODO
 * @author anxingtao
 * @date 2018-8-31 17:54
 */
@Controller
@RequestMapping(value = "/system/dictionary")
public class DictionaryController extends BaseController {

    @Autowired
    private DictionaryService dictionaryService;


    /** 
     * @Description: index 
     * @Param: [page, map, request, response] 
     * @return: java.lang.String 
     * @Author: anxingtao
     * @Date: 2018-8-31 17:55 
     */ 
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(ModelMap map,HttpServletRequest request, HttpServletResponse response) throws IOException {
        PageData pd = new PageData(request);
        map.put("pd",pd);
        return "web/system/dictionary/dictionary_list";
    }

    /** 
     * @Description: findByPage 
     * @Param: [request, response] 
     * @return: void 
     * @Author: anxingtao
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
        List<PageData> list = dictionaryService.findListPage(page);
        int num = dictionaryService.findListSize(page);
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
     * @Author: anxingtao
     * @Date: 2018-8-24 11:52
     */ 
    @RequestMapping(value = "/findList", method = RequestMethod.GET)
    public void findList(HttpServletRequest request,HttpServletResponse response) throws IOException  {
        PageData pd = new PageData(request);

        List<PageData> list = dictionaryService.findList(pd);
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
     * @Author: anxingtao
     * @Date: 2018-8-24 11:53 
     */ 
    @RequestMapping(value = "/findInfo", method = RequestMethod.GET)
    public String findInfo(ModelMap map,HttpServletRequest request)  {
        PageData pd = new PageData(request);
        PageData p = dictionaryService.findInfo(pd);
        map.addAttribute("p",p);
        return "web/system/dictionary/dictionary_info";
    }


    /** 
     * @Description: toAdd
     * @Param: [map, request] 
     * @return: java.lang.String 
     * @Author: anxingtao
     * @Date: 2018-8-24 12:58 
     */ 
    @RequestMapping(value = "/toAdd", method = RequestMethod.GET)
    public String toAdd(ModelMap map,HttpServletRequest request)  {
        PageData pd = new PageData(request);
        map.put("pd",pd);
        return "web/system/dictionary/dictionary_add";
    }

    /** 
     * @Description: toAddMore 
     * @Param: [map, request] 
     * @return: java.lang.String 
     * @Author: anxingtao
     * @Date: 2018-8-27 20:22 
     */ 
    @RequestMapping(value = "/toAddMore", method = RequestMethod.GET)
    public String toAddMore(ModelMap map,HttpServletRequest request)  {
        PageData pd = new PageData(request);
        map.put("pd",pd);
        String return_url = "web/system/dictionary/dictionary_addMore";
        return return_url;
    }

    /** 
     * @Description: save 
     * @Param: [request, response] 
     * @return: void 
     * @Author: anxingtao
     * @Date: 2018-8-24 13:02 
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public void save(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException  {
        PageData pd = new PageData(request);

        String time = DateTimeUtil.getDateTimeStr();
        pd.put("create_time", time);
        pd.put("update_time", time);
        pd.put("type","0");
        //处理数据权限
        PageData user = (PageData) session.getAttribute("loginUser");
        pd.put("create_user",user.get("id"));
        pd.put("create_organize",user.get("organize_id"));
        pd.put("create_org_cascade",user.get("org_cascade"));
        int num = dictionaryService.save(pd);
        if(num==1){
            pd.put("dic_cascade", pd.get("parent_dic_cascade").toString()+pd.get("id").toString()+"_");
            dictionaryService.update(pd);
        }
        Json json = new Json();
        json.setSuccess(true);
        json.setMsg("操作成功。");
        this.writeJson(response,json);
    }

    /** 
     * @Description: saveMore 
     * @Param: [request, response] 
     * @return: void 
     * @Author: anxingtao
     * @Date: 2018-8-27 20:33
     */ 
    @RequestMapping(value = "/saveMore", method = RequestMethod.POST)
    public void saveMore(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException  {
        PageData pd = new PageData(request);
        String[] name = request.getParameterValues("name");
        String[] short_name = request.getParameterValues("short_name");
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
            pd.put("short_name",short_name[i]);
            pd.put("order_by",order_by[i]);
            pd.put("remark",remark[i]);

            pd.put("type","0");
            int num = dictionaryService.save(pd);
            if(num==1){
                pd.put("dic_cascade", pd.get("parent_dic_cascade").toString()+pd.get("id").toString()+"_");
                dictionaryService.update(pd);
            }
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
     * @Author: anxingtao
     * @Date: 2018-8-24 13:02 
     */ 
    @RequestMapping(value = "/toUpdate", method = RequestMethod.GET)
    public String toUpdate(ModelMap map,HttpServletRequest request)  {
        PageData pd = new PageData(request);
        PageData p = dictionaryService.findInfo(pd);
        map.put("p",p);
        return "web/system/dictionary/dictionary_update";
    }

    /** 
     * @Description: update 
     * @Param: [request, response]
     * @return: void 
     * @Author: anxingtao
     * @Date: 2018-8-24 13:52
     */ 
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void update(HttpServletRequest request,HttpServletResponse response) throws IOException  {
        PageData pd = new PageData(request);

        String time = DateTimeUtil.getDateTimeStr();
        pd.put("create_time", time);
        pd.put("update_time", time);
        int num = dictionaryService.update(pd);

        Json json = new Json();
        json.setSuccess(true);
        json.setMsg("操作成功。");
        this.writeJson(response,json);
    }


    /** 
     * @Description: del 
     * @Param: [request, response] 
     * @return: void 
     * @Author: anxingtao
     * @Date: 2018-8-27 20:20 
     */ 
    @RequestMapping(value = "/del", method = RequestMethod.GET)
    public void del(HttpServletRequest request,HttpServletResponse response) throws IOException  {
        PageData pd = new PageData(request);
        String[] ids = pd.get("ids").toString().split(",");
        for (String id:ids) {
            dictionaryService.delOne(id);
        }
        Json json = new Json();
        json.setSuccess(true);
        json.setMsg("操作成功。");
        this.writeJson(response,json);
    }


}
