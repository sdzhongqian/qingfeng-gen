/**    
 * 文件名：PageData.java    
 *    
 * 版本信息：    
 * 日期：2014-1-6    
 * Copyright 足下 Corporation 2014     
 * 版权所有    
 *    
 */
package com.wdata.base.util;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.sql.Clob;
import java.sql.SQLException;
import java.util.*;

/**  
 * @Title: PageData
 * @ProjectName wdata
 * @Description: PageData
 * @author 青锋
 * @date 2018-8-24 11:37
 */
public class PageData extends HashMap implements Map{
  private static final long serialVersionUID = 1L;
  Map map = null;
  HttpServletRequest request;
  private static PageData pagedata;
  
  public static PageData getInstance() {
		if(pagedata==null){
           pagedata = new PageData();
        }
		return pagedata;
	}

  public PageData(HttpServletRequest request, String type)
  {
    this.request = request;
    this.map = request.getParameterMap();

    if ("ParameterMap".equals(this.map.getClass().getSimpleName())){
      try
      {
        Method method = this.map.getClass().getMethod("setLocked",
                new Class[] { Boolean.TYPE });
        method.invoke(this.map, new Object[] { new Boolean(false) });
      } catch (Exception e) {
        e.printStackTrace();
      }
    }
  }


public PageData(HttpServletRequest request)
  {
    this.request = request;
    Map properties = request.getParameterMap();
    Map returnMap = new HashMap();
    Iterator entries = properties.entrySet().iterator();

    String name = "";
    String value = "";
    while (entries.hasNext()) {
      Entry entry = (Entry)(Entry)entries.next();
      name = (String)entry.getKey();
      Object valueObj = entry.getValue();
      if (valueObj == null) {
        value = "";
      } else if ((valueObj instanceof String[])) {
        String[] values = (String[])valueObj;
        for (int i = 0; i < values.length; i++) {
          value = values[i] + ",";
        }
        value = value.substring(0, value.length() - 1);
      } else {
        value = valueObj.toString();
      }
      returnMap.put(name, value);
    }
    this.map = returnMap;
  }

  public PageData()
  {
    this.map = new HashMap();
  }

  @Override
  public Object get(Object key)
  {
    Object obj = null;
    if ((this.map.get(key) instanceof Object[])) {
      Object[] arr = (Object[])this.map.get(key);
      obj = 
        this.request.getParameter((String)key) == null ? arr : this.request == null ? arr : 
        arr[0];
    } else {
      obj = this.map.get(key);
    }
    return obj;
  }

  public Number getNumber(Object key)
  {
    Object obj = this.map.get(key);
    if (obj == null){
      return Integer.valueOf(0);
    }
    if ((obj instanceof Number)) {
      Number objNumber = (Number)obj;
      return objNumber;
    }
    return Integer.valueOf(0);
  }

  public String[] getValues(Object key)
  {
    return this.request == null ? null : 
      this.request.getParameterValues((String)key);
  }

  public String getString(Object key)
  {
    Object obj = this.map.get(key);
    if (obj == null) {
      return "";
    }
    if ((obj instanceof String)) {
      return (String)get(key);
    }
    if ((obj instanceof Clob)) {
      Clob objClob = (Clob)obj;
      try {
        return objClob.getSubString(1L, (int)objClob.length());
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
    return "";
  }

  public String getClob(Object key)
    throws Exception
  {
    if (key == null){
      return "";
    }
    Object obj = this.map.get(key);
    if (obj == null){
      return "";
    }
    if ((obj instanceof Clob)) {
      Clob objClob = (Clob)obj;
      try {
        return objClob.getSubString(1L, (int)objClob.length());
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
    return "";
  }

  @Override
  public Object put(Object key, Object value)
  {
    if ((value instanceof Clob)) {
      Clob objClob = (Clob)value;
      try {
        return this.map.put(key, objClob.getSubString(1L, (int)objClob.length()));
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
    return this.map.put(key, value);
  }

  @Override
  public Object remove(Object key)
  {
    return this.map.remove(key);
  }

  @Override
  public void clear() {
    this.map.clear();
  }

  @Override
  public boolean containsKey(Object key)
  {
    return this.map.containsKey(key);
  }

  @Override
  public boolean containsValue(Object value)
  {
    return this.map.containsValue(value);
  }

  @Override
  public Set entrySet()
  {
    return this.map.entrySet();
  }

  @Override
  public boolean isEmpty()
  {
    return this.map.isEmpty();
  }

  @Override
  public Set keySet()
  {
    return this.map.keySet();
  }

  @Override
  public void putAll(Map t)
  {
    this.map.putAll(t);
  }

  @Override
  public int size()
  {
    return this.map.size();
  }

  @Override
  public Collection values()
  {
    return this.map.values();
  }
  
  public String[] getKeys(PageData pd){
	  Set entries = pd.entrySet();
	  String[] str = new String[entries.size()];
	  if (entries != null) {
		  int i = 0;
	      Iterator iterator = entries.iterator();
	      while (iterator.hasNext()) {
	          Entry entry = (Entry) iterator.next();
	          String key = entry.getKey().toString();
	          str[i++] = key;
	      }
	  }
	return str;
  }
  
  public String[] getValues(PageData pd){
	  Set entries = pd.entrySet();
	  String[] str = new String[entries.size()];
	  if (entries != null) {
		  int i = 0;
	      Iterator iterator = entries.iterator();
	      while (iterator.hasNext()) {
	          Entry entry = (Entry) iterator.next();
	          String val = entry.getValue().toString();
	          str[i++] = val;
	      }
	  }
	return str;
  }
  
  public List<String> getValuesForKeyPrefix(PageData pd,String prefix){
	  Set entries = pd.entrySet();
	  
	  List<String> list = new ArrayList<String>();
	  if (entries != null) {
	      Iterator iterator = entries.iterator();
	      while (iterator.hasNext()) {
	          Entry entry = (Entry) iterator.next();
	          String val = entry.getValue().toString();
	          String key = entry.getKey().toString();
	          if(key.startsWith(prefix)){
	        	  list.add(val);
	          }
	      }
	  }
	return list;
  }
  
  
}





























