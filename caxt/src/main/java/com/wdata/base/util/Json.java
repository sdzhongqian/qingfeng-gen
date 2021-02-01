package com.wdata.base.util;

import java.io.Serializable;

/**  
 * @Title: Json
 * @ProjectName wdata
 * @Description: JSON工具类
 * @author 青锋
 * @date 2018-8-24 11:32
 */
public class Json implements Serializable {

	private static final long serialVersionUID = -4540167775871168514L;
	
	private boolean success = false;
	private String msg = "";
	private Object myobject;
	private String sessionId = "";
	private boolean verifySessionId = false;
	private String flag="";
	//分页数量
	private int count = 0;
	//对象
	private Object data;
	private int code;
	private String url;
	private String loseSession;

	public Json() {

	}

	public Json(boolean success, Object myobject, String sessionId, int code) {
		this.success = success;
		this.msg = "";
		this.myobject = myobject;
		this.sessionId = sessionId;
		this.flag = "";
		this.code = code;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getMyobject() {
		return myobject;
	}

	public void setMyobject(Object myobject) {
		this.myobject = myobject;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public boolean isVerifySessionId() {
		return verifySessionId;
	}

	public void setVerifySessionId(boolean verifySessionId) {
		this.verifySessionId = verifySessionId;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}


	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getLoseSession() {
		return loseSession;
	}

	public void setLoseSession(String loseSession) {
		this.loseSession = loseSession;
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
