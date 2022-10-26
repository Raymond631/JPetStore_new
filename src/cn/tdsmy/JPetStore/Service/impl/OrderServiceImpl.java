package cn.tdsmy.JPetStore.Service.impl;

import cn.tdsmy.JPetStore.Dao.OrderDao;
import cn.tdsmy.JPetStore.Dao.UserDao;
import cn.tdsmy.JPetStore.Dao.impl.OrderDaoImpl;
import cn.tdsmy.JPetStore.Dao.impl.UserDaoImpl;
import cn.tdsmy.JPetStore.Entity.Order;
import cn.tdsmy.JPetStore.Entity.User;
import cn.tdsmy.JPetStore.Service.OrderService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/25 8:40
 * @Version 1.0
 */
public class OrderServiceImpl implements OrderService
{
    private UserDao userDao;
    private OrderDao orderDao;

    private static int num = 1000;

    @Override
    public User selectReceiver(String username)
    {
        if (userDao == null)
        {
            userDao = new UserDaoImpl();
        }
        return userDao.selectReceiver(username);
    }

    @Override
    public void addOrder(String username, Order order)
    {
        if (orderDao == null)
        {
            orderDao = new OrderDaoImpl();
        }
        orderDao.addOrder(username, order);
    }

    @Override
    public void deleteOrder(String OrderID)
    {
        if (orderDao == null)
        {
            orderDao = new OrderDaoImpl();
        }
        orderDao.deleteOrder(OrderID);
    }

    @Override
    public Order selectOrder(String OrderID)
    {
        if (orderDao == null)
        {
            orderDao = new OrderDaoImpl();
        }
        return orderDao.selectOrder(OrderID);
    }

    @Override
    public List<Order> selectOrderList(String username)
    {
        if (orderDao == null)
        {
            orderDao = new OrderDaoImpl();
        }
        return orderDao.selectOrderList(username);
    }

    @Override
    public String getTimeNow()
    {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(date);
    }

    @Override
    public String createOrderID()
    {
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
