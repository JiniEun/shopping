package com.study.shop;
 
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
 
@Configuration
public class MVCConfiguration implements WebMvcConfigurer {
  @Override
  public void addInterceptors(InterceptorRegistry registry) {
 
// URL에 "/admin/"이 들어간 요청은 AdminInterceptor 작동함.
    registry.addInterceptor(new AdminInterceptor()).addPathPatterns("/admin/**");
 
  }
}