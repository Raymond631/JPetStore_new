package cn.tdsmy.JPetStore.Service;

import cn.tdsmy.JPetStore.Entity.MyLog;

import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/11/4 20:54
 * @Version 1.0
 */
public interface LogService
{
    public void addLog(MyLog myLog);

    public List<MyLog> getLog();
}
