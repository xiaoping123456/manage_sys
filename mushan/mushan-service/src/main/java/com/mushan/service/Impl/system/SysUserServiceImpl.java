package com.mushan.service.impl.system;

import java.util.List;

import com.mushan.common.pojo.system.SysUserRole;
import com.mushan.dao.system.SysUserRoleDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mushan.dao.system.SysUserDao;
import com.mushan.common.pojo.system.SysUser;
import com.mushan.service.SysUserService;


@Service
public class SysUserServiceImpl implements SysUserService
{
    @Autowired
    private SysUserDao sysUserDao;
    @Autowired
    private SysUserRoleDao sysUserRoleDao;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public List<SysUser>List(SysUser sysUser){
        return  sysUserDao.list(sysUser);
    }

    @Override
    public SysUser query(Long id){
        return sysUserDao.query(id);
    }

    @Override
    public int add(SysUser sysUser){
        sysUser.setPassword(passwordEncoder.encode(sysUser.getPassword()));
        sysUserDao.add(sysUser);
        SysUserRole sysUserRole = new SysUserRole();
        sysUserRole.setUserId(sysUser.getId());
        sysUserRole.setRoleId(sysUser.getRole());
        return  sysUserRoleDao.add(sysUserRole);
    }

    @Override
    public int edit(SysUser sysUser){
        SysUserRole userRole = sysUserRoleDao.selectByUid(sysUser.getId());
        userRole.setRoleId(sysUser.getRole());
        sysUserRoleDao.edit(userRole);
        return sysUserDao.edit(sysUser);
    }

    @Override
    public int delete(Long id){
        return sysUserDao.delete(id);
    }

}
