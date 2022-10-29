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
                        + cartItem.getStock() + "','"
                        + cartItem.getQuantity() + "','"
                        + cartItem.getListPrice() + "','"
                        + order.getTotalPrice() + "','"
                        + order.getPayMethod() + "'";

                //注意: order是mysql关键字，不可用作表名
                //order表保存下单时的商品快照信息，stock是下单前的库存
                String sql1 = "insert into orderlist (username,orderID,orderTime,payTime,receiverName,phoneNumber,country,province," +
                        "city,district,detailedAddress,itemID,productID,description,stock,quantity,listPrice,totalPrice,payMethod) values (" + value + ")";

                try (PreparedStatement statement1 = connection.prepareStatement(sql1))
                {
                    statement1.executeUpdate();
                }

                //更新库存
                int newStock = cartItem.getStock() - cartItem.getQuantity();
                String sql2 = "update pet set stock = '" + newStock + "' where itemID ='" + cartItem.getItemID() + "'";
                try (PreparedStatement statement2 = connection.prepareStatement(sql2))
                {
                    statement2.executeUpdate();
                }
            }
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void deleteOrder(String orderID)//为了方便，删除订单 默认订单已完成，不再做库存复原操作
    {
        String sql = "delete from orderlist where orderID ='" + orderID + "'";
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
    public Order selectOrder(String orderID)
    {
        Order order = new Order();
        order.setCartItemList(new ArrayList<>());
        String sql = "select * from orderlist where orderID ='" + orderID + "'";
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql))
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
                String itemID = res.getString("itemID");
                String productID = res.getString("productID");
                String description = res.getString("description");
                int stock = res.getInt("stock");
                int quantity = res.getInt("quantity");
                BigDecimal listPrice = res.getBigDecimal("listPrice");
                BigDecimal totalPrice = res.getBigDecimal("totalPrice");
                String payMethod = res.getString("payMethod");

                User receiver = new User();
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

                CartItem cartItem = new CartItem(itemID, productID, description, stock, quantity, listPrice);
                System.out.println(cartItem);
                order.getCartItemList().add(cartItem);
            }
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
                    BigDecimal totalPrice = res.getBigDecimal("totalPrice");

                    Order order = new Order();
                    order.setOrderID(nextOrderID);
                    order.setOrderTime(orderTime);
                    order.setTotalPrice(totalPrice);
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
