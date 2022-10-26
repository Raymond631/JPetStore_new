package cn.tdsmy.JPetStore.Service;

import cn.tdsmy.JPetStore.Entity.Order;
import cn.tdsmy.JPetStore.Entity.User;

import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/25 8:38
 * @Version 1.0
 */
public interface OrderService
{
    public User selectReceiver(String username);//查询默认收件人信息

    public void addOrder(String username, Order order);//提交订单

    public void deleteOrder(String OrderID);//删除订单

    public Order selectOrder(String OrderID);//查询订单详情

    public List<Order> selectOrderList(String username);//查询历史订单

    public String getTimeNow();

    public String createOrderID();
}
