package com.wdata.gen.controller;

import com.wdata.base.controller.BaseController;
import com.wdata.base.util.*;
import com.wdata.gen.service.GRecordService;
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
 * @Title: GMemberController
 * @ProjectName wdata
 * @Description: TODO
 * @author 青锋
 * @date 2018-12-30 21:08
 */
@Controller
@RequestMapping(value = "/gen/record")
public class GRecoedController extends BaseController {

    @Autowired
    private GRecordService recordService;


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

        map.put("pd",pd);
        return "web/gen/record/record_list";
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
        System.out.println("##:"+pd);
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
        List<PageData> list = recordService.findListPage(page);
        int num = recordService.findListSize(page);
        Json json = new Json();
        json.setMsg("获取数据成功。");
        json.setCode(0);
        json.setCount(num);
        json.setData(list);
        json.setSuccess(true);
        this.writeJson(response,json);
    }


}
