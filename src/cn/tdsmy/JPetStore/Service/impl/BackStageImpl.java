package cn.tdsmy.JPetStore.Service.impl;

import cn.tdsmy.JPetStore.Dao.BackStageDao;
import cn.tdsmy.JPetStore.Dao.impl.BackStageDaoImpl;
import cn.tdsmy.JPetStore.Service.BackStage;
import com.alibaba.fastjson.JSONObject;

/**
 * @Author: Raymond Li
 * @Date: 2022/12/30 9:36
 * @Version 1.0
 */
public class BackStageImpl implements BackStage {
    private BackStageDao backStageDao;

    @Override
    public JSONObject getIndexData() {
        if (backStageDao == null) {
            backStageDao = new BackStageDaoImpl();
        }
        return backStageDao.getIndexData();
    }

    @Override
    public JSONObject getProductData() {
        if (backStageDao == null) {
            backStageDao = new BackStageDaoImpl();
        }
        return backStageDao.getProductData();
    }
}
