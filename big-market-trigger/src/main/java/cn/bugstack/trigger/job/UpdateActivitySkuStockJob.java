package cn.bugstack.trigger.job;

import cn.bugstack.domain.activity.model.valobj.ActivitySkuStockKeyVO;
import cn.bugstack.domain.activity.service.IRaffleActivitySkuStockService;
import com.xxl.job.core.handler.annotation.XxlJob;
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
    private IRaffleActivitySkuStockService skuStock;

    // 每五秒消费一次redisson等待队列中的库存更新任务

    // @XxlJob("updateActivitySkuStockJob")
    // public void exec() {
    //     try {
    //         ActivitySkuStockKeyVO strategyAwardStockKeyVO = skuStock.takeQueueValue();
    //         if (null == strategyAwardStockKeyVO) return;
    //         log.info("定时任务，更新活动sku消耗库存 开始");
    //
    //         skuStock.updateActivitySkuStock(strategyAwardStockKeyVO.getSku());
    //         log.info("定时任务，更新活动sku消耗库存 完成，sku:{} activityId:{}", strategyAwardStockKeyVO.getSku(), strategyAwardStockKeyVO.getActivityId());
    //     } catch (Exception e) {
    //         log.error("定时任务，更新活动sku消耗库存失败", e);
    //     }
    // }


    @Scheduled(cron = "0/5 * * * * ?")
    public void exec() {
        try {
            ActivitySkuStockKeyVO strategyAwardStockKeyVO = skuStock.takeQueueValue();
            if (null == strategyAwardStockKeyVO) return;
            log.info("定时任务，更新活动sku消耗库存 开始");

            skuStock.updateActivitySkuStock(strategyAwardStockKeyVO.getSku());
            log.info("定时任务，更新活动sku消耗库存 完成，sku:{} activityId:{}", strategyAwardStockKeyVO.getSku(), strategyAwardStockKeyVO.getActivityId());
        } catch (Exception e) {
            log.error("定时任务，更新活动sku消耗库存失败", e);
        }
    }
}
