package com.wdata.gen.service;

import com.wdata.base.service.CrudService;
import com.wdata.base.util.PageData;
import com.wdata.gen.dao.GMessageDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**  
 * @Title: GMessageService
 * @ProjectName wdata
 * @Description: TODO
 * @author 青锋
 * @date 2019-1-13 11:02
 */
@Service
@Transactional
public class GMessageService extends CrudService<GMessageDao,PageData> {

    @Autowired
    protected GMessageDao messageDao;

    
    /** 
     * @Description: updateStatus 
     * @Param: [pd] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2019-1-13 12:17 
     */ 
    public void updateStatus(PageData pd){
        messageDao.updateStatus(pd);
    }
    
    /** 
     * @Description: findInfoForStatus
     * @Param: [pd] 
     * @return: com.wdata.base.util.PageData 
     * @Author: 青锋
     * @Date: 2019-1-13 14:00 
     */ 
    public PageData findInfoForStatus(PageData pd){
        return messageDao.findInfoForStatus(pd);
    }

}
