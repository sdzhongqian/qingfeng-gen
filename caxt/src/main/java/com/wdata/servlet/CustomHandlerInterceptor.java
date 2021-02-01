package com.wdata.servlet;

import com.fasterxml.jackson.core.JsonEncoding;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.wdata.base.util.Const;
import com.wdata.base.util.Json;
import com.wdata.base.util.PageData;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

/**
 * Created by 青锋 on 2018-8-19.
 */
public class CustomHandlerInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        String path = request.getServletPath();
        System.out.println(path);

        boolean bol = false;
        if(path.matches(Const.NO_INTERCEPTOR_PATH)){
            bol = true;
        }else {
            HttpSession session = request.getSession();
            PageData user = (PageData) session.getAttribute("loginUser");
            if (user != null) {
                bol = true;
            } else {
                //如果是ajax请求响应头会有x-requested-with
                if (request.getHeader("x-requested-with") != null && request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")) {
                    ServletOutputStream out = response.getOutputStream();
                    Json json = new Json();
                    json.setSuccess(false);
                    json.setUrl(request.getContextPath() + "/system/login/toLogin.do");
                    json.setLoseSession("loseSession");
                    json.setMsg("登录失效，正在跳转。。。");
                    response.setContentType("text/html;charset=utf-8");
                    ObjectMapper objMapper = new ObjectMapper();
                    JsonGenerator jsonGenerator = objMapper.getJsonFactory()
                            .createJsonGenerator(response.getOutputStream(),
                                    JsonEncoding.UTF8);

                    jsonGenerator.writeObject(json);
                    jsonGenerator.flush();
                    jsonGenerator.close();

                    bol = false;
                } else {
                    //登陆过滤
                    PrintWriter out = response.getWriter();
                    out.println("<html>");
                    out.println("<script>");
                    out.println("window.open ('"+request.getContextPath()+"/system/login/toLogin.do','_top')");
                    out.println("</script>");
                    out.println("</html>");
                    bol = false;
                }
            }

        }
        return bol;
    }
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
    }
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
    }
}