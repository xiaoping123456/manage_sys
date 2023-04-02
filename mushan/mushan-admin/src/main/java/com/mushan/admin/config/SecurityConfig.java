package com.mushan.admin.config;

import com.mushan.admin.filter.MyAccessDeniedHandler;
import com.mushan.admin.filter.MyAuthenticationEntryPoint;
import com.mushan.admin.filter.myJwtAuthenticationTokenFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.BeanIds;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.DefaultSecurityFilterChain;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import javax.servlet.Filter;
import java.util.ArrayList;
import java.util.List;

@Configuration
@EnableWebSecurity // 原先的配置
@EnableGlobalMethodSecurity(prePostEnabled = true)  // 注解
public class SecurityConfig {

    @Autowired
    private MyAccessDeniedHandler accessDeniedHandler;
    @Autowired
    private MyAuthenticationEntryPoint authenticationEntryPoint;
    @Autowired
    private myJwtAuthenticationTokenFilter myJwtAutowiredEncoder;
    @Autowired
    private UserDetailsService userDetailsService;
    @Autowired
    private PasswordEncoder passwordEncoder;

    private static final String[] URL_WHITELIST = {
            "/captchaImage",
            "/user/login"
    };

    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }


    @Autowired
    private AuthenticationConfiguration authenticationConfiguration;

    @Bean
    public AuthenticationManager authenticationManager() throws Exception{
        AuthenticationManager authenticationManager = authenticationConfiguration.getAuthenticationManager();
        return authenticationManager;
    }


    //如果想好看
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

                //过滤器配置
        http.addFilterBefore(myJwtAutowiredEncoder, UsernamePasswordAuthenticationFilter.class);

        //允许跨域 并关闭防护
        http.cors().and().csrf().disable();

        //异常处理
        http.exceptionHandling().accessDeniedHandler(accessDeniedHandler).authenticationEntryPoint(authenticationEntryPoint);


        //全局禁用session
        http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);

        //请求拦截
        http.authorizeRequests().antMatchers(URL_WHITELIST).permitAll().anyRequest().authenticated();

        //禁用缓存 全局使用json
        http.headers().cacheControl();

        return http.build();
    }}


//    @Bean(name = BeanIds.AUTHENTICATION_MANAGER)
//    @Override
//    public AuthenticationManager authenticationManagerBean() throws Exception {
//        return super.authenticationManagerBean();
//    }
//
//
//
//    @Override
//    public void configure(WebSecurity web) throws Exception {
//        web.ignoring().antMatchers(
////                "/html"
//        );
//    }
//
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//        //过滤器配置
//        http.addFilterBefore(myJwtAutowiredEncoder, UsernamePasswordAuthenticationFilter.class);
//
//        //允许跨域 并关闭防护
//        http.cors().and().csrf().disable();
//
//        //异常处理
//        http.exceptionHandling().accessDeniedHandler(accessDeniedHandler).authenticationEntryPoint(authenticationEntryPoint);
//
//
//        //全局禁用session
//        http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);
//
//        //请求拦截
//        http.authorizeRequests().antMatchers(URL_WHITELIST).permitAll().anyRequest().authenticated();
//
//        //禁用缓存 全局使用json
//        http.headers().cacheControl();
//
//    }
//
//
//    @Override
//    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder);
//    }










