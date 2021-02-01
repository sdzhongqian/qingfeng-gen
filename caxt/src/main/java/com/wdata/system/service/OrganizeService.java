package com.wdata.system.service;

import com.wdata.base.service.CrudService;
import com.wdata.base.util.PageData;
import com.wdata.system.dao.OrganizeDao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**  
 * @Title: OrganizeService
 * @ProjectName wdata
 * @Description: 组织Service
 * @author 青锋
 * @date 2018-8-24 13:52
 */
@Service
@Transactional
public class OrganizeService extends CrudService<OrganizeDao,PageData> {

}
