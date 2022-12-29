package cn.tdsmy.JPetStore.Dao.impl;

import cn.tdsmy.JPetStore.Dao.CartDao;
import cn.tdsmy.JPetStore.Dao.Utils.DBUtils;
import cn.tdsmy.JPetStore.Entity.CartJson;

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
public class CartDaoImpl implements CartDao {
    @Override
    public void addCartItem(String username, String itemID, int quantity) {
        try (Connection connection = DBUtils.getConnection()) {
            String sql = "select * from cart where username ='" + username + "' and itemID ='" + itemID + "'";
            try (PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql)) {
                if (res.next()) {
                    quantity += res.getInt("quantity");
                    String sql2 = "update cart set quantity = '" + quantity + "' where username ='" + username + "'" + " and itemID ='" + itemID + "'";
                    try (PreparedStatement statement2 = connection.prepareStatement(sql2)) {
                        statement2.executeUpdate();
                    }
                }
                else {
                    String value = "'" + username + "','" + itemID + "','" + quantity + "'";
                    String sql2 = "insert into cart (username,itemID,quantity) values (" + value + ")";
                    try (PreparedStatement statement2 = connection.prepareStatement(sql2)) {
                        statement2.executeUpdate();
                    }
                }
            }
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void removeCartItem(String username, String itemID) {
        String sql = "delete from cart where username ='" + username + "'" + " and itemID ='" + itemID + "'";
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.executeUpdate();
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void clearCart(String username) {
        String sql = "delete from cart where username ='" + username + "'";
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.executeUpdate();
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void updateCart(String username, String itemID, int quantity) {
        String sql = "update cart set quantity = '" + quantity + "' where username ='" + username + "'" + " and itemID ='" + itemID + "'";
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.executeUpdate();
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<CartJson> selectCartList(String username) {
        List<CartJson> cartItemList = new ArrayList<>();
        String sql = "select * from cart where username ='" + username + "'";
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql)) {
            while (res.next()) {
                CartJson cartItem = new CartJson();

                String itemID = res.getString("itemID");
                int quantity = res.getInt("quantity");
                cartItem.setItemID(itemID);
                cartItem.setNumber(quantity);

                String sql2 = "select * from item where itemID = '" + itemID + "'";
                try (PreparedStatement statement2 = connection.prepareStatement(sql2); ResultSet res2 = statement2.executeQuery(sql2)) {
                    while (res2.next()) {
                        String description = res2.getString("description");
                        int stock = res2.getInt("stock");
                        BigDecimal listPrice = res2.getBigDecimal("listPrice");
                        String img = res2.getString("img");
                        cartItem.setName("（" + itemID + "）" + description);
                        cartItem.setXz(stock);
                        cartItem.setProc(listPrice);
                        cartItem.setImg(img);
                    }
                }
                cartItemList.add(cartItem);
            }
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return cartItemList;
    }
}
