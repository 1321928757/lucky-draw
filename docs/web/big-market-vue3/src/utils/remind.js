// 封装element的提示消息和通知消息
import { ElMessage } from "element-plus"
import { ElNotification } from 'element-plus'

const messageAndNotifyType = {
  error:'error',
  success:'success',
  warning:'warning',
  info:'info',
}

// 普通信息提示
export const infoMsg = (msgInfo) => {
  ElMessage({
    type: messageAndNotifyType.info,
    showClose: true,
    dangerouslyUseHTMLString: true,
    message: msgInfo,
  })
}

// 普通信息通知
export const infoNotify = (msgInfo) => {
  ElNotification({
    title: messageAndNotifyType.info,
    message: msgInfo,
    type: 'info',
  })
}

// 成功提示
export const succesMsg = (msgInfo) => {
  ElMessage({
    type: messageAndNotifyType.success,
    showClose: true,
    dangerouslyUseHTMLString: true,
    message: msgInfo,
  })
}

// 成功通知
export const successNotify = (msgInfo) => {
  ElNotification({
    title: messageAndNotifyType.success,
    message: msgInfo,
    type: 'success',
  })
}


// 错误提示
export const errorMsg = (msgInfo) => {
  ElMessage({
    type: messageAndNotifyType.error,
    showClose: true,
    dangerouslyUseHTMLString: true,
    message: msgInfo,
  })
}

// 错误通知
export const errorNotify = (msgInfo) => {
  ElNotification({
    title: messageAndNotifyType.error,
    message: msgInfo,
    type: 'error',
  })
}

// 警告提示
export const warnMsg = (msgInfo) => {
  ElMessage({
    type: messageAndNotifyType.warning,
    showClose: true,
    dangerouslyUseHTMLString: true,
    message: msgInfo,
  })
}

// 警告通知
export const warnNotify = (msgInfo) => {
  ElNotification({
    title: messageAndNotifyType.warning,
    message: msgInfo,
    type: 'warning',
  })
}

