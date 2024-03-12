// 时间格式化，将时间简短化，如两周前
export const formatDate = (timestamp) => {
  // 转换为时间戳
  let arrTimestamp = new Date(timestamp).getTime();
  // 定义时间单位
  let minute = 1000 * 60;
  let hour = minute * 60;
  let day = hour * 24;
  let month = parseFloat(day * 30);
  let now = new Date().getTime();
  let diffValue = now - arrTimestamp

  // 如果本地时间反而小于变量时间
  if (diffValue < 0) {
    return '不久前';
  }
  // 计算差异时间的量级
  let monthC = diffValue / month;
  let weekC = diffValue / (7 * day);
  let dayC = diffValue / day;
  let hourC = diffValue / hour;
  let minC = diffValue / minute;

  if (monthC > 12) {
    // 超过1年，直接显示年月日
    return (function () {
      let date = new Date(timestamp);
      return date.getFullYear() + '年' + (date.getMonth() + 1) + '月' + date.getDate() + '号';
    })();
  } else if (monthC >= 1) {
    return parseInt(monthC) + '月前';
  } else if (weekC >= 1) {
    return parseInt(weekC) + '周前';
  } else if (dayC >= 1) {
    return parseInt(dayC) + '天前';
  } else if (hourC >= 1) {
    return parseInt(hourC) + '小时前';
  } else if (minC >= 1) {
    return parseInt(minC) + '分钟前';
  }
  return '刚刚';
}

// 计算两天的的天数差
export const transforDays = (date1, date2) => {
 //parse() 是 Date 的一个静态方法 , 所以应该使用 Date.parse() 来调用，而不是作为 Date 的实例方法。返回该日期距离 1970/1/1 午夜时间的毫秒数
 date1 = Date.parse(date1);
 date2 = Date.parse(date2);
 console.log(date1)
 console.log(date2)
 //计算两个日期之间相差的毫秒数的绝对值
 var ms= Math.abs(date2 - date1);
 //毫秒数除以一天的毫秒数,就得到了天数
 var days = Math.floor(ms / (24 * 3600 * 1000));
 return days ;
}

// 计算时间差 2020-10-10 10:10:10格式
export function calculateTimeStartEnd(startTime, endTime) {
  const diff = Math.abs(new Date(startTime) - new Date(endTime));
  const seconds = Math.floor(diff / 1000) % 60;
  const minutes = Math.floor(diff / (1000 * 60)) % 60;
  const hours = Math.floor(diff / (1000 * 60 * 60)) % 24;
  const days = Math.floor(diff / (1000 * 60 * 60 * 24));

  return `${days}天 ${hours}小时 ${minutes}分钟 ${seconds}秒`;
}

// 计算时间差 2020-10-10 10:10:10格式
export function calculateTimeDuration(endTime) {
  const currentTime = new Date();
  const diff = Math.abs(currentTime - new Date(endTime));
  const seconds = Math.floor(diff / 1000) % 60;
  const minutes = Math.floor(diff / (1000 * 60)) % 60;
  const hours = Math.floor(diff / (1000 * 60 * 60)) % 24;
  const days = Math.floor(diff / (1000 * 60 * 60 * 24));

  return `${days}天 ${hours}小时 ${minutes}分钟 ${seconds}秒`;
}