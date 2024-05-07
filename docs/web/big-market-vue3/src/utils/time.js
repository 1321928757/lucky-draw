import dayjs from "dayjs";

export const formattedDate = (value) => {
    return dayjs(value).format("YYYY-MM-DD HH:mm:ss");
  };