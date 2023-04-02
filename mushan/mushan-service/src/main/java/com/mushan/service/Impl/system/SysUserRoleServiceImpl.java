package com.mushan.service.impl.system;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mushan.dao.system.SysUserRoleDao;
import com.mushan.common.pojo.system.SysUserRole;
import com.mushan.service.SysUserRoleService;


@Service
public class SysUserRoleServiceImpl implements SysUserRoleService
{
    @Autowired
    private SysUserRoleDao sysUserRoleDao;

    @Override
    public List<SysUserRole>List(SysUserRole sysUserRole){
        return  sysUserRoleDao.list(sysUserRole);
    }

    @Override
    public SysUserRole query(Long id){
        return sysUserRoleDao.query(id);
    }

    @Override
    public int add(SysUserRole sysUserRole){
       return sysUserRoleDao.add(sysUserRole);
    }

    @Override
    public int edit(SysUserRole sysUserRole){
        return sysUserRoleDao.edit(sysUserRole);
    }

    @Override
    public int delete(Long id){
        return sysUserRoleDao.delete(id);
    }

}
