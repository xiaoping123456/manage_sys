import {defineStore} from "pinia";
import { login} from "@/api/login";

export const userStore = defineStore("user",{
    state:()=>{
        return{
            token:localStorage.getItem("mushanToken") || '',
        }
    },
    getters:{

    },
    actions:{
        login(data){
            return new Promise((resolve, reject)=>{
                login(data).then(res=>{
                    // 保存token
                    localStorage.setItem("mushanToken",res.data);
                    resolve()
                }).catch(onerror=>{
                    reject(onerror)
                })

            })
        },
        out(){
            // 移除token
            localStorage.removeItem('mushanToken')
        }
    }

})