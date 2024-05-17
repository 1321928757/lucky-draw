import dayjs from "dayjs";

export const formattedDate = (value) => {
    return dayjs(value).format("YYYY-MM-DD HH:mm:ss");
  };

  // 时间格式化，将时间简短化，如两周前
export const formatDate = (timestamp) => {
  // 转换为时间戳
  const arrTimestamp = new Date(timestamp).getTime();
  // 定义时间单位
  const minute = 1000 * 60;
  const hour = minute * 60;
  const day = hour * 24;
  const month = parseFloat((day * 30).toString());
  const now = new Date().getTime();
  const diffValue = now - arrTimestamp;

  // 如果本地时间反而小于变量时间
  if (diffValue < 0) {
    return '不久前';
  }
  // 计算差异时间的量级
  const monthC = diffValue / month;
  const weekC = diffValue / (7 * day);
  const dayC = diffValue / day;
  const hourC = diffValue / hour;
  const minC = diffValue / minute;

  if (monthC > 12) {
    // 超过1年，直接显示年月日
    return (() => {
      const date = new Date(timestamp);
      return (
        date.getFullYear() + '年' + (date.getMonth() + 1) + '月' + date.getDate() + '号'
      );
    })();
  } else if (monthC >= 1) {
    return parseInt(monthC.toString()) + '月前';
  } else if (weekC >= 1) {
    return parseInt(weekC.toString()) + '周前';
  } else if (dayC >= 1) {
    return parseInt(dayC.toString()) + '天前';
  } else if (hourC >= 1) {
    return parseInt(hourC.toString()) + '小时前';
  } else if (minC >= 1) {
    return parseInt(minC.toString()) + '分钟前';
  }
  return '刚刚';
};