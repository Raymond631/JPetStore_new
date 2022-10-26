package cn.tdsmy.JPetStore.Controller;

import cn.tdsmy.JPetStore.Service.OrderService;
import cn.tdsmy.JPetStore.Service.impl.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/26 23:11
 * @Version 1.0
 */

@WebServlet("/Order/deleteOrder")
public class OrderDeleteServlet extends HttpServlet
{
    private OrderService orderService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        if (orderService == null)
        {
            orderService = new OrderServiceImpl();
        }
        System.out.println("开始删除");
        String OrderID = req.getQueryString();
        orderService.deleteOrder(OrderID);

        resp.sendRedirect(req.getContextPath() + "/Order/orderList");
    }
}
