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
import com.mushan.common.pojo.system.SysRole;
import com.mushan.service.SysRoleService;
import com.mushan.common.utils.PageUtils;


@RestController
@RequestMapping("/system/role")
public class SysRoleController
{
    @Autowired
    private SysRoleService sysRoleService;

    /**
    * 查询列表
* @return
*/
    @PreAuthorize("hasAnyAuthority('system:role:list')")
    @GetMapping("/list")
    public Object list(SysRole sysRole)
    {
        PageUtils.start();
        List<SysRole> list = sysRoleService.List(sysRole);
        return ResponseUtils.table(list);
    }


    /**
    * 通过id 查询
* @return
*/
    @PreAuthorize("hasAnyAuthority('system:role:query')")
    @GetMapping(value = "/{id}")
    public Object query(@PathVariable("id") Long id)
    {
        return ResponseUtils.ok(sysRoleService.query(id));
    }

    /**
     * 新增
     */
    @PreAuthorize("hasAnyAuthority('system:role:add')")
    @PostMapping
    public Object add(@RequestBody SysRole sysRole)
    {
        return ResponseUtils.ok(sysRoleService.add(sysRole));
    }

    /**
     * 修改
     */
    @PreAuthorize("hasAnyAuthority('system:role:edit')")
    @PutMapping
    public Object edit(@RequestBody SysRole sysRole)
    {
        return ResponseUtils.ok(sysRoleService.edit(sysRole));
    }

    /**
     * 删除
     */
    @PreAuthorize("hasAnyAuthority('system:role:remove')")
	@DeleteMapping("/{id}")
    public Object delete(@PathVariable("id") Long id)
    {
        return ResponseUtils.ok(sysRoleService.delete(id));
    }


//    @PreAuthorize("hasAnyAuthority('system:role:roles')")
    @GetMapping("/roles")
    public Object roles(){
        return ResponseUtils.ok(sysRoleService.roles());
    }

}
