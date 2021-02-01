package com.wdata.system.dao;

import com.wdata.base.dao.CrudDao;
import com.wdata.base.util.PageData;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * Created by 青锋 on 2017/12/8.
 */
@Mapper
public interface MenuDao extends CrudDao<PageData> {



    /** 
     * @Description: delForParam 
     * @Param: [pd]
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-8-30 17:24
     */ 
    public void delForParam(PageData pd);


    /**
     * @Description: findMenuList
     * @Param: [pd]
     * @return: java.util.List<com.wdata.base.util.PageData>
     * @Author: 青锋
     * @Date: 2018-9-1 23:03
     */
    public List<PageData> findMenuList(PageData pd);

    /**
     * @Description: delRoleMenu
     * @Param: [id]
     * @return: void
     * @Author: 青锋
     * @Date: 2018-9-3 10:18
     */
    public void delRoleMenu(String id);

}
