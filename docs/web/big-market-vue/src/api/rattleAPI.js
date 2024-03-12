import { AxiosRequire } from "./request.js";

// 根据策略ID获取策略下的全部奖品
export const getAwardDataByStrategyId = (strategyDto) => {
  return AxiosRequire({
    url: "/api/v1/raffle/query_raffle_award_list",
    method: "post",
    data: strategyDto
  });
};

// 参与抽奖
export const startRaffle = (strategyDto) => {
  return AxiosRequire({
    url: "/api/v1/raffle/random_raffle",
    method: "post",
    data: strategyDto
  });
};



// 根据id进行概率装配
export const assembleOdds = (strategyId) => {
  return AxiosRequire({
    url: "/api/v1/raffle/strategy_armory?strategyId=" + strategyId,
    method: "get"
  });
};


// 获取全部策略
// export const getAllRaffleStrategy = () => {
//   return AxiosRequire({
//     url: "/api/v1/raffle/query_raffle_strategy_list",
//     method: "get",
//   });
// };
