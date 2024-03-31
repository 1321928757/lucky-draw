package cn.bugstack.trigger.job;

import cn.bugstack.domain.activity.model.valobj.ActivitySkuStockKeyVO;
import cn.bugstack.domain.activity.service.ISkuStock;
import cn.bugstack.domain.strategy.model.valobj.StrategyAwardStockKeyVO;
import cn.bugstack.domain.strategy.service.IRaffleStock;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * @author Luckysj @刘仕杰
 * @description 更新活动SKU库存任务
 * @create 2024/03/31 21:18:34
 */
@Slf4j
@Component()
public class UpdateActivitySkuStockJob {
    @Resource
    private ISkuStock skuStock;

    // 每五秒消费一次redisson等待队列中的库存更新任务
    @Scheduled(cron = "0/5 * * * * ?")
    public void exec() {
        try {
            log.info("定时任务，更新活动sku消耗库存 开始");
            ActivitySkuStockKeyVO strategyAwardStockKeyVO = skuStock.takeQueueValue();
            if (null == strategyAwardStockKeyVO) return;

            skuStock.updateActivitySkuStock(strategyAwardStockKeyVO.getSku());
            log.info("定时任务，更新活动sku消耗库存 完成，sku:{} activityId:{}", strategyAwardStockKeyVO.getSku(), strategyAwardStockKeyVO.getActivityId());
        } catch (Exception e) {
            log.error("定时任务，更新活动sku消耗库存失败", e);
        }
    }
}
