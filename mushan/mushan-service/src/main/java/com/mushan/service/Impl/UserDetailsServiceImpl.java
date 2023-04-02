package com.mushan.service.impl;

import com.mushan.common.pojo.sys.LonginUser;
import com.mushan.dao.sys.LoginDao;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.Map;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private LoginDao sysUserDao;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        //通过用户名查询用户信息
        if (StringUtils.isEmpty(username)){
            throw new UsernameNotFoundException("用户名未填写");
        }
        LonginUser longinUser = sysUserDao.queryUserByUserName(username);

        longinUser.setAuthorities(power(longinUser.getId()));
        return longinUser;
        //return new User(user.get("user_name").toString(),user.get("password").toString(),power(Long.valueOf(user.get("id").toString())));
    }

    private List<GrantedAuthority> power(Long id) {
        //通过用户id查询权限信息
       List<String> powers =  sysUserDao.getPower(id);
        return AuthorityUtils.commaSeparatedStringToAuthorityList(String.join(",",powers));
    }

}
