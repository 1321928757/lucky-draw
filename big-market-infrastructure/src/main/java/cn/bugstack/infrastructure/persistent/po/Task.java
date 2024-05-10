package cn.bugstack.infrastructure.persistent.po;

import lombok.Data;

import java.util.Date;

/**
 * @author Luckysj @刘仕杰
 * @description mq消息任务表实体
 * @create 2024/04/07 09:11:03
 */
@Data
public class Task {
    /** 主键ID*/
    private String id;
    /** 用户ID */
    private String userId;
    /** 消息主题*/
    private String topic;
    /** 消息内容*/
    private String message;
    /** 消息编号 */
    private String messageId;
    /** 任务状态；create-创建、completed-完成、fail-失败，这里可以改为int类型的，只是字符串类型方便理解 */
    private String state;
    /** 创建时间 */
    private Date createTime;
    /** 更新时间 */
    private Date updateTime;
}
