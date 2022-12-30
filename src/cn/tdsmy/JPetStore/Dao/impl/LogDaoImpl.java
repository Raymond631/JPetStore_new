package cn.tdsmy.JPetStore.Dao.impl;

import cn.tdsmy.JPetStore.Dao.LogDao;
import cn.tdsmy.JPetStore.Dao.Utils.DBUtils;
import cn.tdsmy.JPetStore.Entity.UserLog;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * @Author: Raymond Li
 * @Date: 2022/11/4 20:57
 * @Version 1.0
 */
public class LogDaoImpl implements LogDao {
    @Override
    public void addLog(UserLog userLog) {
        String value = "'" + userLog.getUsername() + "','" + userLog.getTime() + "','" + userLog.getIp() + "','" + userLog.getUrl() + "','"
                + userLog.getSqlType() + "','" + userLog.getOperationContent() + "','" + userLog.getStatus() + "'";
        String sql = "insert into userlogs (username,time,ip,url,sqlType,operationContent,status) values (" + value + ")";
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.executeUpdate();
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
