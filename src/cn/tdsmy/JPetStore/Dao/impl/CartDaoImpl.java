package cn.tdsmy.JPetStore.Dao.impl;

import cn.tdsmy.JPetStore.Dao.CartDao;
import cn.tdsmy.JPetStore.Dao.Utils.DBUtils;
import cn.tdsmy.JPetStore.Entity.CartItem;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/24 10:03
 * @Version 1.0
 */
public class CartDaoImpl implements CartDao
{
    @Override
    public void addCartItem(String username, String itemID, int quantity)
    {
        String value = "'" + username + "','" + itemID + "','" + quantity + "'";
        String sql = "insert into cart (username,itemID,quantity) values (" + value + ")";

        //下面用到了try-with-resources语法: 执行完{}后，自动关闭()内的resources,不需要再写finally子句去手动关闭connection等资源
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
    public void removeCartItem(String username, String itemID)
    {
        String sql = "delete from cart where username ='" + username + "'" + " and itemID ='" + itemID + "'";
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
    public void clearCart(String username)
    {
        String sql = "delete from cart where username ='" + username + "'";
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
    public void updateCart(String username, String itemID, int quantity)
    {
        String sql = "update cart set quantity = '" + quantity + "' where username ='" + username + "'" + " and itemID ='" + itemID + "'";
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
    public List<CartItem> selectCartList(String username)
    {
        List<CartItem> cartItemList = new ArrayList<>();
        String sql = "select * from cart where username ='" + username + "'";
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql))
        {
            while (res.next())
            {
                CartItem cartItem = new CartItem();

                String itemID = res.getString("itemID");
                int quantity = res.getInt("quantity");
                cartItem.setItemID(itemID);
                cartItem.setQuantity(quantity);

                String sql2 = "select * from item where itemID = '" + itemID + "'";
                try (PreparedStatement statement2 = connection.prepareStatement(sql2); ResultSet res2 = statement2.executeQuery(sql2))
                {
                    while (res2.next())
                    {
                        String productID = res2.getString("productID");
                        String description = res2.getString("description");
                        int stock = res2.getInt("stock");
                        BigDecimal listPrice = res2.getBigDecimal("listPrice");
                        cartItem.setProductID(productID);
                        cartItem.setDescription(description);
                        cartItem.setStock(stock);
                        cartItem.setListPrice(listPrice);
                    }
                }
                cartItemList.add(cartItem);
            }
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
        return cartItemList;
    }
}
