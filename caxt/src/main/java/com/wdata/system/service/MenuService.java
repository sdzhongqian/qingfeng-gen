package com.wdata.system.service;

import com.wdata.base.service.CrudService;
import com.wdata.base.util.PageData;
import com.wdata.base.util.Verify;
import com.wdata.system.dao.MenuDao;
import com.wdata.system.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.List;

/**  
 * @Title: MenuService
 * @ProjectName wdata
 * @Description: 菜单Service
 * @author 青锋
 * @date 2018-8-24 13:52
 */
@Service
@Transactional
public class MenuService extends CrudService<MenuDao,PageData> {

    @Autowired
    protected MenuDao menuDao;


    /** 
     * @Description: delForParam 
     * @Param: [pd] 
     * @return: int 
     * @Author: 青锋
     * @Date: 2018-8-30 17:01 
     */ 
    public void delForParam(PageData pd){
        menuDao.delForParam(pd);
    }


    /** 
     * @Description: findMenuList
     * @Param: [pd] 
     * @return: java.util.List<com.wdata.base.util.PageData> 
     * @Author: 青锋
     * @Date: 2018-9-1 23:02 
     */ 
    public List<PageData> findMenuList(PageData pd){

        List<PageData> list = menuDao.findMenuList(pd);//查找一级菜单
        for (int i = 0; i < list.size(); i++) {
            if(i==0){
                list.get(i).put("spread","true");
            }
            pd.put("type","menu");
            pd.put("level","2");
            pd.put("parent_id",list.get(i).get("id"));
            List<PageData> ls = menuDao.findMenuList(pd);//查询二级菜单
            if(ls.size()>0){
                for (int j = 0; j < ls.size(); j++) {
                    pd.put("type","button");
                    pd.put("level","3");
                    pd.put("parent_id",ls.get(j).get("id"));
                    List<PageData> buttonLs = menuDao.findMenuList(pd);
                    StringBuffer sb = new StringBuffer();
                    for (int bi = 0; bi < buttonLs.size(); bi++) {
                        sb.append(buttonLs.get(bi).get("code")).append(",");
                    }

                    String path = pd.get("contextPath")+ls.get(j).get("href").toString();
                    if(Verify.verifyIsNotNull(path)){
                        if(path.contains("?")){
                            path = path+"&";
                        }else{
                            path = path+"?";
                        }
                        if(Verify.verifyIsNotNull(ls.get(j).get("user_auth_id"))){
                            if(ls.get(j).get("user_auth_type").equals("5")){
                                path = path+"auth_type="+ls.get(j).get("user_auth_type")+"&auth_organize_ids="+ls.get(j).get("user_auth_organize_ids");
                            }else{
                                path = path+"auth_type="+ls.get(j).get("user_auth_type");
                            }
                        }else{
                            path = path+"auth_type=1";
                        }

                        if(sb.length()>0){
                            path = path+"&authParam="+sb.substring(0,sb.length()-1);
    //                        ls.get(j).put("href",ls.get(j).get("href")+"?authParam="+sb.substring(0,sb.length()-1));
                        }
                        ls.get(j).put("href",path);
                    }else{
                        ls.get(j).put("href","");
                    }
                }
                list.get(i).put("children",ls);
            }
            pd.put("type","button");
            pd.put("level","2");
            pd.put("parent_id",list.get(i).get("id"));
            List<PageData> butLs = menuDao.findMenuList(pd);
            StringBuffer butsb = new StringBuffer();
            for (int j = 0; j < butLs.size(); j++) {
                butsb.append(butLs.get(i).get("code")).append(",");
            }
            if(Verify.verifyIsNotNull(list.get(i).get("href"))){
                String path = pd.get("contextPath")+list.get(i).get("href").toString();
                if(Verify.verifyIsNotNull(path)) {
                    if (path.contains("?")) {
                        path = path + "&";
                    } else {
                        path = path + "?";
                    }
                    if (Verify.verifyIsNotNull(list.get(i).get("user_auth_id"))) {
                        if (list.get(i).get("user_auth_type").equals("5")) {
                            path = path + "auth_type=" + list.get(i).get("user_auth_type") + "&auth_organize_ids=" + list.get(i).get("user_auth_organize_ids");
                        } else {
                            path = path + "auth_type=" + list.get(i).get("user_auth_type");
                        }
                    } else {
                        path = path + "auth_type=1";
                    }
                    if (butsb.length() > 0) {
                        path = path + "&authParam=" + butsb.substring(0, butsb.length() - 1);
                        //                list.get(i).put("href",list.get(i).get("href")+"?authParam="+butsb.substring(0,butsb.length()-1));
                    }
                    list.get(i).put("href", path);
                }else{
                    list.get(i).put("href", "");
                }
            }
        }
        return list;
    }


    public List<PageData> findMList(PageData pd){
        List<PageData> list = menuDao.findMenuList(pd);//查找一级菜单
        return list;
    }


    /** 
     * @Description: findUserMenuList
     * @Param: [pd] 
     * @return: java.util.List<com.wdata.base.util.PageData> 
     * @Author: 青锋
     * @Date: 2018-9-2 19:28
     */ 
    public List<PageData> findUserMenuList(PageData pd){
        pd.put("type","menu");
        pd.put("level","0");
        pd.put("parent_id","0");
        List<PageData> oneLs = menuDao.findMenuList(pd);//查找一级菜单
        for (int j = 0; j < oneLs.size(); j++) {
            pd.put("level","1");
            pd.put("parent_id",oneLs.get(j).get("id"));
            List<PageData> list = menuDao.findMenuList(pd);//查找二级菜单
            for (int i = 0; i < list.size(); i++) {
                pd.put("type","menu");
                pd.put("level","2");
                pd.put("parent_id",list.get(i).get("id"));
                List<PageData> ls = menuDao.findMenuList(pd);//查询三级菜单

                list.get(i).put("children_children",ls);
            }
            oneLs.get(j).put("children",list);
        }
        return oneLs;
    }


    /** 
     * @Description: delRoleMenu
     * @Param: [] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-9-3 10:17 
     */ 
    public void delRoleMenu(String id){
        menuDao.delRoleMenu(id);
    }

}
