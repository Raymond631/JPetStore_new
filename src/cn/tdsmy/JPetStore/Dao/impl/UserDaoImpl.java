package cn.tdsmy.JPetStore.Dao.impl;

import cn.tdsmy.JPetStore.Dao.UserDao;
import cn.tdsmy.JPetStore.Dao.Utils.DBUtils;
import cn.tdsmy.JPetStore.Entity.Receiver;
import cn.tdsmy.JPetStore.Entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/25 8:42
 * @Version 1.0
 */
public class UserDaoImpl implements UserDao {
    @Override
    public boolean login(User user) {
        boolean isSuccess = false;
        String sql = "select * from user where username ='" + user.getUsername() + "' and password ='" + user.getPassword() + "'";
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql)) {
            if (res.next())//用户名和密码匹配成功
            {
                isSuccess = true;
            }
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return isSuccess;
    }

    public boolean registerSuccess(User user) {
        boolean isSuccess = false;
        String sql = "select * from user where username ='" + user.getUsername() + "'";
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql)) {
            if (!res.next()) {
                isSuccess = true;
            }
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return isSuccess;//返回是否注册成功
    }

    @Override
    public boolean register(User user) {
        boolean isSuccess = registerSuccess(user);
        try (Connection connection = DBUtils.getConnection()) {
            //如果同通用户名查重，插入用户表
            if (isSuccess) {
                String sql2 = "insert into user (username,password) values ('" + user.getUsername() + "','" + user.getPassword() + "')";
                try (PreparedStatement statement = connection.prepareStatement(sql2)) {
                    statement.executeUpdate();
                }
            }
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return isSuccess;//返回是否注册成功
    }

    @Override
    public List<Receiver> getReceiver(String username) {
        List<Receiver> receiverList = new ArrayList<>();
        String sql = "select * from receiver where username ='" + username + "'";
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql)) {
            while (res.next()) {
                String receiverName = res.getString("receiverName");
                String phoneNumber = res.getString("phoneNumber");
                String address = res.getString("address");

                Receiver receiver = new Receiver();
                receiver.setReceiverName(receiverName);
                receiver.setPhoneNumber(phoneNumber);
                receiver.setAddress(address);
                receiverList.add(receiver);
            }
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return receiverList;
    }

    @Override
    public void changePassword(User user) {
        String sql = "update user set password ='" + user.getPassword() + "' where username ='" + user.getUsername() + "'";
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateReceiver(String username, List<Receiver> receiverList) {
        String sql = "delete from receiver where username='" + username + "'";
        try (Connection connection = DBUtils.getConnection()) {
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.executeUpdate();
            }
            for (int i = 0; i < receiverList.size(); i++) {
                String sql2 = "insert into receiver (username,receiverName,phoneNumber,address) values ('" + username + "','" + receiverList.get(i).getReceiverName() + "','" + receiverList.get(i).getPhoneNumber() + "','" + receiverList.get(i).getAddress() + "')";
                try (PreparedStatement statement2 = connection.prepareStatement(sql2)) {
                    statement2.executeUpdate();
                }
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
