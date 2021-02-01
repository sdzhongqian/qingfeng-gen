package com.wdata.gen.service;

import com.wdata.base.service.CrudService;
import com.wdata.base.util.PageData;
import com.wdata.gen.dao.GFamilyDao;
import com.wdata.gen.dao.GGenerationDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**  
 * @Title: GGenerationService
 * @ProjectName wdata
 * @Description: TODO
 * @author 青锋
 * @date 2018-12-30 21:04
 */
@Service
@Transactional
public class GGenerationService extends CrudService<GGenerationDao,PageData> {

    @Autowired
    protected GGenerationDao generationDao;


    /**
     * @Description: findInfoForOrder
     * @Param: [pd]
     * @return: com.wdata.base.util.PageData
     * @Author: 青锋
     * @Date: 2019-1-1 20:16
     */
    public PageData findInfoForOrder(PageData pd){
        return generationDao.findInfoForOrder(pd);
    }

}
