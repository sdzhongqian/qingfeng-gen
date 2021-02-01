package com.wdata.system.dao;

import com.wdata.base.dao.CrudDao;
import com.wdata.base.util.PageData;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**  
 * @Title: LoginDao
 * @ProjectName wdata
 * @Description: TODO
 * @author 青锋
 * @date 2018-9-1 7:49
 */
@Mapper
public interface LoginDao extends CrudDao<PageData> {


    /** 
     * @Description: findUserInfo
     * @Param: [pd] 
     * @return: com.wdata.base.util.PageData 
     * @Author: 青锋
     * @Date: 2018-9-1 18:33
     */ 
    public PageData findUserInfo(PageData pd);
}
