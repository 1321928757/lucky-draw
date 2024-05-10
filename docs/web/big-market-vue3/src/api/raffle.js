// 具体的API使用
import axiosClient from "@/api/request.js"; 

// 根据活动id查询活动下的所有奖品，以及用户的剩余抽取次数和总抽取次数
export const queryAwardListByActivityID = (RaffleAwardListRequestDTO) => {
 return axiosClient.post('/api/v1/raffle/strategy/query_raffle_award_list', RaffleAwardListRequestDTO)
}

// 参与活动抽奖
export const partakeRaffle = (ActivityDrawRequestDTO) => {
 return axiosClient.post('/api/v1/raffle/activity/draw', ActivityDrawRequestDTO)
}

// 根据活动id进行概率装配
export const assembleActivity = (strategyId) => {
 return axiosClient.get(`/api/v1/raffle/activity/armory?activityId=${strategyId}`)
}

// 查询用户在活动中的次数账户信息
export const queryUserAccountById = (activityId) => {
    return axiosClient.get(`/api/v1/raffle/activity/query_user_activity_account?activityId=${activityId}`)
   }

// 查询用户在活动中的权重信息
export const queryRuleWeightById = (activityId) => {
    return axiosClient.get(`/api/v1/raffle/strategy/query_raffle_strategy_rule_weight?activityId=${activityId}`)
   }

// 查询活动的详细信息
export const queryActivityById = (activityId) => {
    return axiosClient.get(`/api/v1/raffle/activity/query_activity?activityId=${activityId}`)
   }

// 判断用户是否签到过
export const judgeIsSignUp = () => {
    return axiosClient.get(`/api/v1/raffle/activity/is_calendar_sign_rebate`)
}

// 用户签到
export const userSignUp = () => {
    return axiosClient.post(`/api/v1/raffle/activity/calendar_sign_rebate`)
}

// 分页查询用户的获奖记录
export const queryPageAwardRecord = (pageRequest) => {
    return axiosClient.post(`/api/v1/raffle/award/query_page_award_record`, pageRequest)
}