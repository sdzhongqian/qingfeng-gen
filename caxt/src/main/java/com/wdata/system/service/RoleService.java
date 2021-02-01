package com.wdata.system.service;

import com.wdata.base.service.CrudService;
import com.wdata.base.util.PageData;
import com.wdata.system.dao.RoleDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by 青锋 on 2017/12/8.
 */
@Service
@Transactional
public class RoleService extends CrudService<RoleDao,PageData> {

    @Autowired
    protected RoleDao roleDao;

    /**
     * @Description: findRoleMenuList
     * @Param: [pd]
     * @return: java.util.List<com.wdata.base.util.PageData>
     * @Author: 青锋
     * @Date: 2018-8-28 23:00
     */
    public List<PageData> findRoleMenuList(PageData pd){
        return roleDao.findRoleMenuList(pd);
    }

    /** 
     * @Description: saveRoleMenu
     * @Param: [pd] 
     * @return: int 
     * @Author: 青锋
     * @Date: 2018-8-28 23:37 
     */ 
    public int saveRoleMenu(PageData pd){
        return roleDao.saveRoleMenu(pd);
    }

    /** 
     * @Description: delRoleMenu 
     * @Param: [pd] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-8-28 23:41 
     */ 
    public void delRoleMenu(String id){
        roleDao.delRoleMenu(id);
    }

    /** 
     * @Description: saveRoleUserOrg
     * @Param: [pd] 
     * @return: int 
     * @Author: 青锋
     * @Date: 2018-8-29 22:51 
     */ 
    public int saveRoleUserOrg(PageData pd){
        return roleDao.saveRoleUserOrg(pd);
    }


    /** 
     * @Description: delRoleUserOrg
     * @Param: [ids] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-8-29 22:54 
     */ 
    public void delRoleUserOrg(String[] ids){
        roleDao.delRoleUserOrg(ids);
    }

    /** 
     * @Description: updateRoleUserOrg 
     * @Param: [pd] 
     * @return: int 
     * @Author: 青锋
     * @Date: 2018-8-30 9:50
     */ 
    public int updateRoleUserOrg(PageData pd){
        return roleDao.updateRoleUserOrg(pd);
    }
}
