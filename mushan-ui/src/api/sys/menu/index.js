import request from '@/utils/request'

//获取菜单信息
export function menus(data) {
    return request({
        url: '/system/menu/list',
        method: 'get',
        params:data,
    })
}

//添加菜单
export function addmenu(data) {
    return request({
        url:'/system/menu',
        method:'post',
        data:data
    })
}

//修改菜单
export function editmenu(data) {
    return request({
        url:'/system/menu',
        method:'put',
        data:data
    })
}
//删除菜单
export function deletemenu(id) {
    return request({
        url:'/system/menu/'+id,
        method:'delete',
    })
}

