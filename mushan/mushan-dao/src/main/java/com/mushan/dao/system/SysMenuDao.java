package com.mushan.dao.system;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.mushan.common.pojo.system.SysMenu;

public interface SysMenuDao extends BaseMapper<SysMenu> {


    public List<SysMenu> list(SysMenu sysMenu);

    public SysMenu query(Long id);

    public int add(SysMenu sysMenu);

    public int edit(SysMenu sysMenu);

    public int delete(Long id);

    List<SysMenu> getRouters(Long id);
}
