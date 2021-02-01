package com.wdata.base.util;

import java.io.Serializable;


/**  
 * @Title: JsonData
 * @ProjectName wdata
 * @Description: TODO
 * @author 青锋
 * @date 2018-8-27 11:08
 */
public class JsonData implements Serializable {

	private static final long serialVersionUID = -4540167775871168514L;

	//编号
	private int code = 0;
	//消息
	private String msg = "";
	//分页数量
	private int count = 0;
	//对象
	private Object data;

	public JsonData() {

	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
}
