// 具体的API使用
import axiosClient from "@/api/request.js"; 

// 用户登录
export const userLogin = (code) => {
    return axiosClient.post(`/api/v1/raffle/auth/login?code=${code}`, code)
   }