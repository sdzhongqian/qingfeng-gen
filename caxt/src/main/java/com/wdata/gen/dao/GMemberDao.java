package com.wdata.gen.dao;

import com.wdata.base.dao.CrudDao;
import com.wdata.base.util.PageData;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**  
 * @Title: GMemberDao
 * @ProjectName wdata
 * @Description: TODO
 * @author 青锋
 * @date 2018-12-30 21:06
 */
@Mapper
public interface GMemberDao extends CrudDao<PageData> {


    /** 
     * @Description: findWifeList 
     * @Param: [pd] 
     * @return: java.util.List<com.wdata.base.util.PageData> 
     * @Author: 青锋
     * @Date: 2018-12-31 17:38 
     */ 
    public List<PageData> findWifeList(PageData pd);

    /** 
     * @Description: saveWife 
     * @Param: [pd] 
     * @return: int 
     * @Author: 青锋
     * @Date: 2018-12-31 17:38 
     */ 
    public int saveWife(PageData pd);

    /** 
     * @Description: updateWife 
     * @Param: [pd] 
     * @return: int 
     * @Author: 青锋
     * @Date: 2018-12-31 17:38 
     */ 
    public int updateWife(PageData pd);

    /** 
     * @Description: delWife 
     * @Param: [ids] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-12-31 17:38 
     */ 
    public void delWife(String[] ids);

    /** 
     * @Description: delWifeForMemberId
     * @Param: [ids] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-12-31 18:01
     */ 
    public void delWifeForMemberId(String[] ids);


    /** 
     * @Description: findGTreeList
     * @Param: [pd] 
     * @return: java.util.List<com.wdata.base.util.PageData> 
     * @Author: 青锋
     * @Date: 2019-1-6 17:15
     */ 
    public List<PageData> findGTreeList(PageData pd);


}
