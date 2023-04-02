//获取角色信息
import request from '@/utils/request'


export function roles() {
    return request({
        url: '/system/role/roles',
        method: 'get',
    })
}

//获取角色信息
export function getroles(data) {
    return request({
        url: '/system/role/list',
        method: 'get',
        params:data
    })
}

//添加角色
export function addrole(data) {
    return request({
        url: '/system/role',
        method: 'post',
        data:data
    })
}

//查询
export function queryrole(id) {
    return request({
        url: '/system/role/'+id,
        method: 'get'
    })
}

//修改角色
export function editrole(data) {
    return request({
        url: '/system/role',
        method: 'put',
        data:data,
    })
}

//删除
export function deleterole(id) {
    return request({
        url: '/system/role/'+id,
        method: 'delete',
    })
}