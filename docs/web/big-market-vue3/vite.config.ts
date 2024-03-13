import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

import { resolve } from 'path'     
 
const pathResolve = (dir: string): any => {  
  return resolve(__dirname, ".", dir)          
}
 
const alias: Record<string, string> = {
  '@': pathResolve("src")
}

export default defineConfig({
  plugins: [vue()],
  // 配置运行使用别名@来代表src根路径
  resolve: {  // ****************** 路径配置新增
    alias     // ****************** 路径配置新增
  }           // ****************** 路径配置新增
})

