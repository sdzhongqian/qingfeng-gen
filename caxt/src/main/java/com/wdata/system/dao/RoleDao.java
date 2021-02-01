package com.wdata.system.dao;

import com.wdata.base.dao.CrudDao;
import com.wdata.base.util.PageData;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * Created by 青锋 on 2017/12/8.
 */
@Mapper
public interface RoleDao extends CrudDao<PageData> {


    /**
     * @Description: findRoleMenuList 
     * @Param: [pd] 
     * @return: java.util.List<com.wdata.base.util.PageData> 
     * @Author: 青锋
     * @Date: 2018-8-28 23:01 
     */ 
    public List<PageData> findRoleMenuList(PageData pd);


    /** 
     * @Description: saveRoleMenu 
     * @Param: [pd] 
     * @return: int 
     * @Author: 青锋
     * @Date: 2018-8-28 23:37 
     */ 
    public int saveRoleMenu(PageData pd);

    /** 
     * @Description: delRoleMenu 
     * @Param: [id] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-8-28 23:54
     */ 
    public void delRoleMenu(String id);

    /** 
     * @Description: saveRoleUserOrg 
     * @Param: [pd] 
     * @return: int 
     * @Author: 青锋
     * @Date: 2018-8-29 22:52 
     */ 
    public int saveRoleUserOrg(PageData pd);

    /**
     * @Description: delRoleUserOrg 
     * @Param: [ids] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-8-29 22:55 
     */ 
    public void delRoleUserOrg(String[] ids);


    /** 
     * @Description: updateRoleUserOrg
     * @Param: [pd] 
     * @return: int 
     * @Author: 青锋
     * @Date: 2018-8-30 9:50
     */ 
    public int updateRoleUserOrg(PageData pd);
    
}
