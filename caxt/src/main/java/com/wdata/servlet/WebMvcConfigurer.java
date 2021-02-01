package com.wdata.servlet;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * 拦截器
 * Created by 青锋 on 2018-8-19.
 */
@Configuration
public class WebMvcConfigurer extends WebMvcConfigurerAdapter {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
//注册拦截器 拦截规则
//多个拦截器时 以此添加 执行顺序按添加顺序
        registry.addInterceptor(getHandlerInterceptor()).addPathPatterns("/**/*.do*").addPathPatterns("/");

        registry.addInterceptor(getMobileHandlerInterceptor()).addPathPatterns("/**/*.action*");
    }

    //后台
    @Bean
    public static HandlerInterceptor getHandlerInterceptor() {
        return new CustomHandlerInterceptor();
    }

    //移动端
    @Bean
    public static HandlerInterceptor getMobileHandlerInterceptor() {
        return new MobileHandlerInterceptor();
    }

}