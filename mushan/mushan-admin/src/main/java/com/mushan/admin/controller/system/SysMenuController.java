package com.mushan.admin.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.mushan.common.pojo.sys.LonginUser;
import com.mushan.common.utils.ResponseUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.mushan.common.pojo.system.SysMenu;
import com.mushan.service.SysMenuService;
import com.mushan.common.utils.PageUtils;


@RestController
@RequestMapping("/system/menu")
public class SysMenuController
{
    @Autowired
    private SysMenuService sysMenuService;

    /**
    * 查询列表
    * @return
    */
    @PreAuthorize("hasAnyAuthority('system:menu:list')")
    @GetMapping("/list")
    public Object list(SysMenu sysMenu)
    {
        List<SysMenu> list = sysMenuService.List(sysMenu);
        return ResponseUtils.ok(list);
    }


    /**
    * 通过id 查询
    * @return
    */
    @PreAuthorize("hasAnyAuthority('system:menu:query')")
    @GetMapping(value = "/{id}")
    public Object query(@PathVariable("id") Long id)
    {
        return ResponseUtils.ok(sysMenuService.query(id));
    }

    /**
     * 新增
     */
    @PreAuthorize("hasAnyAuthority('system:menu:add')")
    @PostMapping
    public Object add(@RequestBody SysMenu sysMenu)
    {
        return ResponseUtils.ok(sysMenuService.add(sysMenu));
    }

    /**
     * 修改
     */
    @PreAuthorize("hasAnyAuthority('system:menu:edit')")
    @PutMapping
    public Object edit(@RequestBody SysMenu sysMenu)
    {
        return ResponseUtils.ok(sysMenuService.edit(sysMenu));
    }

    /**
     * 删除
     */
    @PreAuthorize("hasAnyAuthority('system:menu:remove')")
	@DeleteMapping("/{id}")
    public Object delete(@PathVariable("id") Long id)
    {
        return ResponseUtils.ok(sysMenuService.delete(id));
    }


    //通过用户id查询用户的路由信息
    @GetMapping("/getRouters")
    //@PreAuthorize("hasAnyAuthority('system:menu:getRouters')")
    public Object getRouters(){

        return ResponseUtils.ok(sysMenuService.getRouters());
    }


}
