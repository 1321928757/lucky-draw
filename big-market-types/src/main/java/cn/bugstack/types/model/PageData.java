package cn.bugstack.types.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author Luckysj @刘仕杰
 * @description 分页查询数据对象
 * @create 2024/05/07 14:54:47
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PageData<T> {
    private int total;
    private int current;
    private int pageSize;
    private List<T> data;
}
