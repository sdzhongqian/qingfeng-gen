package com.wdata.base.util;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.request.async.DeferredResult;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import static com.google.common.base.Predicates.or;
import static springfox.documentation.builders.PathSelectors.regex;

/**  
 * @Title: SwaggerConfig
 * @ProjectName wdata
 * @Description: SwaggerConfig接口
 * @author 青锋
 * @date 2018-8-24 11:39
 */
@Configuration
@EnableSwagger2
public class SwaggerConfig {

    /**
     * SpringBoot默认已经将classpath:/META-INF/resources/和classpath:/META-INF/resources/webjars/映射
     * 所以该方法不需要重写，如果在SpringMVC中，可能需要重写定义（我没有尝试）
     * 重写该方法需要 extends WebMvcConfigurerAdapter
     *
     */
//    @Override
//    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        registry.addResourceHandler("swagger-ui.html")
//                .addResourceLocations("classpath:/META-INF/resources/");
//
//        registry.addResourceHandler("/webjars/**")
//                .addResourceLocations("classpath:/META-INF/resources/webjars/");
//    }

    /** 
     * @Description: idiomApi 
     * @Param: [] 
     * @return: springfox.documentation.spring.web.plugins.Docket 
     * @Author: 青锋
     * @Date: 2018-8-24 11:44 
     */ 
    @Bean
    public Docket idiomApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .groupName("idiom")
                .genericModelSubstitutes(DeferredResult.class)
//                .genericModelSubstitutes(ResponseEntity.class)
                .useDefaultResponseMessages(false)
                .forCodeGeneration(true)
                .pathMapping("/")// base，最终调用接口后会和paths拼接在一起
                .select()
                .paths(or(regex("/idiom/.*")))//过滤的接口
                .build()
                .apiInfo(idiomApiInfo());
    }

    /** 
     * @Description: signinApi 
     * @Param: [] 
     * @return: springfox.documentation.spring.web.plugins.Docket 
     * @Author: 青锋
     * @Date: 2018-8-24 11:44 
     */ 
    @Bean
    public Docket signinApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .groupName("signin")
                .genericModelSubstitutes(DeferredResult.class)
//                .genericModelSubstitutes(ResponseEntity.class)
                .useDefaultResponseMessages(false)
                .forCodeGeneration(true)
                .pathMapping("/")// base，最终调用接口后会和paths拼接在一起
                .select()
                .paths(or(regex("/signin/.*")))//过滤的接口
                .build()
                .apiInfo(signinApiInfo());
    }

    /** 
     * @Description: wxamApi
     * @Param: [] 
     * @return: springfox.documentation.spring.web.plugins.Docket 
     * @Author: 青锋
     * @Date: 2018-8-24 11:44 
     */ 
    @Bean
    public Docket wxamApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .groupName("wxam")
                .genericModelSubstitutes(DeferredResult.class)
//              .genericModelSubstitutes(ResponseEntity.class)
                .useDefaultResponseMessages(false)
                .forCodeGeneration(false)
                .pathMapping("/")
                .select()
                .paths(or(regex("/wxam/.*")))//过滤的接口
                .build()
                .apiInfo(wxamApiInfo());
    }

    /** 
     * @Description: idiomApiInfo 
     * @Param: [] 
     * @return: springfox.documentation.service.ApiInfo 
     * @Author: 青锋
     * @Date: 2018-8-24 11:44 
     */ 
    private ApiInfo idiomApiInfo() {
        ApiInfo apiInfo = new ApiInfo("成语接口",//大标题
                "成语公共服务接口",//小标题
                "0.1",//版本
                "NO terms of service",
                "964754975@qq.com",//作者
                "The Apache License, Version 2.0",//链接显示文字
                "http://www.apache.org/licenses/LICENSE-2.0.html"//网站链接
        );

        return apiInfo;
    }

    /** 
     * @Description: signinApiInfo 
     * @Param: [] 
     * @return: springfox.documentation.service.ApiInfo 
     * @Author: 青锋
     * @Date: 2018-8-24 11:44 
     */ 
    private ApiInfo signinApiInfo() {
        ApiInfo apiInfo = new ApiInfo("签到接口",//大标题
                "签到公共服务接口",//小标题
                "0.1",//版本
                "NO terms of service",
                "964754975@qq.com",//作者
                "The Apache License, Version 2.0",//链接显示文字
                "http://www.apache.org/licenses/LICENSE-2.0.html"//网站链接
        );

        return apiInfo;
    }

    /** 
     * @Description: wxamApiInfo
     * @Param: [] 
     * @return: springfox.documentation.service.ApiInfo 
     * @Author: 青锋
     * @Date: 2018-8-24 11:44 
     */ 
    private ApiInfo wxamApiInfo() {
        ApiInfo apiInfo = new ApiInfo("Electronic Health Record(EHR) Platform API",//大标题
                "云融题库服务端口API",//小标题
                "1.0",//版本
                "NO terms of service",
                "964754975@qq.com",//作者
                "The Apache License, Version 2.0",//链接显示文字
                "http://www.apache.org/licenses/LICENSE-2.0.html"//网站链接
        );
        return apiInfo;
    }
}