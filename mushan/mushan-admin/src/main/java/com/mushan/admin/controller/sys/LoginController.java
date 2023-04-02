package com.mushan.admin.controller.sys;

import com.mushan.common.utils.ResponseUtils;
import com.mushan.service.LoginService;
import com.mushan.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import java.security.Security;
import java.util.Map;

/**
 * 用户类
 */

@RestController
@RequestMapping("/user")
public class LoginController {
    @Autowired
    private LoginService sysUserService;

    /**
     * 用户登录接口登录成功
     */
    @PostMapping("/login")
    public Object login(@RequestBody Map<String,String> map){
        if (CollectionUtils.isEmpty(map)){
            return ResponseUtils.badArgument();
        }
       String token =  sysUserService.login(map);
        return ResponseUtils.ok(token);
    }





}
