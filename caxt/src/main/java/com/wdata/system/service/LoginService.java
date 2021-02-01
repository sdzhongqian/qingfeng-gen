package com.wdata.system.service;

import com.wdata.base.service.CrudService;
import com.wdata.base.util.PageData;
import com.wdata.system.dao.LoginDao;
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
public class LoginService extends CrudService<LoginDao,PageData> {

    @Autowired
    protected LoginDao loginDao;


    /** 
     * @Description: findUserInfo
     * @Param: [pd] 
     * @return: com.wdata.base.util.PageData 
     * @Author: 青锋
     * @Date: 2018-9-1 18:33
     */ 
    public PageData findUserInfo(PageData pd){
        return loginDao.findUserInfo(pd);
    }

}
