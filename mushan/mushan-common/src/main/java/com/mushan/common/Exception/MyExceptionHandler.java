package com.mushan.common.Exception;

import com.mushan.common.utils.ResponseUtils;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletRequest;

@RestControllerAdvice
public class MyExceptionHandler {


    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public Object exceptionHandler(HttpServletRequest req, Exception e){
        e.printStackTrace();
        if (e instanceof CaptchaExpireException){
            return ResponseUtils.captcha();
        }else if (e instanceof BadCredentialsException ||e instanceof InternalAuthenticationServiceException){
            return ResponseUtils.username();
        }else if (e instanceof AccessDeniedException){
            return ResponseUtils.unauthz();
        }
        else {
            return ResponseUtils.fail(-1,e.getMessage());
        }
    }

}
