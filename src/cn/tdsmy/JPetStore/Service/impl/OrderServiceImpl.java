package cn.tdsmy.JPetStore.Service.impl;

import cn.tdsmy.JPetStore.Dao.CartDao;
import cn.tdsmy.JPetStore.Dao.OrderDao;
import cn.tdsmy.JPetStore.Dao.UserDao;
import cn.tdsmy.JPetStore.Dao.impl.OrderDaoImpl;
import cn.tdsmy.JPetStore.Dao.impl.UserDaoImpl;
import cn.tdsmy.JPetStore.Entity.Order;
import cn.tdsmy.JPetStore.Entity.Receiver;
import cn.tdsmy.JPetStore.Service.OrderService;
import com.alibaba.fastjson.JSONArray;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/25 8:40
 * @Version 1.0
 */
public class OrderServiceImpl implements OrderService {
    private OrderDao orderDao;
    private UserDao userDao;//用于查询收件人
    private CartDao cartDao;//用于清空购物车

    private static int num = 1000;//用于生成订单号

    @Override
    public List<Receiver> getReceiver(String username) {
        if (userDao == null) {
            userDao = new UserDaoImpl();
        }
        return userDao.getReceiver(username);
    }

    @Override
    public void addOrder(String username, Order order, JSONArray cart, JSONArray index) {
        if (orderDao == null) {
            orderDao = new OrderDaoImpl();
        }
        orderDao.addOrder(username, order, cart, index);
    }

    @Override
    public void deleteOrder(String orderID) {
        if (orderDao == null) {
            orderDao = new OrderDaoImpl();
        }
        orderDao.deleteOrder(orderID);
    }

    @Override
    public List<Order> getOrder(String username) {
        if (orderDao == null) {
            orderDao = new OrderDaoImpl();
        }
        return orderDao.getOrder(username);
    }

    @Override
    public Order getDetails(String orderID) {
        if (orderDao == null) {
            orderDao = new OrderDaoImpl();
        }
        return orderDao.getDetails(orderID);
    }

    @Override
    public String getTimeNow() {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(date);
    }

    @Override
    public String createOrderID() {
        String time = getTimeNow().replaceAll("[[\\s-:punct:]]", "");

        String OrderID = time + num;
        num++;
        if (num > 9999)//1秒内的并发量小于9999，就不会重复
        {
            num = 1000;
        }
        return OrderID;
    }
}
