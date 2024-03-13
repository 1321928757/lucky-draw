import axios from 'axios'
import router from '../router'
import { errorMsg } from '@/utils/remind.js'

// 创建axios实例
const axiosClient = axios.create({
 baseURL: import.meta.env.VITE_API_HOST,
 timeout: 10000, // 请求超时时间
})

// 请求拦截器
axiosClient.interceptors.request.use(
 (config) => {
   // 在发送请求之前做些什么
   const token = JSON.parse(localStorage.getItem('LUCKYSJ_TOKEN'))
   if (token) {
     config.headers.Token = token
   }
   return config
 },
 (error) => {
   // 可以在这里做一些失败逻辑，比如身份认证失败跳转
   error('请求发送失败')
   return Promise.reject(error)
 }
)

// 响应拦截器
axiosClient.interceptors.response.use(
 (response) => {
   // 对响应数据做些什么
   return response.data
 },
 (error) => {
   // 对响应错误做些什么
   const { message } = error
   let errorMessage = message
   if (message === 'Network Error') {
     errorMessage = '后端接口连接异常'
   } else if (message.includes('timeout')) {
     errorMessage = '系统接口请求超时'
   } else if (message.includes('Request failed with status code')) {
     errorMessage = `系统接口${message.substr(message.length - 3)}异常`
   }
     errorMessage(errorMessage)
   return Promise.reject(error)
 }
)

// 导出封装的请求方法
export default axiosClient