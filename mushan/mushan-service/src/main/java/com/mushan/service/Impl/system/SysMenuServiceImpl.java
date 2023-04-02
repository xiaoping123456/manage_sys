package com.mushan.service.impl.system;

import java.lang.reflect.Array;
import java.util.*;
import java.util.stream.Collectors;

import com.mushan.common.pojo.sys.LonginUser;
import com.mushan.common.pojo.system.Menu;
import com.mushan.dao.sys.LoginDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.mushan.dao.system.SysMenuDao;
import com.mushan.common.pojo.system.SysMenu;
import com.mushan.service.SysMenuService;


@Service
public class SysMenuServiceImpl implements SysMenuService
{
    @Autowired
    private SysMenuDao sysMenuDao;
    @Autowired
    private LoginDao sysUserDao;

    @Override
    public List<SysMenu>List(SysMenu sysMenu){
        List<SysMenu> list = sysMenuDao.list(sysMenu);
        //获取一级菜单
        List<SysMenu> menus = list.stream().filter(res -> {
            return res.getParentId().equals(0L);
        }).map(res->{
            res.setChildren(getMenusChildren(res,list));
            return res;
        }).collect(Collectors.toList());
        return menus;
    }

    private List<SysMenu> getMenusChildren(SysMenu menu, List<SysMenu> list) {
        return list.stream().filter(res->{
            return res.getParentId().equals(menu.getId());
        }).map(res->{
            res.setChildren(getMenusChildren(res,list));
            return res;
        }).collect(Collectors.toList());
    }
    
    @Override
    public SysMenu query(Long id){
        return sysMenuDao.query(id);
    }

    @Override
    public int add(SysMenu sysMenu){
       return sysMenuDao.add(sysMenu);
    }

    @Override
    public int edit(SysMenu sysMenu){
        return sysMenuDao.edit(sysMenu);
    }

    @Override
    public int delete(Long id){
        return sysMenuDao.delete(id);
    }

    @Override
    public  Map<String,Object> getRouters() {
        LonginUser user = (LonginUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        List<SysMenu> list = sysMenuDao.getRouters(user.getId());
        //layout的子路由集合   前端menus 的list集合
        Map<String,Object> map = new HashMap<>();
        map.put("menus",menus(list));
        map.put("routers",routers(list));
        map.put("titles",titles(list));
        map.put("authorites",sysUserDao.getPower(user.getId()));
        return map;
    }

    private Map<String,List<String>>titles(List<SysMenu> list) {

        //取到所有的id
        Map<Long,SysMenu> menus = new HashMap<>();
        list.forEach(res->{
            if (res != null){
                menus.put(res.getId(),res);
            }
        });

        List<SysMenu> collect = list.stream().filter(res -> {
            return res.getMenuType().equals("C");
        }).collect(Collectors.toList());

        Map<String,List<String>> maplist = gettitles(collect,menus);

        return maplist;
    }

    private  Map<String,List<String>> gettitles(List<SysMenu> collect, Map<Long, SysMenu> menus) {
        Map<String, List<String>> map = new HashMap();
        collect.forEach(res->{
                SysMenu sysMenu = menus.get(res.getParentId());
                if (sysMenu != null){
                    map.put(res.getPath(),Arrays.asList(sysMenu.getMenuName(),res.getMenuName()));
                }
            });
        return map;
    }

    private List<Map<String,Object>> routers(List<SysMenu> list) {
        //首先取到类型为菜单的数据
        List<Map<String,Object>> maps = new ArrayList<>();
        List<SysMenu> menus = list.stream().filter(res -> {
            return res.getMenuType().equals("C");
        }).collect(Collectors.toList());
        menus.forEach(res->{
            Map<String,Object> map = new HashMap<>();
            map.put("path",res.getPath());
            map.put("name",res.getPath());
            map.put("component","../"+res.getComponent()+".vue");
            maps.add(map);
        });
        return maps;
    }

    private  List<Menu> menus(List<SysMenu> list) {
       //获取menus
       List<Menu> menus =  getmenus(list);

       //获取一级
        List<Menu> collect = menus.stream().filter(res -> {
            return res.getParentId().equals(0L);
        }).map(menu -> {
            menu.setUrl(null);
            menu.setChildren(getchildren(menu,menus));
            return menu;
        }).collect(Collectors.toList());
        return collect;
    }

    private List<Menu> getchildren(Menu menu, List<Menu> list) {
        List<Menu> collect = list.stream().filter(res -> {
            return res.getParentId().equals(menu.getId());
        }).map(res -> {
            res.setChildren(getchildren(res,list));
            return res;
        }).collect(Collectors.toList());
        return collect;
    }

    private List<Menu> getmenus(List<SysMenu> list) {
        List<Menu> menus = new ArrayList<>();
        list.forEach(res->{
            Menu menu = new Menu();
            menu.setId(res.getId());
            menu.setParentId(res.getParentId());
            menu.setComponent(res.getComponent());
            menu.setUrl(res.getPath());
            menu.setIcon(res.getIcon());
            menu.setTitle(res.getMenuName());
            menus.add(menu);
        });
        return menus;
    }

}
