package com.mushan.service;

import java.util.List;
import com.mushan.common.pojo.system.SysUserRole;


public interface SysUserRoleService
{


    public List<SysUserRole>List(SysUserRole sysUserRole);

    public SysUserRole query(Long id);

    public int add(SysUserRole sysUserRole);

    public int edit(SysUserRole sysUserRole);

    public int delete(Long id);

}
