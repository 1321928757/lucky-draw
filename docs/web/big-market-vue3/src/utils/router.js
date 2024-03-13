import router from "@/router/index.js";


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

