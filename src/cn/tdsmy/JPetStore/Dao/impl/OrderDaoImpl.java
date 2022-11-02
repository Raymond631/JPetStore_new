package cn.tdsmy.JPetStore.Dao.impl;

import cn.tdsmy.JPetStore.Dao.OrderDao;
import cn.tdsmy.JPetStore.Dao.Utils.DBUtils;
import cn.tdsmy.JPetStore.Entity.CartItem;
import cn.tdsmy.JPetStore.Entity.Order;
import cn.tdsmy.JPetStore.Entity.Receiver;

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
                    + order.getTotalPrice() + "','"
                    + order.getPayMethod() + "'";
            String sql = "insert into orderlist (username,orderID,orderTime,payTime,receiverName,phoneNumber,country," +
                    "province,city,district,detailedAddress,totalPrice,payMethod) values (" + value + ")";
            try (PreparedStatement statement = connection.prepareStatement(sql))
            {
                statement.executeUpdate();
            }

            for (CartItem cartItem : order.getCartItemList())
            {
                String value2 = "'" + order.getOrderID() + "','"
                        + cartItem.getItemID() + "','"
                        + cartItem.getProductID() + "','"
                        + cartItem.getDescription() + "','"
                        + cartItem.getStock() + "','"
                        + cartItem.getQuantity() + "','"
                        + cartItem.getListPrice() + "'";
                String sql2 = "insert into orderitem (orderID,itemID,productID,description,stock,quantity,listPrice) values (" + value2 + ")";
                try (PreparedStatement statement = connection.prepareStatement(sql2))
                {
                    statement.executeUpdate();
                }

                //更新库存
                int newStock = cartItem.getStock() - cartItem.getQuantity();
                String sql3 = "update item set stock = '" + newStock + "' where itemID ='" + cartItem.getItemID() + "'";
                try (PreparedStatement statement = connection.prepareStatement(sql3))
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
    public void deleteOrder(String orderID)//为了方便，"删除订单"时默认订单已完成，不再复原库存
    {
        try (Connection connection = DBUtils.getConnection())
        {
            String sql = "delete from orderlist where orderID ='" + orderID + "'";
            try (PreparedStatement statement = connection.prepareStatement(sql))
            {
                statement.executeUpdate();
            }
            String sql2 = "delete from orderitem where orderID ='" + orderID + "'";
            try (PreparedStatement statement = connection.prepareStatement(sql2))
            {
                statement.executeUpdate();
            }
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Order selectOrder(String orderID)
    {
        Order order = new Order();
        try (Connection connection = DBUtils.getConnection())
        {
            String sql = "select * from orderlist where orderID ='" + orderID + "'";
            try (PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql))
            {
                if (res.next())
                {
                    String orderTime = res.getString("orderTime");
                    String payTime = res.getString("payTime");

                    String receiverName = res.getString("receiverName");
                    String phoneNumber = res.getString("phoneNumber");
                    String country = res.getString("country");
                    String province = res.getString("province");
                    String city = res.getString("city");
                    String district = res.getString("district");
                    String detailedAddress = res.getString("detailedAddress");

                    BigDecimal totalPrice = res.getBigDecimal("totalPrice");
                    String payMethod = res.getString("payMethod");

                    Receiver receiver = new Receiver();
                    receiver.setReceiverName(receiverName);
                    receiver.setPhoneNumber(phoneNumber);
                    receiver.setCountry(country);
                    receiver.setProvince(province);
                    receiver.setCity(city);
                    receiver.setDistrict(district);
                    receiver.setDetailedAddress(detailedAddress);

                    order.setOrderID(orderID);
                    order.setOrderTime(orderTime);
                    order.setPayTime(payTime);
                    order.setReceiver(receiver);
                    order.setTotalPrice(totalPrice);
                    order.setPayMethod(payMethod);
                }

            }

            String sql2 = "select * from orderitem where orderID ='" + orderID + "'";
            try (PreparedStatement statement = connection.prepareStatement(sql2); ResultSet res = statement.executeQuery(sql2))
            {
                while (res.next())
                {
                    String itemID = res.getString("itemID");
                    String productID = res.getString("productID");
                    String description = res.getString("description");
                    int stock = res.getInt("stock");
                    int quantity = res.getInt("quantity");
                    BigDecimal listPrice = res.getBigDecimal("listPrice");

                    CartItem cartItem = new CartItem(itemID, productID, description, stock, quantity, listPrice);
                    order.getCartItemList().add(cartItem);
                }
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
            while (res.next())
            {
                String nextOrderID = res.getString("orderID");
                String orderTime = res.getString("orderTime");
                BigDecimal totalPrice = res.getBigDecimal("totalPrice");

                Order order = new Order();
                order.setOrderID(nextOrderID);
                order.setOrderTime(orderTime);
                order.setTotalPrice(totalPrice);
                orderList.add(order);
            }
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
        return orderList;
    }
}
