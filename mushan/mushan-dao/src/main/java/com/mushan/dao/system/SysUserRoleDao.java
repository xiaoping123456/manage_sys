package com.mushan.dao.system;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.mushan.common.pojo.system.SysUserRole;
import org.apache.ibatis.annotations.Param;


public interface SysUserRoleDao extends BaseMapper<SysUserRole> {


    public List<SysUserRole> list(SysUserRole sysUserRole);

    public SysUserRole query(Long id);

    public int add(SysUserRole sysUserRole);

    public int edit(SysUserRole sysUserRole);

    public int delete(Long id);

    SysUserRole selectByUid(Long id);
}
