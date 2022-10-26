package cn.tdsmy.JPetStore.Dao.impl;

import cn.tdsmy.JPetStore.Dao.OrderDao;
import cn.tdsmy.JPetStore.Dao.Utils.DBUtils;
import cn.tdsmy.JPetStore.Entity.CartItem;
import cn.tdsmy.JPetStore.Entity.Order;
import cn.tdsmy.JPetStore.Entity.User;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/26 19:19
 * @Version 1.0
 */
public class OrderDaoImpl implements OrderDao
{
    @Override
    public void addOrder(String username, Order order)
    {
        try (Connection connection = DBUtils.getConnection())
        {
            for (CartItem cartItem : order.getCartItemList())
            {
                String value = "'" + username + "','"
                        + order.getOrderID() + "','"
                        + order.getOrderTime() + "','"
                        + order.getPayTime() + "','"
                        + order.getReceiver().getReceiverName() + "','"
                        + order.getReceiver().getPhoneNumber() + "','"
                        + order.getReceiver().getCountry() + "','"
                        + order.getReceiver().getProvince() + "','"
                        + order.getReceiver().getCity() + "','"
                        + order.getReceiver().getDistrict() + "','"
                        + order.getReceiver().getDetailedAddress() + "','"
                        + cartItem.getItemID() + "','"
                        + cartItem.getProductID() + "','"
                        + cartItem.getDescription() + "','"
                        + cartItem.getInStock() + "','"
                        + cartItem.getQuantity() + "','"
                        + cartItem.getListPrice() + "','"
                        + order.getTotalPrice() + "','"
                        + order.getPayMethod() + "'";

                //注意: order是mysql关键字，不可用作表名
                String sql = "insert into orderlist (username,OrderID,OrderTime,PayTime,ReceiverName,PhoneNumber,Country,Province," +
                        "City,District,DetailedAddress,ItemID,ProductID,Description,InStock,Quantity,ListPrice,TotalPrice,PayMethod) values (" + value + ")";

                try (PreparedStatement statement = connection.prepareStatement(sql))
                {
                    statement.executeUpdate();
                }
            }
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void deleteOrder(String OrderID)
    {
        String sql = "delete from orderlist where OrderID ='" + OrderID + "'";
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
    public Order selectOrder(String OrderID)
    {
        Order order = new Order();
        String sql = "select * from orderlist where OrderID ='" + OrderID + "'";
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql))
        {
            if (res.next())
            {
                String orderID = res.getString("orderID");
                String orderTime = res.getString("orderTime");
                String payTime = res.getString("payTime");
                BigDecimal TotalPrice = res.getBigDecimal("TotalPrice");
                String PayMethod = res.getString("PayMethod");

                String ReceiverName = res.getString("ReceiverName");
                String PhoneNumber = res.getString("PhoneNumber");
                String Country = res.getString("Country");
                String Province = res.getString("Province");
                String City = res.getString("City");
                String District = res.getString("District");
                String DetailedAddress = res.getString("DetailedAddress");
                User receiver = new User();
                receiver.setReceiverName(ReceiverName);
                receiver.setPhoneNumber(PhoneNumber);
                receiver.setCountry(Country);
                receiver.setProvince(Province);
                receiver.setCity(City);
                receiver.setDistrict(District);
                receiver.setDetailedAddress(DetailedAddress);

                order.setOrderID(orderID);
                order.setOrderTime(orderTime);
                order.setPayTime(payTime);
                order.setReceiver(receiver);
                order.setTotalPrice(TotalPrice);
                order.setPayMethod(PayMethod);

                String ItemID = res.getString("ItemID");
                String ProductID = res.getString("ProductID");
                String Description = res.getString("Description");
                String InStock = res.getString("InStock");
                String Quantity = res.getString("Quantity");
                BigDecimal ListPrice = res.getBigDecimal("ListPrice");
                CartItem cartItem = new CartItem(ItemID, ProductID, Description, InStock, Quantity, ListPrice);
                order.getCartItemList().add(cartItem);
            }
            while (res.next())
            {
                String ItemID = res.getString("ItemID");
                String ProductID = res.getString("ProductID");
                String Description = res.getString("Description");
                String InStock = res.getString("InStock");
                String Quantity = res.getString("Quantity");
                BigDecimal ListPrice = res.getBigDecimal("ListPrice");
                CartItem cartItem = new CartItem(ItemID, ProductID, Description, InStock, Quantity, ListPrice);
                order.getCartItemList().add(cartItem);
            }
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
        return order;
    }

    @Override
    public List<Order> selectOrderList(String username)
    {
        List<Order> orderList = new ArrayList<>();
        String sql = "select * from orderlist where username ='" + username + "'";
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql))
        {
            String orderID = "";
            while (res.next())
            {
                String nextOrderID = res.getString("orderID");
                if (!nextOrderID.equals(orderID))
                {
                    String orderTime = res.getString("orderTime");
                    BigDecimal TotalPrice = res.getBigDecimal("TotalPrice");

                    Order order = new Order();
                    order.setOrderID(orderID);
                    order.setOrderTime(orderTime);
                    order.setTotalPrice(TotalPrice);
                    orderList.add(order);
                }
                orderID = nextOrderID;
            }
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
        return orderList;
    }
}
