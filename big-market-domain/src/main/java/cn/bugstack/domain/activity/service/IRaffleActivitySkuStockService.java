package cn.bugstack.domain.activity.service;

import cn.bugstack.domain.activity.model.valobj.ActivitySkuStockKeyVO;

/**
 * @author Luckysj @刘仕杰
 * @description sku库存接口
 * @create 2024/03/31 20:45:00
 */
public interface IRaffleActivitySkuStockService {

    /**
    * @description 获取库存更新延时队列
    * @return ActivitySkuStockKeyVO sku库存任务实体
    * @date 2024/03/31 20:46:51
    */
    ActivitySkuStockKeyVO takeQueueValue() throws InterruptedException;

    /**
    * @description 清空队列，当缓存库存直接清为0时，我们会调用该方法将sku库存队列清空，减少不必要的性能支出
    * @date 2024/03/31 20:47:58
    */
    void clearQueue();

    /**
    * @description 更新活动sku库存(扣减)
    * @param sku 活动sku
    * @date 2024/03/31 20:49:39
    */
    void updateActivitySkuStock(Long sku);

    /**
    * @description 清空对应sku的库存
    * @param sku 活动sku
    * @date 2024/03/31 20:50:54
    */
    void clearActivitySkuStock(Long sku);

}
