package com.wdata.gen.controller;

import com.wdata.base.controller.BaseController;
import com.wdata.base.util.*;
import com.wdata.gen.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**  
 * @Title: GAppController
 * @ProjectName wdata
 * @Description: TODO
 * @author 青锋
 * @date 2019-1-7 9:10
 */
@Controller
@RequestMapping(value = "/gen/app")
public class GAppController extends BaseController {

    @Autowired
    private GMemberService memberService;
    @Autowired
    private GShowService showService;
    @Autowired
    private GGenerationService generationService;
    @Autowired
    private GFamilyService familyService;
    @Autowired
    private GRecordService recordService;
    @Autowired
    private GMessageService messageService;


    /**
     * @Description: 主入口
     * @Param: [map, request, response, session]
     * @return: java.lang.String
     * @Author: 青锋
     * @Date: 2019-1-10 15:50
     */
    @RequestMapping(value = "/main.html", method = RequestMethod.GET)
    public String main(ModelMap map, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        PageData pd = new PageData(request);
        String resUrl = "web/gen/app/login";
        map.put("pd",pd);
        return resUrl;
    }


    /** 
     * @Description: login
     * @Param: [map, request, response] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2019-1-7 9:16 
     */ 
    @RequestMapping(value = "/login.html", method = RequestMethod.GET)
    public String login(ModelMap map, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        PageData pd = new PageData(request);
        String resUrl = "web/gen/app/login";
        if(Verify.verifyIsNotNull(pd.get("login_name"))){
            pd.put("name",pd.get("login_name"));
            List<PageData> list = memberService.findList(pd);
            if(list.size()>0){
                if(list.size()==1){
                    PageData uPd = list.get(0);

                    PageData p = new PageData();
                    p.put("member_id",uPd.get("id"));
                    p.put("name",pd.get("login_name"));
                    p.put("content",pd.get("login_name")+"于"+DateTimeUtil.getDateTimeStr()+"进行扫码登录成功。");
                    p.put("create_time",DateTimeUtil.getDateTimeStr());
                    p.put("type","1");
                    recordService.save(p);
                    session.setAttribute("loginUser",uPd);
                    resUrl = "redirect:/gen/app/content.html";
                }else{
                    map.put("list",list);
                    resUrl = "web/gen/app/selectUser";
                }
            }else{
                PageData p = new PageData();
                p.put("member_id","0");
                p.put("name",pd.get("login_name"));
                p.put("content",pd.get("login_name")+"于"+DateTimeUtil.getDateTimeStr()+"进行扫码登录失败。");
                p.put("create_time",DateTimeUtil.getDateTimeStr());
                p.put("type","2");
                recordService.save(p);
                pd.put("msg","登录名称不存在。");
            }
        }
        map.put("pd",pd);
        return resUrl;
    }


    /** 
     * @Description: 处理重名用户 
     * @Param: [map, request, response] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2019-1-7 9:29 
     */ 
    @RequestMapping(value = "/saveSessionUser.html", method = RequestMethod.GET)
    public String saveSessionUser(ModelMap map, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        PageData pd = new PageData(request);
        String resUrl = "web/gen/app/login";
        if(Verify.verifyIsNotNull(pd.get("id"))){
            PageData uPd = memberService.findInfo(pd);
            if(Verify.verifyIsNotNull(uPd)){
                session.setAttribute("loginUser",uPd);
                PageData p = new PageData();
                p.put("member_id",uPd.get("id"));
                p.put("name",pd.get("login_name"));
                p.put("content",pd.get("login_name")+"于"+DateTimeUtil.getDateTimeStr()+"进行扫码登录成功。");
                p.put("create_time",DateTimeUtil.getDateTimeStr());
                p.put("type","1");
                recordService.save(p);
                resUrl = "redirect:/gen/app/content.html";
            }else{
                pd.put("msg","登录异常，请重新登录。");
            }
        }else{
            pd.put("msg","登录异常，请重新登录。");
        }
        map.put("pd",pd);
        return resUrl;
    }


