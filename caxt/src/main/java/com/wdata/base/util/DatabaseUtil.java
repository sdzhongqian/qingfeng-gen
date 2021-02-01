package com.wdata.base.util;

import java.io.File;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DatabaseUtil {

    private static String hostIP="47.52.68.101";
    private static String userName="root";
    private static String password="Cloudsrich@1210";
    private static String databaseName="zcgl";

	
	public static Connection getMySQLConnection() throws Exception {  
        Class.forName("com.mysql.jdbc.Driver");  
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/waxt?useUnicode=true&characterEncoding=utf8&autoReconnect=true&useSSL=false", "root", "Root@123");
        return conn;
    } 
	
	
	public static void execute(String sql) throws Exception{
		Connection conn = getMySQLConnection();  
        Statement stmt = conn.createStatement();  
        
        stmt.execute(sql);  
        
        stmt.close();  
        conn.close(); 
	}


    public static List<PageData> findList(String sql) throws Exception{
        // 获取到连接
        System.out.println(sql);
        Connection conn = getMySQLConnection();
        PreparedStatement pst = null;
        // 定义一个list用于接受数据库查询到的内容
        List<PageData> list = new ArrayList<PageData>();
        try {
            pst = (PreparedStatement) conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();


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
        } catch (Exception e) {
            throw e;
        }
        return list;
    }



    /**
     * @param savePath 备份的路径
     * @param fileName 备份的文件名
     *                     mysqldump -h127.0.0.1 -uroot -pRoot@123 waxt > d:/waxt.sql  ---备份test数据库到 D 盘
     * @return
     */
    public static boolean backup(String savePath, String fileName) {
        fileName +=".sql";
        File saveFile = new File(savePath);
        if (!saveFile.exists()) {// 如果目录不存在
            saveFile.mkdirs();// 创建文件夹
        }
        if (!savePath.endsWith(File.separator)) {
            savePath = savePath + File.separator;
        }

        //拼接命令行的命令
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("mysqldump").append(" --opt").append(" -h").append(hostIP);
        stringBuilder.append(" --user=").append(userName).append(" --password=").append(password)
                .append(" --lock-all-tables=true");
        stringBuilder.append(" --result-file=").append(savePath + fileName).append(" --default-character-set=utf8 ")
                .append(databaseName);
        try {
            //调用外部执行exe文件的javaAPI
            System.out.println(stringBuilder.toString());
            Process process = Runtime.getRuntime().exec(stringBuilder.toString());
            if (process.waitFor() == 0) {// 0 表示线程正常终止。
                return true;
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return false;
    }


    /**
     * @param filepath 数据库备份的脚本路径
     * @return
     */
    public static boolean recover(String filepath) {
        //String stmt1 = "mysqladmin -h "+hostIP+" -u "+userName+" -p"+password+" create "+databaseName;
        String stmt2 = "mysql -h "+hostIP+" -u "+userName+" -p "+password+" "+databaseName+" < " + filepath;
        String[] cmd = { "cmd", "/c", stmt2 };
        System.out.println(stmt2);
        try {
            //Runtime.getRuntime().exec(stmt1);
            Runtime.getRuntime().exec(cmd);
            System.out.println("数据已从 " + filepath + " 导入到数据库中");
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }


    public static void main(String[] args) {
        backup("d:/mysqlback","test");
    }


}
