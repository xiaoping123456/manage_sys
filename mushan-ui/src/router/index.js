import { createRouter,createWebHistory} from "vue-router";
import {routerStore} from "@/store/router";
import { nprogress } from '@/utils/nporgress'
import Layout from '@/layout/index.vue'

// 路由信息
const routes = [
    {
        path: "/login",
        name: "login",
        component:  () => import('../views/login/index.vue'),
    },
    {
        path: "",
        name: "layout",
        component:  Layout,
        redirect: 'index',
        children:[
            {
                path:"index",
                name:"Index",
                component:()=>import('../views/index.vue'),
            }
        ]
    },
];

// 创建路由
const router = createRouter({
    // 历史记录模式：HTML5模式，路径不带#
    history: createWebHistory(),
    routes
});

/**
 * 配置全局前置路由守卫
 *      初始化时执行，每次路由切换前执行
 * to：要跳转到的目标路由
 * from：从当前哪个路由进行跳转
 * next：不做任何阻拦，直接通行，该往哪个路由跳转就往哪个跳转
 */
router.beforeEach(((to, from, next) => {
        // 开启进度条
        nprogress.start();
        const userstore = routerStore();
        var token = localStorage.getItem("mushanToken");  //获取token信息
        if (to.name != 'login'){
            // 如果未登录 就跳转到登录页
            if (!token){
                next({name:"login"});
            }else {
                // 如果没有获取路由信息 就获取
                if (!userstore.isrouters){
                    // 获取路由信息
                    userstore.router().then(res=>{
                       let routers =  res.data.routers
                        // 遍历后端响应的结果 添加路由信息
                        routers.forEach(value => {
                            router.addRoute("layout",{
                                path:value.path,
                                name:value.name,
                                component:()=> import(value.component)
                            })
                        })
                        userstore.menus = res.data.menus;
                        userstore.authorites = res.data.authorites;
                        userstore.menus.unshift({
                            url:'index',
                            icon:"House",
                            title:"主页"
                        });
                        userstore.titles = res.data.titles;
                        userstore.isrouters = true;
                        // 如果之前的路由都没有匹配 那么就匹配404的路由
                        router.addRoute( {
                            path: "/:pathMatch(.*)*",
                            name: "404",
                            component: ()=> import("../views/404/404.vue")
                        })
                        // 确保addRoutes已完成
                        //    replace: true   告诉VUE本次操作后，不能通过浏览器后退按钮，返回前一个路由。
                        //    next({ ...to })  如果参数to不能找到对应的路由的话，就再执行一次beforeEach((to, from, next)直到其中的next({
                        //        ...to})能找到对应的路由为止。
                        //        也就是说此时addRoutes()已经完成啦，找到对应的路由之后，接下来将执行前往对应路由的beforeEach((to, from, next)
                        //        ，因此需要用代码来判断这一次是否就是前往对应路由的beforeEach((to, from, next)，如果是，就执行next()放行。
                        next({ ...to, replace: true })
                    })
                }else {
                    next();
                }
            }
        }else {
            next();
        }
    }
))

// 后置路由守卫
router.afterEach(() => {
    // 关闭进度条
    nprogress.done();
})



export default router;
