// 高亮关键字
//str 要传入的字符串  key 代表要高亮的字符串
export const heightLight = (str, key) => {
  if (str) {
    const reg = new RegExp(key, 'ig')
    return str.replace(reg, (val) => {
      return `<span style="color:#df6262">${val}</span>`
    })
  }
}
