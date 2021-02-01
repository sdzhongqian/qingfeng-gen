package com.wdata.gen.dao;

import com.wdata.base.dao.CrudDao;
import com.wdata.base.util.PageData;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**  
 * @Title: GGenerationDao
 * @ProjectName wdata
 * @Description: TODO
 * @author 青锋
 * @date 2018-12-30 21:04
 */
@Mapper
public interface GGenerationDao extends CrudDao<PageData> {

    /** 
     * @Description: findInfoForOrder
     * @Param: [pd] 
     * @return: com.wdata.base.util.PageData 
     * @Author: 青锋
     * @Date: 2019-1-1 20:42
     */ 
    public PageData findInfoForOrder(PageData pd);

}
