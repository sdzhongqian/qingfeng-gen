/**    
 * 文件名：JsonUtil.java    
 *    
 * 版本信息：    
 * 日期：2014-1-6    
 * Copyright 足下 Corporation 2014     
 * 版权所有    
 *    
 */
package com.wdata.base.util;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**  
 * @Title: JsonUtil
 * @ProjectName wdata
 * @Description: Json的转换
 * @author 青锋
 * @date 2018-8-24 11:32
 */
public class JsonUtil {
	
	private static JsonUtil jsonUtil;
	
	/**    
	 * 创建一个新的实例 JsonUtil.    
	 *        
	 */
	public JsonUtil() {
	}
	
	/**    
	 * 创建一个新的实例 JsonUtil.    
	 *        
	 */
	public static JsonUtil getInstance() {
		if(jsonUtil==null) {
            jsonUtil = new JsonUtil();
        }
		return jsonUtil;
	}

	 /** 
     * @param object 
     *             任意对象 
     * @return java.lang.String 
     */    
   public static String objectToJson(Object object) {     
        StringBuilder json = new StringBuilder();     
       if (object == null) {     
            json.append("\"\"");     
        } else if (object instanceof String || object instanceof Integer) {   
            json.append("\"").append(object.toString()).append("\"");    
        } else {     
            json.append(beanToJson(object));     
        }     
       return json.toString();     
    }     
   
   /** 
     * 功能描述:传入任意一个 javabean 对象生成一个指定规格的字符串 
     * 
     * @param bean 
     *             bean对象 
     * @return String 
     */    
   public static String beanToJson(Object bean) {     
        StringBuilder json = new StringBuilder();     
        json.append("{");     
        PropertyDescriptor[] props = null;     
       try {     
            props = Introspector.getBeanInfo(bean.getClass(), Object.class)     
                    .getPropertyDescriptors();     
        } catch (IntrospectionException e) {     
        }     
       if (props != null) {     
           for (int i = 0; i < props.length; i++) {     
               try {    
                    String name = objectToJson(props[i].getName());     
                    String value = objectToJson(props[i].getReadMethod().invoke(bean));    
                    json.append(name);     
                    json.append(":");     
                    json.append(value);     
                    json.append(",");    
                } catch (Exception e) {     
                }     
            }     
            json.setCharAt(json.length() - 1, '}');     
        } else {     
            json.append("}");     
        }     
       return json.toString();     
    }     
   
   /** 
     * 功能描述:通过传入一个列表对象,调用指定方法将列表中的数据生成一个JSON规格指定字符串 
     * 
     * @param list 
     *             列表对象 
     * @return java.lang.String 
     */    
   public static String listToJson(List<?> list) {     
        StringBuilder json = new StringBuilder();     
        json.append("[");     
       if (list != null && list.size() > 0) {     
           for (Object obj : list) {     
                json.append(objectToJson(obj));     
                json.append(",");     
            }     
            json.setCharAt(json.length() - 1, ']');     
        } else {     
            json.append("]");     
        }     
       return json.toString();     
    }



    public static List<PageData> parseJSON2List(String jsonStr){
        JSONArray jsonArr = JSONArray.fromObject(jsonStr);
        List<PageData> list = new ArrayList<PageData>();
        Iterator<JSONObject> it = jsonArr.iterator();
        while(it.hasNext()){
            JSONObject json2 = it.next();
            list.add(parseJSON2Pd(json2.toString()));
        }
        return list;
    }

    public static PageData parseJSON2Pd(String jsonStr){
        PageData pd = new PageData();
        //最外层解析
        JSONObject json = JSONObject.fromObject(jsonStr);
        for(Object k : json.keySet()){
            Object v = json.get(k);
            //如果内层还是数组的话，继续解析
            if(v instanceof JSONArray){
                List<PageData> list = new ArrayList<PageData>();
                Iterator<JSONObject> it = ((JSONArray)v).iterator();
                while(it.hasNext()){
                    JSONObject json2 = it.next();
                    list.add(parseJSON2Pd(json2.toString()));
                }
                pd.put(k.toString(), list);
            } else {
                pd.put(k.toString(), v);
            }
        }
        return pd;
    }


    public static String fromArray(List<PageData> list){
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		JSONArray json =JSONArray.fromObject(list, jsonConfig);
		return json.toString();
	}
}
