package com.wdata.base.util;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;


/**
 * @author 青锋
 * @Title: JDBCUtils
 * @ProjectName wdata
 * @Description: TODO
 * @date 2018-10-239:21
 */
public class JDBCUtils {

    /** 
     * @Description: 驱动类类名
     * @Param:  
     * @return:  
     * @Author: 青锋
     * @Date: 2018-10-23 11:29 
     */ 
    private static final String DBDRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    /** 
     * @Description: 数据库名
     * @Param:  
     * @return:  
     * @Author: 青锋
     * @Date: 2018-10-23 11:29 
     */ 
    private static final String DBNAME = "oa";
    /** 
     * @Description: 连接URL
     * @Param:  
     * @return:  
     * @Author: 青锋
     * @Date: 2018-10-23 11:29 
     */ 
    private static final String DBURL = "jdbc:sqlserver://47.93.37.249:1433;DatabaseName="+DBNAME;
    /** 
     * @Description: 数据库用户名 
     * @Param:  
     * @return:  
     * @Author: 青锋
     * @Date: 2018-10-23 11:29 
     */ 
    private static final String DBUSER = "ezoffice";
    /** 
     * @Description: 数据库密码 
     * @Param:  
     * @return:
     * @Author: 青锋
     * @Date: 2018-10-23 11:29 
     */ 
    private static final String DBPASSWORD = "ezOFFICE12.4";
    private static Connection conn = null;
    private static PreparedStatement ps = null;
    private static ResultSet rs = null;

    /** 
     * @Description: 获取数据库连接 
     * @Param: [] 
     * @return: java.sql.Connection 
     * @Author: 青锋
     * @Date: 2018-10-23 11:30
     */ 
    public static Connection getConnection() {
        try {
            Class.forName(DBDRIVER);// 注册驱动
            conn = DriverManager.getConnection(DBURL,DBUSER, DBPASSWORD);// 获得连接对象
            System.out.println("成功加载SQL Server驱动程序");
        } catch (ClassNotFoundException e) {// 捕获驱动类无法找到异常
            System.out.println("找不到SQL Server驱动程序");
            System.out.println(e.toString());
            e.printStackTrace();
        } catch (SQLException e) {// 捕获SQL异常
            e.printStackTrace();
        }
        return conn;
    }

    /** 
     * @Description: 查询 
     * @Param: [sql] 
     * @return: java.sql.ResultSet
     * @Author: 青锋
     * @Date: 2018-10-23 11:30 
     */ 
    public static List<PageData> select(String sql) throws Exception {
        try {
            conn = getConnection();
            ps = (PreparedStatement) conn.prepareStatement(sql);
            rs = ps.executeQuery();

            List<PageData> list = new ArrayList<PageData>();
            ResultSetMetaData rsmd = rs.getMetaData();
            // 得到数据集的列数
            int columncount = rsmd.getColumnCount();
            System.out.println(columncount);
            while (rs.next()) {
                PageData p = new PageData();
                for (int i = 0; i < columncount; i++) {
                    String key = rsmd.getColumnLabel(i + 1);
                    //String key = rsmd.getColumnName(i + 1)
                    String value = rs.getString(key);
                    p.put(key, value);
                }
                list.add(p);
            }

            return list;
        } catch (SQLException sqle) {
            throw new SQLException("select data Exception: "
                    + sqle.getMessage());
        } catch (Exception e) {
            throw new Exception("System error: " + e.getMessage());
        }
    }

    /*
     * 增删改均调用这个方法
     */
    public static void updata(String sql) throws Exception {
        try {
            conn = getConnection();
            ps = (PreparedStatement) conn.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException sqle) {
            throw new SQLException("insert data Exception: "
                    + sqle.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception e) {
                throw new Exception("ps close exception: " + e.getMessage());
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                throw new Exception("conn close exception: " + e.getMessage());
            }
        }

    }


    public static void main(String[] args) throws Exception {
        System.out.println(select("select * from demo"));;
        System.out.println(select("select * from demo").size());
    }


}