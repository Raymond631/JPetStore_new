package cn.tdsmy.JPetStore.Dao.impl;

import cn.tdsmy.JPetStore.Dao.LogDao;
import cn.tdsmy.JPetStore.Dao.Utils.DBUtils;
import cn.tdsmy.JPetStore.Entity.MyLog;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/11/4 20:57
 * @Version 1.0
 */
public class LogDaoImpl implements LogDao
{
    @Override
    public void addLog(MyLog myLog)
    {
        String value = "'" + myLog.getUsername() + "','" + myLog.getTime() + "','" + myLog.getIp() + "','"
                + myLog.getOperationType() + "','" + myLog.getOperationContent() + "','" + myLog.getStatus() + "'";
        String sql = "insert into userlogs (username,time,ip,url,operationType,operationContent,status) values (" + value + ")";
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(sql))
        {
            statement.executeUpdate();
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<MyLog> getLog()
    {
        List<MyLog> myLogList = new ArrayList<>();
        String sql = "select * from userlogs";
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql))
        {
            while (res.next())
            {
                String username = res.getString("username");
                String time = res.getString("time");
                String ip = res.getString("ip");
                String url = res.getString("url");
                String operationType = res.getString("operationType");
                String operationContent = res.getString("operationContent");
                String status = res.getString("status");
                MyLog myLog = new MyLog(username, time, ip, url, operationType, operationContent, status);
                myLogList.add(myLog);
            }
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
        return myLogList;
    }
}
