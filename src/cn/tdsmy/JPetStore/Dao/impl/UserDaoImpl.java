package cn.tdsmy.JPetStore.Dao.impl;

import cn.tdsmy.JPetStore.Dao.UserDao;
import cn.tdsmy.JPetStore.Dao.Utils.DBUtils;
import cn.tdsmy.JPetStore.Entity.Receiver;
import cn.tdsmy.JPetStore.Entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/25 8:42
 * @Version 1.0
 */
public class UserDaoImpl implements UserDao
{
    @Override
    public boolean register(User user)
    {
        boolean isSuccess = false;
        try (Connection connection = DBUtils.getConnection())
        {
            //用户名查重
            String sql = "select * from user where username ='" + user.getUsername() + "'";
            try (PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql))
            {
                if (!res.next())
                {
                    isSuccess = true;
                }
            }

            //如果同通用户名查重，插入用户表
            if (isSuccess)
            {
                String sql2 = "insert into user (username,password) values ('" + user.getUsername() + "','" + user.getPassword() + "')";
                try (PreparedStatement statement = connection.prepareStatement(sql2))
                {
                    statement.executeUpdate();
                }
            }

        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
        return isSuccess;//返回是否注册成功
    }

    @Override
    public boolean login(User user)
    {
        boolean isSuccess = false;
        String sql = "select * from user where username ='" + user.getUsername() + "' and password ='" + user.getPassword() + "'";
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql))
        {
            if (res.next())//用户名和密码匹配成功
            {
                isSuccess = true;
            }
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
        return isSuccess;
    }

    @Override
    public Receiver getReceiver(String username)
    {
        Receiver receiver = new Receiver();
        String sql = "select * from receiver where username ='" + username + "'";
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql))
        {
            if (res.next())
            {
                String receiverName = res.getString("receiverName");
                String email = res.getString("email");
                String phoneNumber = res.getString("phoneNumber");
                String country = res.getString("country");
                String province = res.getString("province");
                String city = res.getString("city");
                String district = res.getString("district");
                String detailedAddress = res.getString("detailedAddress");

                receiver.setReceiverName(receiverName);
                receiver.setEmail(email);
                receiver.setPhoneNumber(phoneNumber);
                receiver.setCountry(country);
                receiver.setProvince(province);
                receiver.setCity(city);
                receiver.setDistrict(district);
                receiver.setDetailedAddress(detailedAddress);
            }
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
        return receiver;
    }

    @Override
    public void updateUser(User user)
    {
        Receiver receiver = user.getReceiver();
        String receiverName = receiver.getReceiverName();
        String email = receiver.getEmail();
        String phoneNumber = receiver.getPhoneNumber();
        String country = receiver.getCountry();
        String province = receiver.getProvince();
        String city = receiver.getCity();
        String district = receiver.getDistrict();
        String detailedAddress = receiver.getDetailedAddress();

        try (Connection connection = DBUtils.getConnection())
        {
            String sql = "update user set password ='" + user.getPassword() + "' where username ='" + user.getUsername() + "'";
            try (PreparedStatement statement = connection.prepareStatement(sql))
            {
                statement.executeUpdate();
            }

            String sql2 = "update receiver set receiverName='" + receiverName + "',email ='" + email + "',phoneNumber='" + phoneNumber
                    + "',country='" + country + "',province='" + province + "',city='" + city + "',district='" + district + "',detailedAddress='" + detailedAddress + "'";
            try (PreparedStatement statement = connection.prepareStatement(sql2))
            {
                statement.executeUpdate();
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    @Override
    public Receiver selectReceiver(String username)
    {
        Receiver receiver = new Receiver();
        String sql = "select * from receiver where username ='" + username + "'";
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql))
        {
            while (res.next())
            {
                String ReceiverName = res.getString("ReceiverName");
                String PhoneNumber = res.getString("PhoneNumber");
                String Country = res.getString("Country");
                String Province = res.getString("Province");
                String City = res.getString("City");
                String District = res.getString("District");
                String DetailedAddress = res.getString("DetailedAddress");

                receiver.setReceiverName(ReceiverName);
                receiver.setPhoneNumber(PhoneNumber);
                receiver.setCountry(Country);
                receiver.setProvince(Province);
                receiver.setCity(City);
                receiver.setDistrict(District);
                receiver.setDetailedAddress(DetailedAddress);
            }
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
        return receiver;
    }
}
