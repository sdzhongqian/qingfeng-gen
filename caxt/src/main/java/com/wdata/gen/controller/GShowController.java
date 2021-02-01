package com.wdata.gen.controller;

import com.wdata.base.controller.BaseController;
import com.wdata.base.util.*;
import com.wdata.gen.service.GFamilyService;
import com.wdata.gen.service.GMemberService;
import com.wdata.gen.service.GMessageService;
import com.wdata.gen.service.GShowService;
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
 * @Title: GFamilyController
 * @ProjectName wdata
 * @Description: TODO
 * @author 青锋
 * @date 2018-12-30 20:40
 */
@Controller
@RequestMapping(value = "/gen/show")
public class GShowController extends BaseController {

    @Autowired
    private GMemberService memberService;
    @Autowired
    private GShowService showService;
    @Autowired
    private GMessageService messageService;

    /** 
     * @Description: index 
     * @Param: [map, request, response] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2019-1-2 10:57 
     */ 
    @RequestMapping(value = "/tree", method = RequestMethod.GET)
    public String index(ModelMap map, HttpServletRequest request, HttpServletResponse response) throws IOException {
        PageData pd = new PageData(request);

        //根据id 如果id存在则查询id  如果id不存在 则查询三级
        if(Verify.verifyIsNotNull(pd.get("id"))){
            PageData myPd = memberService.findInfo(pd);
            //查询数据
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
        }else{
            //查询数据
            pd.put("id",ParameterUtil.member_tree_id);
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
        }
        map.put("pd",pd);
        return "web/gen/show/show_tree";
    }


    @RequestMapping(value = "/children1/{id}/", method = RequestMethod.GET)
    public void children1(@PathVariable String id, HttpServletRequest request, HttpServletResponse response) throws IOException {
        PageData pd = new PageData(request);
        System.out.println(pd);
        System.out.println(request);
        System.out.println(id);
        pd.put("id",id);

        List<PageData> list = new ArrayList<PageData>();
        PageData p = new PageData();
        p.put("id","4");
        p.put("name","张三");
        p.put("title","张三爱丽丝");
        p.put("relationship","111");
        PageData p1 = new PageData();
        p1.put("id","5");
        p1.put("name","Xiang");
        p1.put("title","Xiang爱丽丝");
        p1.put("relationship","111");
        list.add(p);
        list.add(p1);
        pd.clear();
        pd.put("children",list);
        System.out.println(JsonToMap.map2json(pd));
        this.writeJson(response,pd);
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
     * @Description: treeAll
     * @Param: [map, request, response] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2019-1-2 10:57 
     */ 
    @RequestMapping(value = "/treeAll", method = RequestMethod.GET)
    public String treeAll(ModelMap map, HttpServletRequest request, HttpServletResponse response) throws IOException {
        PageData pd = new PageData(request);
        //查询数据
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
        map.put("pd",pd);
        return "web/gen/show/show_treeAll";
    }


    /** 
     * @Description: findTreeAllJson 
     * @Param: [request, response] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2019-1-2 17:03 
     */ 
    @RequestMapping(value = "/findTreeAllJson", method = RequestMethod.GET)
    public void findTreeAllJson(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PageData pd = new PageData(request);
        //查询数据
        pd.put("id",ParameterUtil.member_tree_id);
        //查询出根节点
        PageData p = showService.findMemberInfo(pd);

        List<PageData> ls = findChild(p.get("id").toString());
        p.put("children",ls);
        System.out.println(p);
        System.out.println(JsonToMap.map2json(p));
        this.writeJson(response,p);
    }


    /** 
     * @Description: findChild 
     * @Param: [id] 
     * @return: java.util.List<com.wdata.base.util.PageData> 
     * @Author: 青锋
     * @Date: 2019-1-2 17:03 
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



    @RequestMapping(value = "/reloadData", method = RequestMethod.GET)
    public void reloadData(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //查询所有的菜单信息
        PageData pd = new PageData();
        //查询组织树
        //查询数据
        pd.put("id", ParameterUtil.member_tree_id);
        //查询出根节点
        PageData p = showService.findMemberInfo(pd);

        List<PageData> ls = findChild(p.get("id").toString());
        p.put("children",ls);
        System.out.println(p);
        System.out.println(JsonToMap.map2json(p));
        pd.put("content",JsonToMap.map2json(p));

        pd.put("update_time",DateTimeUtil.getDate());
        pd.put("id",1);
        messageService.update(pd);
        Json json = new Json();
        json.setMsg("重新生成成功。");
        json.setSuccess(true);
        this.writeJson(response,json);
    }


}
