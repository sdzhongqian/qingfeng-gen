package com.wdata.system.controller;

import com.wdata.base.controller.BaseController;
import com.wdata.base.util.*;
import com.wdata.system.service.*;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**  
 * @Title: UserController
 * @ProjectName wdata
 * @Description: 用户基础信息
 * @author 青锋
 * @date 2018-8-24 11:51
 */
@Controller
@RequestMapping(value = "/system/user")
public class UserController extends BaseController {

    @Autowired
    private UserService userService;
    @Autowired
    private MenuService menuService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private OrganizeService organizeService;



    /** 
     * @Description: index
     * @Param: [map, request, response] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2018-9-2 0:36 
     */ 
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(ModelMap map,HttpServletRequest request, HttpServletResponse response) throws IOException {
        PageData pd = new PageData(request);
//        if(Verify.verifyIsNotNull(pd.get("index"))){
//            page.setIndex(Integer.parseInt(pd.get("index").toString()));
//        }else{
//            page.setIndex(1);
//        }
//        List<PageData> list = userService.findListPage(page);
//        int num = userService.findListSize(page);
//        map.put("list",list);
//        map.put("num",num);
        map.put("pd",pd);
        return "web/system/user/user_list";
    }

    /**
     * @Description: findByPage
     * @Param: [request, response]
     * @return: void
     * @Author: 青锋
     * @Date: 2018-8-24 11:51
     */
    @RequestMapping(value = "/findListPage", method = RequestMethod.GET)
    public void findListPage(Page page, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        PageData pd = new PageData(request);
        //{limit=10, page=1}
        //处理数据权限
        page = dealDataAuth(page,pd,session);
        //处理分页
        if(Verify.verifyIsNotNull(pd.get("page"))){
            page.setIndex(Integer.parseInt(pd.get("page").toString()));
        }else{
            page.setIndex(1);
        }
        if(Verify.verifyIsNotNull(pd.get("limit"))){
            page.setShowCount(Integer.parseInt(pd.get("limit").toString()));
        }else{
            page.setShowCount(10);
        }
        page.setPd(pd);
        List<PageData> list = userService.findListPage(page);

        int num = userService.findListSize(page);
        Json json = new Json();
        json.setMsg("获取数据成功。");
        json.setCode(0);
        json.setCount(num);
        json.setData(list);
        json.setSuccess(true);
        this.writeJson(response,json);
    }

    /** 
     * @Description: findList 
     * @Param: [map] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2018-8-24 11:52
     */ 
    @RequestMapping(value = "/findList", method = RequestMethod.GET)
    public void findList(HttpServletRequest request,HttpServletResponse response) throws IOException  {
        PageData pd = new PageData(request);

        List<PageData> list = userService.findList(pd);

        Json json = new Json();
        json.setMsg("获取数据成功。");
        json.setData(list);
        json.setSuccess(true);
        this.writeJson(response,json);
    }

    /** 
     * @Description: findInfo 
     * @Param: [map] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2018-8-24 11:53 
     */ 
    @RequestMapping(value = "/findInfo", method = RequestMethod.GET)
    public String findInfo(ModelMap map,HttpServletRequest request)  {
        PageData pd = new PageData(request);
        PageData p = userService.findInfo(pd);
        map.addAttribute("p",p);
        return "web/system/user/user_info";
    }


    /** 
     * @Description: toAdd
     * @Param: [map, request] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2018-8-24 12:58 
     */ 
    @RequestMapping(value = "/toAdd", method = RequestMethod.GET)
    public String toAdd(ModelMap map,HttpServletRequest request)  {
        PageData pd = new PageData(request);
        map.put("pd",pd);
        return "web/system/user/user_add";
    }

    /** 
     * @Description: toAddMore
     * @Param: [map, request] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2018-8-28 10:03 
     */ 
    @RequestMapping(value = "/toAddMore", method = RequestMethod.GET)
    public String toAddMore(ModelMap map,HttpServletRequest request)  {
        PageData pd = new PageData(request);
        map.put("pd",pd);
        String return_url = "web/system/user/user_addMore";
        return return_url;
    }

