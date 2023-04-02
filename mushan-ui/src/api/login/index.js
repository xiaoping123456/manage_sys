import request from '@/utils/request'

// 获取二维码数据
export function getcode() {
    return request({
      url: '/captchaImage',
      method: 'get',
    })
  }
  //登录
export function login(data) {
    return request({
        url: '/user/login',
        method: 'post',
        data:data
    })
}