package com.mushan.service;

import java.util.List;
import com.mushan.common.pojo.system.SysUser;


public interface SysUserService
{


    public List<SysUser>List(SysUser sysUser);

    public SysUser query(Long id);

    public int add(SysUser sysUser);

    public int edit(SysUser sysUser);

    public int delete(Long id);

}
