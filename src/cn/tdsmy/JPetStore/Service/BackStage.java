package cn.tdsmy.JPetStore.Service;

import com.alibaba.fastjson.JSONObject;

/**
 * @Author: Raymond Li
 * @Date: 2022/12/30 9:35
 * @Version 1.0
 */
public interface BackStage {

    JSONObject getIndexData();

    JSONObject getProductData();
}
