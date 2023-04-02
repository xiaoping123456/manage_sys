import {routerStore} from "@/store/router";
// 通用的模板
export const mix = {
    methods:{
        hasAuth(perm){
            const userstore = routerStore();
            var authority = userstore.authorites
            return authority.indexOf(perm)>-1
        }
    }
}