package com.wdata.gen.dao;

import com.wdata.base.dao.CrudDao;
import com.wdata.base.util.Page;
import com.wdata.base.util.PageData;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**  
 * @Title: GShowDao
 * @ProjectName wdata
 * @Description: TODO
 * @author 青锋
 * @date 2019-1-2 14:17
 */
@Mapper
public interface GShowDao extends CrudDao<PageData> {


    /** 
     * @Description: findMemberInfo 
     * @Param: [pd] 
     * @return: com.wdata.base.util.PageData 
     * @Author: 青锋
     * @Date: 2019-1-2 14:21 
     */ 
    public PageData findMemberInfo(PageData pd);

    /** 
     * @Description: findMemberList 
     * @Param: [pd] 
     * @return: java.util.List<com.wdata.base.util.PageData> 
     * @Author: 青锋
     * @Date: 2019-1-2 14:21 
     */ 
    public List<PageData> findMemberList(PageData pd);


    /** 
     * @Description: findMemberListPage 
     * @Param: [page] 
     * @return: java.util.List<com.wdata.base.util.PageData> 
     * @Author: 青锋
     * @Date: 2019-1-7 17:48 
     */ 
    public List<PageData> findMemberListPage(PageData pd);

}
