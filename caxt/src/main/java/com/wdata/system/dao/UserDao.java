package com.wdata.system.dao;

import com.github.pagehelper.Page;
import com.wdata.base.dao.CrudDao;
import com.wdata.base.util.PageData;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by 青锋 on 2017/12/8.
 */
@Mapper
public interface UserDao extends CrudDao<PageData> {

    
    /** 
     * @Description: saveUserOrganize 
     * @Param: [pd] 
     * @return: int 
     * @Author: 青锋
     * @Date: 2018-8-28 9:49
     */ 
    public int saveUserOrganize(PageData pd);

    /** 
     * @Description: updateUserOrganize
     * @Param: [pd] 
     * @return: int 
     * @Author: 青锋
     * @Date: 2018-8-28 22:07
     */ 
    public int updateUserOrganize(PageData pd);


    /** 
     * @Description: findVerifyUser 
     * @Param: [pd] 
     * @return: java.util.List<com.wdata.base.util.PageData> 
     * @Author: 青锋
     * @Date: 2018-8-30 21:27
     */ 
    public List<PageData> findVerifyUser(PageData pd);


    /**
     * @Description: findUserOrg
     * @Param: [pd] 
     * @return: com.wdata.base.util.PageData 
     * @Author: 青锋
     * @Date: 2018-9-2 19:04 
     */ 
    public PageData findUserOrg(PageData pd);

    /** 
     * @Description: saveUserAuth 
     * @Param: [pd] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-9-2 20:23 
     */ 
    public void saveUserAuth(PageData pd);


    /** 
     * @Description: delUserAuth 
     * @Param: [user_id] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-9-2 21:12
     */ 
    public void delUserAuth(String[] ids);

    /** 
     * @Description: delUserOrg 
     * @Param: [ids] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-9-3 10:09
     */ 
    public void delUserOrg(String[] ids);
    
}
