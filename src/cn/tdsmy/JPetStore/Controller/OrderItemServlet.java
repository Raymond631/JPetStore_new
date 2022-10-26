package cn.tdsmy.JPetStore.Controller;

import cn.tdsmy.JPetStore.Entity.CartItem;
import cn.tdsmy.JPetStore.Entity.Order;
import cn.tdsmy.JPetStore.Entity.User;
import cn.tdsmy.JPetStore.Service.OrderService;
import cn.tdsmy.JPetStore.Service.impl.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/24 23:01
 * @Version 1.0
 */

@WebServlet("/Order/orderItem")
public class OrderItemServlet extends HttpServlet
{
    private OrderService orderService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        if (orderService == null)
        {
            orderService = new OrderServiceImpl();
        }

        String param = req.getQueryString();
        if (param.equals("newOrder"))
        {
            Order order = new Order();
            order.setPayTime(orderService.getTimeNow());
            order.setOrderTime((String) req.getSession().getAttribute("OrderTime"));
            order.setOrderID(orderService.createOrderID());
            order.setReceiver((User) req.getSession().getAttribute("receiver"));
            order.setCartItemList((List<CartItem>) req.getSession().getAttribute("cartItemList"));
            order.setTotalPrice((BigDecimal) req.getSession().getAttribute("allCost"));
            order.setPayMethod(req.getParameter("payMethod"));

            orderService.addOrder("j2ee", order);//插入数据库
            req.setAttribute("order", order);//传参
        }
        else
        {
            Order order = orderService.selectOrder(param);
            req.setAttribute("order", order);//传参
        }
        req.getRequestDispatcher("/WEB-INF/jsp/Order/OrderItem.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        doGet(req, resp);
    }
}
