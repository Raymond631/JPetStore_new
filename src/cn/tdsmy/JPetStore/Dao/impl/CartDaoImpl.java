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
    public void addCartItem(String username, CartItem cartItem)
    {
        String value = "'" + username + "','"
                + cartItem.getItemID() + "','"
                + cartItem.getProductID() + "','"
                + cartItem.getDescription() + "','"
                + cartItem.getStock() + "','"
                + cartItem.getQuantity() + "','"
                + cartItem.getListPrice() + "'";
        String sql = "insert into cart (user,ItemID,ProductID,Description,Stock,Quantity,ListPrice) values (" + value + ")";

        //下面用到了try-with-resources语法: 执行完{}后，自动关闭()内的resources,不需要再写finally子句去手动关闭connection等资源
        //"增删改"括号内写2项，"查"括号内写3项
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
    public void removeCartItem(String username, String item)
    {
        String sql = "delete from cart where user ='" + username + "'" + " and ItemID ='" + item + "'";
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
        String sql = "delete from cart where user ='" + username + "'";
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
    public void updateCart(String username, String item, String quantity)
    {
        String sql = "update cart set Quantity = '" + quantity + "' where user ='" + username + "'" + " and ItemID ='" + item + "'";
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
        String sql = "select * from cart where user ='" + username + "'";
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql))
        {
            while (res.next())
            {
                String ItemID = res.getString("ItemID");
                String ProductID = res.getString("ProductID");
                String Description = res.getString("Description");
                String Stock = res.getString("Stock");
                String Quantity = res.getString("Quantity");
                BigDecimal ListPrice = res.getBigDecimal("ListPrice");

                CartItem cartItem = new CartItem(ItemID, ProductID, Description, Stock, Quantity, ListPrice);
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
