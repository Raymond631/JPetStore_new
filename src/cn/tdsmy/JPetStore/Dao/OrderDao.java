package cn.tdsmy.JPetStore.Dao;

import cn.tdsmy.JPetStore.Entity.Order;
import com.alibaba.fastjson.JSONArray;

import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/26 19:14
 * @Version 1.0
 */
public interface OrderDao {
    public void addOrder(String username, Order order, JSONArray cart, JSONArray index);//增

    public void deleteOrder(String orderID);//删

    public Order selectOrder(String orderID);//查询订单详情

    public List<Order> selectOrderList(String username);//查询历史订单
}
