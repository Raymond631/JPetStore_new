package cn.tdsmy.JPetStore.Dao.impl;

import cn.tdsmy.JPetStore.Dao.UserDao;
import cn.tdsmy.JPetStore.Dao.Utils.DBUtils;
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
    public void addUser(User user)
    {

    }


    @Override
    public void updateUser(User user)
    {

    }

    @Override
    public User selectUser(String user)
    {
        return null;
    }

    @Override
    public User selectReceiver(String username)
    {
        User receiver = new User();
        String sql = "select * from user where username ='" + username + "'";
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
