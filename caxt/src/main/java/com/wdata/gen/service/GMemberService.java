package com.wdata.gen.service;

import com.wdata.base.service.CrudService;
import com.wdata.base.util.PageData;
import com.wdata.gen.dao.GFamilyDao;
import com.wdata.gen.dao.GMemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**  
 * @Title: GMemberService
 * @ProjectName wdata
 * @Description: TODO
 * @author 青锋
 * @date 2018-12-30 21:06
 */
@Service
@Transactional
public class GMemberService extends CrudService<GMemberDao,PageData> {

    @Autowired
    protected GMemberDao memberDao;


    /**
     * @Description: findWifeList
     * @Param: [pd]
     * @return: java.util.List<com.wdata.base.util.PageData>
     * @Author: 青锋
     * @Date: 2018-12-31 17:38
     */
    public List<PageData> findWifeList(PageData pd){
        return memberDao.findWifeList(pd);
    }

    /**
     * @Description: saveWife
     * @Param: [pd]
     * @return: int
     * @Author: 青锋
     * @Date: 2018-12-31 17:38
     */
    public int saveWife(PageData pd){
        return memberDao.saveWife(pd);
    }

    /**
     * @Description: updateWife
     * @Param: [pd]
     * @return: int
     * @Author: 青锋
     * @Date: 2018-12-31 17:38
     */
    public int updateWife(PageData pd){
        return memberDao.updateWife(pd);
    }

    /**
     * @Description: delWife
     * @Param: [ids]
     * @return: void
     * @Author: 青锋
     * @Date: 2018-12-31 17:38
     */
    public void delWife(String[] ids){
        memberDao.delWife(ids);
    }

    /**
     * @Description: delWifeForMemberId
     * @Param: [ids]
     * @return: void
     * @Author: 青锋
     * @Date: 2018-12-31 17:38
     */
    public void delWifeForMemberId(String[] ids){
        memberDao.delWifeForMemberId(ids);
    }

    
    /** 
     * @Description: findGTreeList
     * @Param: [pd] 
     * @return: java.util.List<com.wdata.base.util.PageData> 
     * @Author: 青锋
     * @Date: 2019-1-6 17:21
     */ 
    public List<PageData> findGTreeList(PageData pd){
       return memberDao.findGTreeList(pd);
    }
    
}
