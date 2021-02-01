package com.wdata.base.util;

import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**  
 * @Title: FileUtil
 * @ProjectName wdata
 * @Description: 附件下载类
 * @author 青锋
 * @date 2018-8-24 11:31
 */
public class FileUtil {
	
	private static final int BUFFERED_SIZE = 4 * 1024;
	
	/**
	 * 下载文件
	 */
	public static void downFile(HttpServletResponse response, String filePath,
								String filename) throws Exception {
		File tempFile = new File(filePath);
		if (tempFile.exists()) {
			response.reset();
			response.setContentType("bin");//
			filename = new String(filename.getBytes(), "ISO-8859-1");
			response.addHeader("Content-Disposition", "attachment;filename="
					+ filename);
			FileInputStream fis = new FileInputStream(tempFile);
			OutputStream os = response.getOutputStream();
			byte[] bb = new byte[1024*8];
			int i = 0;
			while ((i = fis.read(bb)) > 0) {
				os.write(bb, 0, i);
			}
			os.close();
			os.flush();
			fis.close();
		}
	}
	
	/**
	 * 复制文件
	 * @param src
	 * @param target
	 */
	public static void copy(File src, File target) {
        InputStream in = null;
        OutputStream out = null;
        try {
            in = new BufferedInputStream(new FileInputStream(src), BUFFERED_SIZE);
            out = new BufferedOutputStream(new FileOutputStream(target), BUFFERED_SIZE);
            byte[] bs = new byte[BUFFERED_SIZE];
            int i;
            while ((i = in.read(bs)) > 0) {
                out.write(bs, 0, i);
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (in != null){
					in.close();
				}
                if (out != null){
					out.close();
				}
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
	
	/**保存文件
     * @param stream
     * @param path
     * @param filename
     * @throws IOException
     */
    public static void SaveFileFromInputStream(InputStream stream,String path,String filename) throws IOException
    {      
        FileOutputStream fs=new FileOutputStream( path + "/"+ filename);
        byte[] buffer =new byte[1024*1024];
        int bytesum = 0;
        int byteread = 0; 
        while ((byteread=stream.read(buffer))!=-1)
        {
           bytesum+=byteread;
           fs.write(buffer,0,byteread);
           fs.flush();
        } 
        fs.close();
        stream.close();      
    }  
	
	
	
	
	
	
	
	public static void main(String[] args) {
		// 创建目录
	   String dirName = "d:/FHSysPicture/topic/";
	   FileUtil.createDir(dirName);
	}
	
	/**
	* 创建目录
	* @param destDirName 目标目录名
	* @return 目录创建成功返回true，否则返回false
	*/
	public static boolean createDir(String destDirName) {
		File dir = new File(destDirName);
		if(dir.exists()) {
			return false;
		}
		if(!destDirName.endsWith(File.separator)){
			destDirName = destDirName + File.separator;
		}
		// 创建单个目录
		if(dir.mkdirs()) {
			return true;
		} else {
			return false;
		}
	}
	
	/**  
     *  删除文件  
     *  @param  filePathAndName  String  文件路径及名称  如c:/fqf.txt  
     *  @return  boolean
     */
   public static void delFile(String  filePathAndName)  {  
       try  {  
           String  filePath  =  filePathAndName;  
           filePath  =  filePath.toString();  
           File  myDelFile  =  new  File(filePath);
           myDelFile.delete();  
 
       }  
       catch  (Exception  e)  {  
           System.out.println("删除文件操作出错");  
           e.printStackTrace();  
 
       }  
 
   }

}