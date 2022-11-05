package cn.tdsmy.JPetStore.Service.impl;

import cn.tdsmy.JPetStore.Dao.LogDao;
import cn.tdsmy.JPetStore.Dao.impl.LogDaoImpl;
import cn.tdsmy.JPetStore.Entity.MyLog;
import cn.tdsmy.JPetStore.Service.LogService;

import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/11/4 20:56
 * @Version 1.0
 */
public class LogServiceImpl implements LogService
{
    private LogDao logDao;

    @Override
    public void addLog(MyLog myLog)
    {
        if (logDao == null)
        {
            logDao = new LogDaoImpl();
        }
        logDao.addLog(myLog);
    }

    @Override
    public List<MyLog> getLog()
    {
        if (logDao == null)
        {
            logDao = new LogDaoImpl();
        }
        return logDao.getLog();
    }
}
