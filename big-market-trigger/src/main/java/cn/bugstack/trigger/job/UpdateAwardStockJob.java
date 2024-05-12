package cn.bugstack.trigger.job;

import cn.bugstack.domain.strategy.model.valobj.StrategyAwardStockKeyVO;
import cn.bugstack.domain.strategy.service.IRaffleStock;
import com.xxl.job.core.handler.annotation.XxlJob;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * @author Luckysj @刘仕杰
 * @description 更新奖品库存任务；为了不让更新库存的压力打到数据库中，这里采用了redis更新缓存库存，
 * 异步队列更新数据库，数据库表最终一致即可。
 * @create 2024-02-09 12:13
 */
@Slf4j
@Component()
public class UpdateAwardStockJob {

    @Resource
    private IRaffleStock raffleStock;

    // 每五秒消费一次redisson等待队列中的库存更新任务
    @XxlJob("updateAwardStockJob")
    public void exec() {
        try {
            StrategyAwardStockKeyVO strategyAwardStockKeyVO = raffleStock.takeQueueValue();
            if (null == strategyAwardStockKeyVO) return;
            log.info("定时任务，更新奖品消耗库存 开始");

            raffleStock.updateStrategyAwardStock(strategyAwardStockKeyVO.getStrategyId(), strategyAwardStockKeyVO.getAwardId());
            log.info("定时任务，更新奖品消耗库存 完成，strategyId:{} awardId:{}", strategyAwardStockKeyVO.getStrategyId(), strategyAwardStockKeyVO.getAwardId());
        } catch (Exception e) {
            log.error("定时任务，更新奖品消耗库存失败", e);
        }
    }

    // @Scheduled(cron = "0/5 * * * * ?")
    // public void exec() {
    //     try {
    //         StrategyAwardStockKeyVO strategyAwardStockKeyVO = raffleStock.takeQueueValue();
    //         if (null == strategyAwardStockKeyVO) return;
    //         log.info("定时任务，更新奖品消耗库存 开始");
    //
    //         raffleStock.updateStrategyAwardStock(strategyAwardStockKeyVO.getStrategyId(), strategyAwardStockKeyVO.getAwardId());
    //         log.info("定时任务，更新奖品消耗库存 完成，strategyId:{} awardId:{}", strategyAwardStockKeyVO.getStrategyId(), strategyAwardStockKeyVO.getAwardId());
    //     } catch (Exception e) {
    //         log.error("定时任务，更新奖品消耗库存失败", e);
    //     }
    // }

}
