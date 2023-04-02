<!--menus-->
<template>
    <el-scrollbar style="background: rgb(41,66,86);" >
        <div class="aside">
            <h3 style="text-align: center">{{collapse?'木杉':'木杉管理系统'}}</h3>
            <el-menu
                    router
                    :collapse="collapse"
                    active-text-color="rgb(0,160,255)"
                    :background-color="color"
                    class="el-menu-vertical-demo menu"
                    default-active="2"
                    text-color="#fff"
            >
            <menus  v-for="(item,index) in newlist" :data="item"></menus>
            </el-menu>
        </div>

    </el-scrollbar>
</template>

<script setup>
    import menus from "./menus.vue";
    import { reactive, ref,computed } from 'vue'
    import {routerStore} from "@/store/router";

    const userstore = routerStore();

    const props = defineProps({
        collapse:{
            type:Boolean,
            default:false
        },
        color:{
            type:String,
            default:'rgb(41,66,86)'
        }
    })

   const newlist = computed({
       get() {
           return userstore.menus;
       },
    })


</script>

<style scoped>

h3{
    color: white;
}
.menu{
    border: none;
}

</style>