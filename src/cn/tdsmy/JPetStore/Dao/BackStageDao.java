package cn.tdsmy.JPetStore.Dao;

import com.alibaba.fastjson.JSONObject;

/**
 * @Author: Raymond Li
 * @Date: 2022/12/30 9:39
 * @Version 1.0
 */
public interface BackStageDao {
    JSONObject getIndexData();

    JSONObject getProductData();
}
