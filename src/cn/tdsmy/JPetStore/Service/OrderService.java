package cn.tdsmy.JPetStore.Service;

import cn.tdsmy.JPetStore.Entity.Order;
import cn.tdsmy.JPetStore.Entity.Receiver;
import com.alibaba.fastjson.JSONArray;

import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/25 8:38
 * @Version 1.0
 */
public interface OrderService {
    public List<Receiver> getReceiver(String username);//查询默认收件人信息

    public void addOrder(String username, Order order, JSONArray cart, JSONArray index);//提交订单

    public void deleteOrder(String orderID);//删除订单

    public String getTimeNow();

    public String createOrderID();

    List<Order> getOrder(String username);

    Order getDetails(String orderID);
}
