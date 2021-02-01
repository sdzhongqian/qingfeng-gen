package com.wdata.system.service;

import com.wdata.base.service.CrudService;
import com.wdata.base.util.PageData;
import com.wdata.system.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by 青锋 on 2017/12/8.
 */
@Service
@Transactional
public class UserService extends CrudService<UserDao,PageData> {

    @Autowired
    protected UserDao userDao;

    /** 
     * @Description: saveUserOrganize 
     * @Param: [pd] 
     * @return: int 
     * @Author: 青锋
     * @Date: 2018-8-28 9:49
     */ 
    public int saveUserOrganize(PageData pd){
        return userDao.saveUserOrganize(pd);
    }

    /** 
     * @Description: updateUserOrganize
     * @Param: [pd] 
     * @return: int 
     * @Author: 青锋
     * @Date: 2018-8-28 21:42 
     */ 
    public int updateUserOrganize(PageData pd){
        return userDao.updateUserOrganize(pd);
    }


    /** 
     * @Description: findVerifyUser
     * @Param: [pd] 
     * @return: java.util.List<com.wdata.base.util.PageData> 
     * @Author: 青锋
     * @Date: 2018-8-30 21:27
     */ 
    public List<PageData> findVerifyUser(PageData pd){
        return userDao.findVerifyUser(pd);
    }


    /** 
     * @Description: findUserOrg
     * @Param: [pd] 
     * @return: com.wdata.base.util.PageData 
     * @Author: 青锋
     * @Date: 2018-9-2 19:28
     */ 
    public PageData findUserOrg(PageData pd){
        return userDao.findUserOrg(pd);
    }


    /** 
     * @Description: saveUserAuth
     * @Param: [pd] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-9-2 20:23 
     */ 
    public void saveUserAuth(PageData pd){
        userDao.saveUserAuth(pd);
    }


    /** 
     * @Description: delUserAuth
     * @Param: [user_id] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-9-3 10:04 
     */ 
    public void delUserAuth(String[] ids){
        userDao.delUserAuth(ids);
    }

    /** 
     * @Description: delUserOrg 
     * @Param: [user_id] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-9-3 10:04 
     */ 
    public void delUserOrg(String[] ids){
        userDao.delUserOrg(ids);
    }
    

}
