package com.mushan.service;

import java.util.List;
import java.util.Map;

import com.mushan.common.pojo.system.Menu;
import com.mushan.common.pojo.system.SysMenu;


public interface SysMenuService
{


    public List<SysMenu>List(SysMenu sysMenu);

    public SysMenu query(Long id);

    public int add(SysMenu sysMenu);

    public int edit(SysMenu sysMenu);

    public int delete(Long id);

    Map<String,Object> getRouters();
}
