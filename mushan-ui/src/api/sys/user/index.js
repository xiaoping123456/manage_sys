import request from '@/utils/request'

//获取用户信息
export function listUser(data) {
    return request({
        url: '/system/user/list',
        method: 'get',
        params:data
    })
}

//添加用户
export function adduser(data) {
    return request({
        url: '/system/user',
        method: 'post',
        data: data
    })
}

//修改用户
export function edituser(data) {
    return request({
        url: '/system/user',
        method: 'put',
        data: data
    })
}

//删除用户
export function deleteuser(id) {
    return request({
        url: '/system/user/'+id,
        method: 'delete'
    })
}