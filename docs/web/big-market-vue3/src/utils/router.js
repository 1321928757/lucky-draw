import router from "@/router/index.js";
import { useRoute } from 'vue-router'


// push跳转可以返回到之前的界面
export const topathPush = ( url ) => {
    router.push({
        path: url,
    })
}

// 无法回到replace跳转的界面
export const topathReplace = ( url ) => {
    router.replace({
        path: url,
    })
}

// 传参
export const topathPushWithParam = ( url , params) => {
    router.push({
        path: url,
        query: params
    })
}

// 传参
export const topathReplaceWithParam = ( url , params) => {
    router.replace({
        path: url,
        query: params
    })
}

export const getUrlQuery = () => {
    const route = useRoute()
    return query
}

export const goBack = () => {
    // 返回上一页
    console.log(1111)
    router.go(-1)
  }



