package cn.tdsmy.JPetStore.Dao;

import cn.tdsmy.JPetStore.Entity.UserLog;

/**
 * @Author: Raymond Li
 * @Date: 2022/11/4 20:57
 * @Version 1.0
 */
public interface LogDao {
    public void addLog(UserLog userLog);
}
