import { defineStore } from 'pinia';

export const useUserStore = defineStore('user', {
    // state 返回一个函数，该函数返回一个对象
    state: () => ({
        name: 'John Doe',
        age: 30,
    }),
    // actions 用于定义修改状态的方法
    actions: {
        updateName(newName) {
            this.name = newName;
        },
        increaseAge() {
            this.age += 1;
        },
    },
    // getters 用于定义基于现有状态的计算属性
    getters: {
        userNameWithAge: (state) => `${state.name} (${state.age})`,
    },
    // 开启持久化存储
    persist: true,
    // 以下可以指定更详细的一些持久化策略
    // persist: {
    //     key: 'piniaStore', //存储名称
    //     storage: sessionStorage, // 存储方式
    //     paths: ['username', 'like','obj'], //指定 state 中哪些数据需要被持久化。[] 表示不持久化任何状态，undefined 或 null 表示持久化整个 state
    // },
});