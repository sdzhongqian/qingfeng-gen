package com.wdata.gen.dao;

import com.wdata.base.dao.CrudDao;
import com.wdata.base.util.PageData;
import org.apache.ibatis.annotations.Mapper;

/**  
 * @Title: GMessageDao
 * @ProjectName wdata
 * @Description: TODO
 * @author 青锋
 * @date 2019-1-13 11:56
 */
@Mapper
public interface GMessageDao extends CrudDao<PageData> {


    /** 
     * @Description: updateStatus 
     * @Param: [pd] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2019-1-13 12:17 
     */ 
    public void updateStatus(PageData pd);


    /** 
     * @Description: findInfoForStatus
     * @Param: [pd] 
     * @return: com.wdata.base.util.PageData 
     * @Author: 青锋
     * @Date: 2019-1-13 15:03
     */ 
    public PageData findInfoForStatus(PageData pd);

}
