package com.han.S20210901.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.han.S20210901.service.EmpStateInterceptor;
import com.han.S20210901.service.LoginInterceptor;

@Configuration
public class WebMvcConfing implements WebMvcConfigurer{
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		LoginInterceptor loginInterceptor = new LoginInterceptor();
		registry.addInterceptor(loginInterceptor).addPathPatterns(loginInterceptor.loginNeed).excludePathPatterns(loginInterceptor.loginNoNeed);
		
		EmpStateInterceptor empStateInterceptor = new EmpStateInterceptor();
		registry.addInterceptor(empStateInterceptor).addPathPatterns(empStateInterceptor.empNeed).excludePathPatterns(empStateInterceptor.empNoNeed);
	}
}
