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
import com.mushan.common.pojo.system.SysUser;
import com.mushan.service.SysUserService;
import com.mushan.common.utils.PageUtils;


@RestController
@RequestMapping("/system/user")
public class SysUserController
{
    @Autowired
    private SysUserService sysUserService;

    /**
    * 查询列表
* @return
*/
    @PreAuthorize("hasAnyAuthority('system:user:list')")
    @GetMapping("/list")
    public Object list(SysUser sysUser)
    {
        PageUtils.start();
        List<SysUser> list = sysUserService.List(sysUser);
        return ResponseUtils.table(list);
    }


    /**
    * 通过id 查询
* @return
*/
    @PreAuthorize("hasAnyAuthority('system:user:query')")
    @GetMapping(value = "/{id}")
    public Object query(@PathVariable("id") Long id)
    {
        return ResponseUtils.ok(sysUserService.query(id));
    }

    /**
     * 新增
     */
    @PreAuthorize("hasAnyAuthority('system:user:add')")
    @PostMapping
    public Object add(@RequestBody SysUser sysUser)
    {
        return ResponseUtils.ok(sysUserService.add(sysUser));
    }

    /**
     * 修改
     */
    @PreAuthorize("hasAnyAuthority('system:user:edit')")
    @PutMapping
    public Object edit(@RequestBody SysUser sysUser)
    {
        return ResponseUtils.ok(sysUserService.edit(sysUser));
    }

    /**
     * 删除
     */
    @PreAuthorize("hasAnyAuthority('system:user:remove')")
	@DeleteMapping("/{id}")
    public Object delete(@PathVariable("id") Long id)
    {
        return ResponseUtils.ok(sysUserService.delete(id));
    }
}
