package com.wdata.base.dao;


import com.wdata.base.util.Page;
import com.wdata.base.util.PageData;

import java.util.List;

/**  
 * @Title: CrudDao
 * @ProjectName wdata
 * @Description: TODO
 * @author 青锋
 * @date 2018-8-24 11:32
 */
public interface CrudDao<T>{

    /** 
     * @Description: 分页查询 
     * @Param: [page] 
     * @return: java.util.List<T> 
     * @Author: 青锋
     * @Date: 2018-8-24 11:50 
     */ 
    public List<T> findListPage(Page page);

    /** 
     * @Description: 查询列表数量
     * @Param: [page] 
     * @return: java.lang.Integer 
     * @Author: 青锋
     * @Date: 2018-8-24 11:50 
     */ 
    public Integer findListSize(Page page);

    /** 
     * @Description: 查询列表
     * @Param: [pd] 
     * @return: java.util.List<T> 
     * @Author: 青锋
     * @Date: 2018-8-24 11:50 
     */ 
    public List<T> findList(PageData pd);

    /** 
     * @Description: 查询详情
     * @Param: [pd] 
     * @return: T 
     * @Author: 青锋
     * @Date: 2018-8-24 11:50 
     */ 
    public T findInfo(PageData pd);

    /** 
     * @Description: 保存
     * @Param: [t] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-8-24 11:50 
     */ 
    public int save(T t);

    /** 
     * @Description: 更新
     * @Param: [t] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-8-24 11:50 
     */ 
    public int update(T t);

    /** 
     * @Description: 删除
     * @Param: [pd] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-8-24 11:50 
     */ 
    public void remove(PageData pd);

    /** 
     * @Description: 根据ids删除集合
     * @Param: [ids] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-8-24 12:58
     */ 
    public void del(String[] ids);

    /** 
     * @Description: delOne 
     * @Param: [id] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-8-27 17:09
     */ 
    public void delOne(String id);
}
