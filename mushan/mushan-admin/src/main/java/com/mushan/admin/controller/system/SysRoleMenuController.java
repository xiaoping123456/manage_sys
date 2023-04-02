package com.mushan.admin.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.mushan.common.utils.ResponseUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.mushan.common.pojo.system.SysRoleMenu;
import com.mushan.service.SysRoleMenuService;
import com.mushan.common.utils.PageUtils;


@RestController
@RequestMapping("/system/role/menu")
public class SysRoleMenuController
{
    @Autowired
    private SysRoleMenuService sysRoleMenuService;

    /**
    * 查询列表
* @return
*/
    @PreAuthorize("hasAnyAuthority('system:menu:list')")
    @GetMapping("/list")
    public Object list(SysRoleMenu sysRoleMenu)
    {
        PageUtils.start();
        List<SysRoleMenu> list = sysRoleMenuService.List(sysRoleMenu);
        return ResponseUtils.table(list);
    }


    /**
    * 通过id 查询
* @return
*/
    @PreAuthorize("hasAnyAuthority('system:menu:query')")
    @GetMapping(value = "/{id}")
    public Object query(@PathVariable("id") Long id)
    {
        return ResponseUtils.ok(sysRoleMenuService.query(id));
    }

    /**
     * 新增
     */
    @PreAuthorize("hasAnyAuthority('system:menu:add')")
    @PostMapping
    public Object add(@RequestBody SysRoleMenu sysRoleMenu)
    {
        return ResponseUtils.ok(sysRoleMenuService.add(sysRoleMenu));
    }

    /**
     * 修改
     */
    @PreAuthorize("hasAnyAuthority('system:menu:edit')")
    @PutMapping
    public Object edit(@RequestBody SysRoleMenu sysRoleMenu)
    {
        return ResponseUtils.ok(sysRoleMenuService.edit(sysRoleMenu));
    }

    /**
     * 删除
     */
    @PreAuthorize("hasAnyAuthority('system:menu:remove')")
	@DeleteMapping("/{id}")
    public Object delete(@PathVariable("id") Long id)
    {
        return ResponseUtils.ok(sysRoleMenuService.delete(id));
    }
}
