package com.wdata.base.service;

import com.github.pagehelper.PageHelper;
import com.wdata.base.dao.CrudDao;
import com.wdata.base.util.Page;
import com.wdata.base.util.PageData;
import org.springframework.beans.factory.annotation.Autowired;

/**  
 * @Title: CrudService
 * @ProjectName wdata
 * @Description: TODO
 * @author 青锋
 * @date 2018-8-24 11:33
 */
import java.util.List;


public class CrudService<Dao extends CrudDao<T>,T> {
    @Autowired
    protected Dao curdDao;

    /** 
     * @Description: 基础查询分页 
     * @Param: [page] 
     * @return: java.util.List<T> 
     * @Author: 青锋
     * @Date: 2018-8-24 11:49 
     */ 
    public List<T> findListPage(Page page) {
        PageHelper.startPage(page.getIndex(), page.getShowCount());
        return curdDao.findListPage(page);
    }

    public Integer findListSize(Page page){
        return curdDao.findListSize(page);
    }

    /** 
     * @Description: 基础查询列表
     * @Param: [pd] 
     * @return: java.util.List<T> 
     * @Author: 青锋
     * @Date: 2018-8-24 11:49 
     */ 
    public List<T> findList(PageData pd){
        List<T> list = curdDao.findList(pd);
        return list;
    }

    /** 
     * @Description: 查询详情
     * @Param: [pd] 
     * @return: T 
     * @Author: 青锋
     * @Date: 2018-8-24 11:49 
     */ 
    public T findInfo(PageData pd){
        return curdDao.findInfo(pd);
    }

    /** 
     * @Description: 基础保存方法
     * @Param: [t] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-8-24 11:49 
     */ 
    public int save(T t){
        return curdDao.save(t);
    }


    /** 
     * @Description: 基础更新方法
     * @Param: [t] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-8-24 11:49 
     */ 
    public int update(T t){
        return curdDao.update(t);
    }

    /** 
     * @Description: 基础删除对象方法
     * @Param: [pd] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-8-24 11:50 
     */ 
    public void remove(PageData pd){
        curdDao.remove(pd);
    }

    /** 
     * @Description: 基础根据ids删除对象 
     * @Param: [ids] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-8-24 11:50 
     */ 
    public void del(String[] ids){
        curdDao.del(ids);
    }

    /** 
     * @Description: delOne
     * @Param: [id] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-8-27 17:09
     */ 
    public void delOne(String id){
        curdDao.delOne(id);
    }
}
