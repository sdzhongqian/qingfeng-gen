package com.wdata.base.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.fasterxml.jackson.core.JsonEncoding;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.wdata.base.util.JsonToMap;
import com.wdata.base.util.Page;
import com.wdata.base.util.PageData;
import com.wdata.base.util.Verify;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * @Title: BaseController
 * @ProjectName wdata
 * @Description: TODO
 * @author 青锋
 * @date 2018-8-24 11:30
 */
public class BaseController {




    //类型
    public List<PageData> findType(){
        List<PageData> ls = new ArrayList<PageData>();
        PageData p1 = new PageData();
        PageData p3 = new PageData();
        p3.put("key", "字符型");
        p3.put("value", "nvarchar");
        ls.add(p3);
        p1.put("key", "整型");
        p1.put("value", "int");
        ls.add(p1);
        PageData p2 = new PageData();
        p2.put("key", "浮点型");
        p2.put("value", "float");
        ls.add(p2);
        PageData p4 = new PageData();
        p4.put("key", "文本型");
        p4.put("value", "text");
        ls.add(p4);
        return ls;
    }


    public Page dealDataAuth(Page page, PageData pd, HttpSession session){
        PageData user = (PageData) session.getAttribute("loginUser");
        if(pd.get("auth_type").equals("1")){//本人
            pd.put("create_user",user.get("id"));
        }else if(pd.get("auth_type").equals("2")){//本组织
            pd.put("create_organize",user.get("organize_id"));
        }else if(pd.get("auth_type").equals("3")){//本组织及下属组织
            pd.put("create_org_cascade",user.get("org_cascade"));
        }else if(pd.get("auth_type").equals("4")){//全部

        }else if(pd.get("auth_type").equals("5")){//自定义
            String[] organize_ids = pd.get("auth_organize_ids").toString().split(",");
            StringBuffer uLs = new StringBuffer();
            StringBuffer oLs = new StringBuffer();
            for (int i = 0; i < organize_ids.length ; i++) {
                if(Verify.verifyIsNotNull(organize_ids[i])){
                    if(organize_ids[i].contains("@")){//组织
                        oLs.append(organize_ids[i].replaceAll("@","")).append(",");
                    }else{//用户
                        uLs.append(organize_ids[i]).append(",");
                    }
                }
            }
            String auth_param = "";
            if(uLs.length()>0){
                auth_param +="a.create_user in ("+uLs.substring(0,uLs.length()-1)+")";
                if(oLs.length()>0){
                    auth_param += " or ";
                }
            }
            if(oLs.length()>0){
                auth_param+="a.create_organize in ("+oLs.substring(0,oLs.length()-1)+")";
            }
            page.setParam(auth_param);
        }
        return page;
    }

    /** 
     * @Description: writeJson
     * @Param: [response, object] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-8-24 13:09
     */ 
    public void writeJson(HttpServletResponse response, Object object) throws IOException {

        response.setContentType("text/html;charset=utf-8");
        ObjectMapper objMapper = new ObjectMapper();
        JsonGenerator jsonGenerator = objMapper.getJsonFactory()
                .createJsonGenerator(response.getOutputStream(),
                        JsonEncoding.UTF8);

        jsonGenerator.writeObject(object);
        jsonGenerator.flush();
        jsonGenerator.close();
    }



    public void writeFastJson(HttpServletResponse response, Object object) throws IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json; charset=utf-8");
        PrintWriter writer = response.getWriter();
        writer.write(JSON.toJSONString(object, SerializerFeature.IgnoreNonFieldGetter));
    }


    public void writeToJson(HttpServletResponse response, Object object) throws IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json; charset=utf-8");
        PrintWriter writer = response.getWriter();
        writer.write(JsonToMap.object2json(object));
    }


}