    /** 
     * @Description: save 
     * @Param: [request, response] 
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-8-24 13:02 
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public void save(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException  {
        PageData pd = new PageData(request);
        Json json = new Json();

        List<String> ls = new ArrayList<String>();
        ls.add(pd.get("login_name").toString());
        pd.put("query_login_name",ls);
        List<PageData> list = userService.findVerifyUser(pd);
        if(list.size()>0){
            json.setSuccess(false);
            json.setMsg("用户【"+pd.get("login_name").toString()+"】已经存在！");
        }else{
            String time = DateTimeUtil.getDateTimeStr();
            pd.put("status","Y");
            pd.put("create_time", time);
            pd.put("update_time", time);
            pd.put("login_password",MD5.md5(pd.get("login_password").toString()));
            //处理数据权限
            PageData user = (PageData) session.getAttribute("loginUser");
            pd.put("create_user",user.get("id"));
            pd.put("create_organize",user.get("organize_id"));
            pd.put("create_org_cascade",user.get("org_cascade"));
            int num = userService.save(pd);
            if(num==1){//处理组织信息
                pd.put("user_id",pd.get("id"));
                pd.put("type","0");
                userService.saveUserOrganize(pd);
            }
            json.setSuccess(true);
            json.setMsg("操作成功。");
        }
        this.writeJson(response,json);
    }


    /**
     * @Description: saveMore
     * @Param: [request, response]
     * @return: void
     * @Author: 青锋
     * @Date: 2018-8-28 10:06
     */
    @RequestMapping(value = "/saveMore", method = RequestMethod.POST)
    public void saveMore(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException  {
        PageData pd = new PageData(request);
        String[] login_name = request.getParameterValues("login_name");
        String[] login_password = request.getParameterValues("login_password");
        String[] nickname = request.getParameterValues("nickname");
        String[] sex = request.getParameterValues("sex");

        String[] email = request.getParameterValues("email");
        String[] phone = request.getParameterValues("phone");
        String[] order_by = request.getParameterValues("order_by");


        Json json = new Json();
        List<String> ls = new ArrayList<String>();
        for (int i = 0; i < login_name.length; i++) {
            ls.add(login_name[i]);
        }
        pd.put("query_login_name",ls);
        List<PageData> list = userService.findVerifyUser(pd);
        if(list.size()>0){
            String msg = "";
            StringBuffer sb = new StringBuffer();
            for(PageData p: list){
                sb.append(p.get("login_name")).append(",");
            }
            if(sb.length()>0){
                msg = sb.substring(0,sb.length()-1);
            }
            json.setSuccess(false);
            json.setMsg("用户【"+msg+"】已经存在！");
        }else{
            //处理时间
            String time = DateTimeUtil.getDateTimeStr();
            pd.put("create_time", time);
            pd.put("update_time", time);
            //处理数据权限
            PageData user = (PageData) session.getAttribute("loginUser");
            pd.put("create_user",user.get("id"));
            pd.put("create_organize",user.get("organize_id"));
            pd.put("create_org_cascade",user.get("org_cascade"));
            for (int i = 0; i < login_name.length; i++) {
                pd.put("login_name",login_name[i]);
                pd.put("login_password",login_password[i]);
                pd.put("nickname",nickname[i]);
                pd.put("sex",sex[i]);
                pd.put("email",email[i]);
                pd.put("phone",phone[i]);
                pd.put("order_by",order_by[i]);
                pd.put("type","0");
                pd.put("status","Y");
                pd.put("login_password",MD5.md5(login_password[i]));
                int num = userService.save(pd);
                if(num==1){
                    pd.put("user_id",pd.get("id"));
                    pd.put("type","0");
                    userService.saveUserOrganize(pd);
                }
            }
            json.setSuccess(true);
            json.setMsg("操作成功。");
        }
        this.writeJson(response,json);
    }


    /** 
     * @Description: toUpdate
     * @Param: [map, request] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2018-8-24 13:02 
     */ 
    @RequestMapping(value = "/toUpdate", method = RequestMethod.GET)
    public String toUpdate(ModelMap map,HttpServletRequest request)  {
        PageData pd = new PageData(request);
        PageData p = userService.findInfo(pd);
        map.put("p",p);
        return "web/system/user/user_update";
    }

    /** 
     * @Description: update 
     * @Param: [request, response]
     * @return: void 
     * @Author: 青锋
     * @Date: 2018-8-24 13:52
     */ 
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void update(HttpServletRequest request,HttpServletResponse response) throws IOException  {
        PageData pd = new PageData(request);
        Json json = new Json();

        if(pd.get("old_login_name").equals(pd.get("login_name"))){
            String time = DateTimeUtil.getDateTimeStr();
            pd.put("create_time", time);
            pd.put("update_time", time);
            if(Verify.verifyIsNotNull(pd.get("login_password"))){
                pd.put("login_password",MD5.md5(pd.get("login_password").toString()));
            }
            int num = userService.update(pd);
            if(num==1){//处理组织信息
                pd.put("user_id",pd.get("id"));
                pd.put("type","0");
                userService.updateUserOrganize(pd);
            }
            json.setSuccess(true);
            json.setMsg("操作成功。");
        }else{
            List<String> ls = new ArrayList<String>();
            ls.add(pd.get("login_name").toString());
            pd.put("query_login_name",ls);
            List<PageData> list = userService.findVerifyUser(pd);
            if(list.size()>0){
                json.setSuccess(false);
                json.setMsg("用户【"+pd.get("login_name").toString()+"】已经存在！");
            }else{
                String time = DateTimeUtil.getDateTimeStr();
                pd.put("create_time", time);
                pd.put("update_time", time);
                if(Verify.verifyIsNotNull(pd.get("login_password"))){
                    pd.put("login_password",MD5.md5(pd.get("login_password").toString()));
                }
                int num = userService.update(pd);
                if(num==1){//处理组织信息
                    pd.put("user_id",pd.get("id"));
                    pd.put("type","0");
                    userService.updateUserOrganize(pd);
                }
                json.setSuccess(true);
                json.setMsg("操作成功。");
            }
        }
        this.writeJson(response,json);
    }


    /**
     * @Description: toEdit
     * @Param: [map, request]
     * @return: java.lang.String
     * @Author: 青锋
     * @Date: 2018-11-8 15:12
     */
    @RequestMapping(value = "/toEdit", method = RequestMethod.GET)
    public String toEdit(ModelMap map,HttpServletRequest request)  {
        PageData pd = new PageData(request);
        PageData p = userService.findInfo(pd);
        map.put("p",p);
        return "web/system/user/user_edit";
    }



    /**
     * @Description: del
     * @Param: [request, response]
     * @return: void
     * @Author: 青锋
     * @Date: 2018-8-27 14:33
     */
    @RequestMapping(value = "/del", method = RequestMethod.GET)
    public void del(HttpServletRequest request,HttpServletResponse response) throws IOException  {
        PageData pd = new PageData(request);
        String[] ids = pd.get("ids").toString().split(",");
        userService.del(ids);
        //用户组织表
        userService.delUserOrg(ids);
        //用户权限表
        userService.delUserAuth(ids);

        Json json = new Json();
        json.setMsg("获取数据成功。");
        json.setSuccess(true);
        this.writeJson(response,json);
    }

    /**
     * @Description: updateStatus
     * @Param: [request, response]
     * @return: void
     * @Author: 青锋
     * @Date: 2018-8-27 14:33
     */
    @RequestMapping(value = "/updateStatus", method = RequestMethod.GET)
    public void updateStatus(HttpServletRequest request,HttpServletResponse response) throws IOException  {
        PageData pd = new PageData(request);
        String time = DateTimeUtil.getDateTimeStr();
        pd.put("update_time", time);
        userService.update(pd);

        Json json = new Json();
        json.setSuccess(true);
        json.setFlag("操作成功。");
        this.writeJson(response,json);
    }


    /** 
     * @Description: selectUser 
     * @Param: [map, request] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2018-8-28 23:58 
     */ 
    @RequestMapping(value = "/selectOneUser", method = RequestMethod.GET)
    public String selectUser(ModelMap map,HttpServletRequest request)  {
        PageData pd = new PageData(request);
        map.put("pd",pd);
        return "web/system/user/user_selectOneUser";
    }

    /** 
     * @Description: selectMoreUser
     * @Param: [map, request] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2018-8-29 16:45 
     */ 
    @RequestMapping(value = "/selectMoreUser", method = RequestMethod.GET)
    public String selectMoreUser(ModelMap map,HttpServletRequest request)  {
        PageData pd = new PageData(request);
        map.put("pd",pd);
        return "web/system/user/user_selectMoreUser";
    }


    /** 
     * @Description: toAuth
     * @Param: [map, request] 
     * @return: java.lang.String 
     * @Author: 青锋
     * @Date: 2018-9-2 13:38 
     */ 
    @RequestMapping(value = "/toAuth", method = RequestMethod.GET)
    public String toAuth(ModelMap map,HttpServletRequest request)  {
        PageData pd = new PageData(request);
        map.put("pd",pd);
        return "web/system/user/user_auth";
    }



    @RequestMapping(value = "/saveUserAuth", method = RequestMethod.POST)
    public void saveUserAuth(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException  {
        PageData pd = new PageData(request);
        String time = DateTimeUtil.getDateTimeStr();
        pd.put("create_time", time);
        pd.put("update_time", time);
        PageData user = (PageData) session.getAttribute("loginUser");
        pd.put("create_user",user.get("id"));

        String user_id = pd.get("user_id").toString();
        String[] menu_id = request.getParameterValues("menu_id");
        String[] type = request.getParameterValues("type");
        String[] organize_names = request.getParameterValues("organize_names");
        String[] organize_ids = request.getParameterValues("organize_ids");

        //添加之前先删除
        userService.delUserAuth(user_id.split(","));
        for (int i = 0; i < menu_id.length; i++) {
            pd.put("user_id",user_id);
            pd.put("menu_id",menu_id[i]);
            pd.put("type",type[i]);
            pd.put("organize_names",organize_names[i]);
            pd.put("organize_ids",organize_ids[i]);
            userService.saveUserAuth(pd);
        }

        Json json = new Json();
        json.setSuccess(true);
        json.setMsg("操作成功。");
        this.writeJson(response,json);
    }




    @RequestMapping(value = "/findUserMenuList", method = RequestMethod.GET)
    public void findUserMenuList(HttpServletRequest request,HttpServletResponse response) throws IOException  {
        PageData pd = new PageData(request);

        //查询用户组织
        PageData orgPd = userService.findUserOrg(pd);
        pd.put("organize_id",orgPd.get("organize_id"));
        //根据用户和组织查询用户角色信息
        List<PageData> list = menuService.findUserMenuList(pd);

        Json json = new Json();
        json.setMsg("获取数据成功。");
        json.setData(list);
        json.setSuccess(true);
        this.writeJson(response,json);
    }

    /**
     * @Description: downloadExcel
     * @Param: [map, request]
     * @return: java.lang.String
     * @Author: wangcong
     * @Date: 2018-9-17
     */
    @RequestMapping(value = "/downloadExcel", method = RequestMethod.GET)
    public void downloadExcel(HttpServletRequest request,HttpSession session,HttpServletResponse response) throws Exception {
        PageData pd = new PageData(request);
        FileUtil.downFile(response, session.getServletContext().getRealPath("/")+"/excelExport/user_import_mb.xlsx", "用户信息模板.xlsx");
    }

    /**
     * @Description: toImport
     * @Param: [map, request]
     * @return: java.lang.String
     * @Author: wangcong
     * @Date: 2018-9-17
     */
    @RequestMapping(value = "/toImport", method = RequestMethod.GET)
    public String toImport(ModelMap map,HttpServletRequest request)  {
        PageData pd = new PageData(request);
        map.put("pd",pd);
        return "web/system/user/user_importExcel";
    }

    /**
     * @Description: saveImportExcel
     * @Param: [map, request]
     * @return: java.lang.String
     * @Author: wangcong
     * @Date: 2018-9-17
     */
    @RequestMapping(value = "/saveImportExcel", method = RequestMethod.POST)
    public void saveImportExcel(ModelMap map,HttpServletRequest request,HttpSession session,HttpServletResponse response) throws IOException {
        PageData pd = new PageData(request);
        String str = "导入成功";
        File directory = new File("");
        String savePath = directory.getCanonicalPath();
        File files = new File(savePath+pd.get("file_path"));
        //InputStream input = new FileInputStream(files);;
        //MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        //MultipartFile multipartFile = multipartRequest.getFile(savePath+pd.get("file_path"));
        //Workbook book = null;
        //try {
            //book = WorkbookFactory.create(new File(savePath+pd.get("file_path")));
        //} catch (InvalidFormatException e) {
           // e.printStackTrace();
       // }
        FileInputStream fileInputStream = new FileInputStream(files);
        Workbook book = new XSSFWorkbook(fileInputStream);
        Sheet sheet = book.getSheetAt(0);  //示意访问sheet

        int totalRows = sheet.getPhysicalNumberOfRows();
        int totalCells = sheet.getRow(0).getPhysicalNumberOfCells();
        String[] objs = new String[totalCells];
        Boolean flag = true;
        List<PageData> list = new ArrayList<PageData>();
        try {
            for (int i = 0; i < totalRows; i++) {
                for (int j = 0; j < totalCells; j++) {
                    Cell xssfCell = sheet.getRow(i).getCell(j);
                    if (totalRows >= 1 && sheet.getRow(0) != null) {
                        if(xssfCell==null){
                            objs[j]="";
                        }else{
                            if(xssfCell.toString().trim().equals("")){
                                objs[j]="";
                            }else{
                                objs[j] = parseExcel(xssfCell);//xssfCell.toString();
                            }
                        }

                    }
                }
                if(i!=0){
                    if(Verify.verifyIsNotNull(objs[0])){
                        if(Verify.verifyIsNotNull(objs[1]) ){
                            if(Verify.verifyIsNotNull(objs[2]) ){
                                PageData p = new PageData();
                                p.put("login_name",objs[0]);
                                p.put("login_password",objs[1]);
                                p.put("nickname",objs[2]);
                                p.put("sex",objs[3]);
                                p.put("email",objs[4]);
                                String phone = objs[5].replace(" ","");//电话号码 去除半角空格
                                if(Verify.verifyIsNotNull(phone)){
                                    phone = phone.replace(" ","");//电话号码 去除全角空格 
                                    phone = phone.replace(" ","");
                                    if (phone.indexOf("E")!=-1 || phone.indexOf("e")!=-1 || phone.indexOf("+")!=-1) {
                                        BigDecimal bd = new BigDecimal(phone);
                                        phone = bd.toString();
                                    }
                                }
                                p.put("phone",phone);
                                p.put("birth_date",objs[6]);
                                p.put("live_address",objs[7]);
                                p.put("birth_address",objs[8]);
                                list.add(p);
                            }else{
                                flag = false;
                                str = "第"+i+"行用户名称不能为空";
                            }
                        }else{
                            flag = false;
                            str = "第"+i+"行登录密码不能为空";
                        }
                    }else{
                        flag = false;
                        str = "第"+i+"行登录名称不能为空";
                    }
                }
            }
            if(flag){
                for(PageData pageData:list){
                    pageData.put("type","1");
                    pageData.put("status","Y");
                    pageData.put("organize_id",pd.get("organize_id"));
                    String time = DateTimeUtil.getDateTimeStr();
                    pageData.put("create_time", time);
                    pageData.put("update_time", time);
                    if(Verify.verifyIsNotNull(pageData.get("login_password"))){
                        pageData.put("login_password",MD5.md5(pageData.get("login_password").toString()));
                    }
                    //处理数据权限
                    PageData user = (PageData) session.getAttribute("loginUser");
                    pageData.put("create_user",user.get("id"));
                    pageData.put("create_organize",user.get("organize_id"));
                    pageData.put("create_org_cascade",user.get("org_cascade"));
                    userService.save(pageData);

                    //保存组织信息
                    pageData.put("user_id",pageData.get("id"));
                    userService.saveUserOrganize(pageData);
                }
            }
        }catch (Exception e){
            str = "导入模板不正确!";
        }
        Json json = new Json();
        json.setSuccess(flag);
        json.setMsg(str);
        this.writeJson(response,json);
    }
    private String parseExcel(Cell cell) {
        String result = new String();
        switch (cell.getCellType()) {
            case HSSFCell.CELL_TYPE_NUMERIC:// 数字类型
                if (HSSFDateUtil.isCellDateFormatted(cell)) {// 处理日期格式、时间格式
                    SimpleDateFormat sdf = null;
                    if (cell.getCellStyle().getDataFormat() == HSSFDataFormat
                            .getBuiltinFormat("h:mm")) {
                        sdf = new SimpleDateFormat("HH:mm");
                    } else {// 日期
                        sdf = new SimpleDateFormat("yyyy-MM-dd");
                    }
                    Date date = cell.getDateCellValue();
                    result = sdf.format(date);
                } else if (cell.getCellStyle().getDataFormat() == 58) {
                    // 处理自定义日期格式：m月d日(通过判断单元格的格式id解决，id的值是58)
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    double value = cell.getNumericCellValue();
                    Date date = org.apache.poi.ss.usermodel.DateUtil
                            .getJavaDate(value);
                    result = sdf.format(date);
                } else {
                    result = cell.toString();
                }
                break;
            case HSSFCell.CELL_TYPE_STRING:// String类型
                result = cell.getRichStringCellValue().toString();
                break;
            case HSSFCell.CELL_TYPE_BLANK:
                result = "";
            default:
                result = "";
                break;
        }
        return result;
    }



}
