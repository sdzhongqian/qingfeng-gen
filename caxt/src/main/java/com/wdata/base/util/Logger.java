package com.wdata.base.util;


/**  
 * @Title: Logger
 * @ProjectName wdata
 * @Description: 日志
 * @author 青锋
 * @date 2018-8-24 11:32
 */
public class Logger {

	private org.apache.log4j.Logger logger;

	
	/**
	 * @Description: 构造方法，初始化Log4j的日志对象
	 * @Param: [log4jLogger]
	 * @return:
	 * @Author:
	 * @Date:
	 */
	private Logger(org.apache.log4j.Logger log4jLogger) {
		logger = log4jLogger;
	}

	/** 
	 * @Description: 获取构造器，根据类初始化Logger对象 
	 * @Param: [classObject] 
	 * @return: com.wdata.base.util.Logger 
	 * @Author: 青锋
	 * @Date: 2018-8-24 11:48 
	 */ 
	public static Logger getLogger(Class classObject) {
		return new Logger(org.apache.log4j.Logger.getLogger(classObject));
	}

	/** 
	 * @Description: 获取构造器，根据类名初始化Logger对象
	 * @Param: [loggerName] 
	 * @return: com.wdata.base.util.Logger 
	 * @Author: 青锋
	 * @Date: 2018-8-24 12:57
	 */ 
	public static Logger getLogger(String loggerName) {
		return new Logger(org.apache.log4j.Logger.getLogger(loggerName));
	}

	public void debug(Object object) {
		logger.debug(object);
	}

	public void debug(Object object, Throwable e) {
		logger.debug(object, e);
	}

	public void info(Object object) {
		logger.info(object);
	}

	public void info(Object object, Throwable e) {
		logger.info(object, e);
	}

	public void warn(Object object) {
		logger.warn(object);
	}

	public void warn(Object object, Throwable e) {
		logger.warn(object, e);
	}

	public void error(Object object) {
		logger.error(object);
	}

	public void error(Object object, Throwable e) {
		logger.error(object, e);
	}

	public void fatal(Object object) {
		logger.fatal(object);
	}

	public String getName() {
		return logger.getName();
	}

	public org.apache.log4j.Logger getLog4jLogger() {
		return logger;
	}

	public boolean equals(Logger newLogger) {
		return logger.equals(newLogger.getLog4jLogger());
	}
}