package com.mushan.service.impl.system;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mushan.dao.system.SysRoleMenuDao;
import com.mushan.common.pojo.system.SysRoleMenu;
import com.mushan.service.SysRoleMenuService;


@Service
public class SysRoleMenuServiceImpl implements SysRoleMenuService
{
    @Autowired
    private SysRoleMenuDao sysRoleMenuDao;

    @Override
    public List<SysRoleMenu>List(SysRoleMenu sysRoleMenu){
        return  sysRoleMenuDao.list(sysRoleMenu);
    }

    @Override
    public SysRoleMenu query(Long id){
        return sysRoleMenuDao.query(id);
    }

    @Override
    public int add(SysRoleMenu sysRoleMenu){
       return sysRoleMenuDao.add(sysRoleMenu);
    }

    @Override
    public int edit(SysRoleMenu sysRoleMenu){
        return sysRoleMenuDao.edit(sysRoleMenu);
    }

    @Override
    public int delete(Long id){
        return sysRoleMenuDao.delete(id);
    }

}
