package com.mushan.service.impl.sys;

import com.mushan.common.Exception.CaptchaExpireException;
import com.mushan.common.pojo.sys.LonginUser;
import com.mushan.common.utils.CacheConstants;
import com.mushan.common.utils.JwtUtils;
import com.mushan.dao.sys.LoginDao;
import com.mushan.service.LoginService;
import com.mushan.service.SysUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service
public class LoginServiceImpl implements LoginService {
    @Autowired
    private LoginDao sysUserDao;
    @Autowired
    private RedisTemplate<String,Object> redisTemplate;

    @Resource
    private AuthenticationManager authenticationManager;
    @Autowired
    private JwtUtils jwtUtils;



    //获取token
    @Override
    public String login(Map<String, String> map) {
        String uuid = map.get("uuid");
        String username = map.get("username");
        String password = map.get("password");
        String code = map.get("code");
        /**
         * 通过uuid 从redis中查询到code做比对
         */

        String captcha = (String) redisTemplate.opsForValue().get(CacheConstants.CAPTCHA_CODE_KEY + uuid);
        if (StringUtils.isNotBlank(captcha)){
            if (!captcha.equals(code)){
                throw new CaptchaExpireException();
            }
        }else {
            throw new CaptchaExpireException();
        }

        Authentication authentication=  authenticationManager
                    .authenticate(new UsernamePasswordAuthenticationToken(username, password));
        LonginUser user = (LonginUser) authentication.getPrincipal();
        return jwtUtils.generatorToken(user);
    }
}