    /** 
     * @Description: index 
     * @Param: [map, request, response] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2019-1-7 17:36 
     */ 
    @RequestMapping(value = "/index.html", method = RequestMethod.GET)
    public String index(ModelMap map, HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException {
        PageData pd = new PageData(request);
        PageData uPd = (PageData)session.getAttribute("loginUser");
        String resUrl = "web/gen/app/login";
        if(Verify.verifyIsNotNull(uPd)){
            //查询世代
            pd.put("family_id",ParameterUtil.family_id);
            List<PageData> list = generationService.findList(pd);
            map.put("list",list);
            resUrl = "web/gen/app/index";
        }else{
            pd.put("msg","登录失效，请重新登录。");
        }
        map.put("pd",pd);
        return resUrl;
    }


    /** 
     * @Description: findList
     * @Param: [request, response] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2019-1-7 17:44 
     */ 
    @RequestMapping(value = "/findListPage.html", method = RequestMethod.GET)
    public void findListPage(Page page,HttpServletRequest request,HttpServletResponse response) throws IOException  {
        PageData pd = new PageData(request);

        if(Verify.verifyIsNotNull(pd.getString("index"))){
            String index = pd.getString("index");
            int startPage=(Integer.parseInt(index)-1)*10;
            pd.put("startPage", startPage);
            pd.put("endPage", 10);
        }else{
            pd.put("index", 1);
            pd.put("startPage", 0);
            pd.put("endPage", 10);
        }
        System.out.println(pd);
        page.setPd(pd);
        List<PageData> list = showService.findMemberListPage(pd);
        Json json = new Json();
        json.setMsg("获取数据成功。");
        json.setData(list);
        json.setSuccess(true);
        this.writeJson(response,json);
    }


    /** 
     * @Description: tree 
     * @Param: [map, request, response] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2019-1-7 17:36 
     */ 
    @RequestMapping(value = "/tree.html", method = RequestMethod.GET)
    public String tree(ModelMap map, HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException {
        PageData pd = new PageData(request);
        PageData uPd = (PageData)session.getAttribute("loginUser");
        String resUrl = "web/gen/app/login";
        if(Verify.verifyIsNotNull(uPd)){
            pd.put("id","1");
            PageData mp = messageService.findInfo(pd);
            if(Verify.verifyIsNotNull(mp.get("content"))){
                map.put("mpd",mp.get("content"));
            }else{
                //查询数据
                pd.put("id",ParameterUtil.member_tree_id);
                //查询出根节点
                PageData p = showService.findMemberInfo(pd);

                List<PageData> ls = findChild(p.get("id").toString());
                p.put("children",ls);
                System.out.println(p);
                System.out.println(JsonToMap.map2json(p));
                map.put("mpd",JsonToMap.map2json(p));
            }
            resUrl = "web/gen/app/tree";
        }else{
            pd.put("msg","登录失效，请重新登录。");
        }
        map.put("pd",pd);
        return resUrl;
    }


    /** 
     * @Description: me 
     * @Param: [map, request, response] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2019-1-7 17:38 
     */ 
    @RequestMapping(value = "/me.html", method = RequestMethod.GET)
    public String me(ModelMap map, HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException {
        PageData pd = new PageData(request);
        PageData uPd = (PageData)session.getAttribute("loginUser");
        String resUrl = "web/gen/app/login";
        if(Verify.verifyIsNotNull(uPd)){
            pd.put("id",uPd.get("id"));
            PageData myPd = memberService.findInfo(pd);
            //查询数据
            if(Verify.verifyIsNotNull(myPd.get("father_id"))){
                pd.put("id",myPd.get("father_id"));
                //查询出根节点
                PageData p = showService.findMemberInfo(pd);
                pd.put("father_id",p.get("id"));
                List<PageData> list = showService.findMemberList(pd);
                if(list.size()>0){
                    for (int i = 0; i < list.size(); i++) {
                        pd.put("father_id",list.get(i).get("id"));
                        List<PageData> ls = showService.findMemberList(pd);
                        if(ls.size()>0){
                            list.get(i).put("children",ls);
                        }
                    }
                    p.put("children",list);
                }
                map.put("data",JsonToMap.map2json(p));
                resUrl = "web/gen/app/me";
            }else{
                pd.put("msg","登录失效，请重新登录。");
            }
        }else{
            pd.put("msg","登录失效，请重新登录。");
        }
        map.put("pd",pd);
        return resUrl;
    }



    @RequestMapping(value = "/info.html", method = RequestMethod.GET)
    public String info(ModelMap map, HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException {
        PageData pd = new PageData(request);
        PageData uPd = (PageData)session.getAttribute("loginUser");
        String resUrl = "web/gen/app/login";
        if(Verify.verifyIsNotNull(uPd)){
            PageData myPd = memberService.findInfo(pd);
            //查询数据
            if(Verify.verifyIsNotNull(myPd.get("father_id"))){
                pd.put("id",myPd.get("father_id"));
            }else{
                pd.put("id",myPd.get("id"));
            }
            //查询出根节点
            PageData p = showService.findMemberInfo(pd);
            pd.put("father_id",p.get("id"));
            List<PageData> list = showService.findMemberList(pd);
            if(list.size()>0){
                for (int i = 0; i < list.size(); i++) {
                    pd.put("father_id",list.get(i).get("id"));
                    List<PageData> ls = showService.findMemberList(pd);
                    if(ls.size()>0){
                        list.get(i).put("children",ls);
                    }
                }
                p.put("children",list);
            }
            map.put("data",JsonToMap.map2json(p));
            resUrl = "web/gen/app/info";
        }else{
            pd.put("msg","登录失效，请重新登录。");
        }
        map.put("pd",pd);
        return resUrl;
    }


    /**
     * @Description: children
     * @Param: [id, request, response]
     * @return: void
     * @Author: 青锋
     * @Date: 2019-1-3 17:41
     */
    @RequestMapping(value = "/children/{id}/", method = RequestMethod.GET)
    public void children(@PathVariable String id, HttpServletRequest request, HttpServletResponse response) throws IOException {
        PageData pd = new PageData(request);
        pd.put("father_id",id);
        System.out.println("###################:"+id);
        List<PageData> list = showService.findMemberList(pd);
        pd.clear();
        pd.put("children",list);
        System.out.println(JsonToMap.map2json(pd));
        this.writeJson(response,pd);
    }

    /**
     * @Description: parent
     * @Param: [id, request, response]
     * @return: void
     * @Author: 青锋
     * @Date: 2019-1-3 17:41
     */
    @RequestMapping(value = "/parent/{id}/", method = RequestMethod.GET)
    public void parent(@PathVariable String id, HttpServletRequest request, HttpServletResponse response) throws IOException {
        PageData pd = new PageData(request);
        pd.put("id",id);
        PageData myPd = memberService.findInfo(pd);
        //查询数据
        pd.put("id",myPd.get("father_id"));
        PageData p = showService.findMemberInfo(pd);
        System.out.println(JsonToMap.map2json(p));
        this.writeJson(response,p);
    }

    /**
     * @Description: siblings
     * @Param: [id, request, response]
     * @return: void
     * @Author: 青锋
     * @Date: 2019-1-3 17:41
     */
    @RequestMapping(value = "/siblings/{id}/", method = RequestMethod.GET)
    public void siblings(@PathVariable String id, HttpServletRequest request, HttpServletResponse response) throws IOException {
        PageData pd = new PageData(request);
        pd.put("id",id);
        PageData myPd = memberService.findInfo(pd);
        //查询数据
        pd.put("id",myPd.get("father_id"));
        PageData p = showService.findMemberInfo(pd);

        pd.put("father_id",p.get("id"));
        pd.put("exclude_id",id);
        List<PageData> list = showService.findMemberList(pd);
        if(list.size()>0){
            p.put("children",list);
        }
        System.out.println(JsonToMap.map2json(p));
        this.writeJson(response,p);
    }





    /** 
     * @Description: 级联查询下级
     * @Param: [id] 
     * @return: java.util.List<com.wdata.base.util.PageData> 
     * @Author: 青锋
     * @Date: 2019-1-7 17:35 
     */ 
    public List<PageData> findChild(String id) throws IOException {
        System.out.println("进来了。。。。。。。#");
        PageData pd = new PageData();
        //根据根节点查询下属列表
        pd.put("father_id",id);
        List<PageData> list = showService.findMemberList(pd);
        System.out.println("############:"+list.size());
        if(list.size()>0){
            for (int i = 0; i < list.size(); i++) {
                List<PageData> ls = findChild(list.get(i).get("id").toString());
                if(ls.size()>0){
                    list.get(i).put("children",ls);
                }
            }
        }
        return list;
    }



    /** 
     * @Description: 内容介绍
     * @Param: [map, request, response, session] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2019-1-10 14:44 
     */ 
    @RequestMapping(value = "/content.html", method = RequestMethod.GET)
    public String content(ModelMap map, HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException {
        PageData pd = new PageData(request);
        PageData uPd = (PageData)session.getAttribute("loginUser");
        String resUrl = "web/gen/app/login";
        if(Verify.verifyIsNotNull(uPd)){
            pd.put("id",ParameterUtil.family_id);
            PageData p = familyService.findInfo(pd);
            map.put("p",p);
            resUrl = "web/gen/app/content";
        }else{
            pd.put("msg","登录失效，请重新登录。");
        }
        map.put("pd",pd);
        return resUrl;
    }



    /** 
     * @Description: loginExplanation 
     * @Param: [map, request, response, session] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2019-1-11 15:49 
     */ 
    @RequestMapping(value = "/loginExplanation.html", method = RequestMethod.GET)
    public String loginExplanation(ModelMap map, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        PageData pd = new PageData(request);
        String resUrl = "web/gen/app/login_explanation";

        pd.put("type","dlsm");
        PageData p = messageService.findInfoForStatus(pd);
        map.put("pd",pd);
        map.put("p",p);
        return resUrl;
    }



}
