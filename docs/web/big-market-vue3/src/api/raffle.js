// 具体的API使用
import axiosClient from "@/api/request.js"; './request.js'

// 根据策略ID获取策略下的全部奖品
export const getAwardDataByStrategyId = (strategyDto) => {
 return axiosClient.post('/api/v1/raffle/query_raffle_award_list', strategyDto)
}

// 参与抽奖
export const startRaffle = (strategyDto) => {
 return axiosClient.post('/api/v1/raffle/random_raffle', strategyDto)
}

// 根据id进行概率装配
export const assembleOdds = (strategyId) => {
 return axiosClient.get(`/api/v1/raffle/strategy_armory?strategyId=${strategyId}`)
}