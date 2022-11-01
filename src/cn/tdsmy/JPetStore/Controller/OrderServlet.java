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
 * @Date: 2022/10/28 20:34
 * @Version 1.0
 */

@WebServlet("/Order/*")
public class OrderServlet extends HttpServlet
{
    private OrderService orderService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        urlDistribute(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        urlDistribute(req, resp);
    }

    public void urlDistribute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        if (orderService == null)
        {
            orderService = new OrderServiceImpl();
        }

        String url = req.getPathInfo();
        switch (url)
        {
            case "/orderSubmit":
                orderSubmit(req, resp);
                break;
            case "/orderPay":
                orderPay(req, resp);
                break;
            case "/newOrder":
                newOrder(req, resp);
                break;
            case "/deleteOrder":
                deleteOrder(req, resp);
                break;
            case "/orderList":
                orderList(req, resp);
                break;
            case "/orderItem":
                orderItem(req, resp);
                break;
        }
    }

    /**
     * get请求
     */
    public void orderSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        User receiver = orderService.selectReceiver("j2ee");
        req.setAttribute("receiver", receiver);

        req.getRequestDispatcher("/WEB-INF/jsp/Order/OrderSubmit.jsp").forward(req, resp);
    }

    /**
     * post请求
     */
    public void orderPay(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        String Name = req.getParameter("Name");
        String Phone = req.getParameter("Phone");
        String Country = req.getParameter("Country");
        String Province = req.getParameter("Province");
        String City = req.getParameter("City");
        String District = req.getParameter("District");
        String Address = req.getParameter("Address");

        User receiver = new User();
        receiver.setReceiverName(Name);
        receiver.setPhoneNumber(Phone);
        receiver.setCountry(Country);
        receiver.setProvince(Province);
        receiver.setCity(City);
        receiver.setDistrict(District);
        receiver.setDetailedAddress(Address);
        req.getSession().setAttribute("receiver", receiver);

        req.getRequestDispatcher("/WEB-INF/jsp/Order/OrderPay.jsp").forward(req, resp);
    }

    /**
     * post请求
     */
    public void newOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        Order order = new Order();
        order.setOrderID(orderService.createOrderID());
        order.setOrderTime((String) req.getSession().getAttribute("OrderTime"));
        order.setPayTime(orderService.getTimeNow());
        order.setReceiver((User) req.getSession().getAttribute("receiver"));
        order.setCartItemList((List<CartItem>) req.getSession().getAttribute("cartItemList"));

        order.setTotalPrice((BigDecimal) req.getSession().getAttribute("allCost"));
        order.setPayMethod(req.getParameter("payMethod"));

        orderService.addOrder("j2ee", order);//插入数据库

        req.setAttribute("order", order);
        req.setAttribute("newOrder", true);

        req.getRequestDispatcher("/WEB-INF/jsp/Order/OrderItem.jsp").forward(req, resp);
    }

    /**
     * get请求
     * 参数/deleteOrder?orderID=
     */
    public void deleteOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        String OrderID = req.getParameter("orderID");
        orderService.deleteOrder(OrderID);

        resp.sendRedirect(req.getContextPath() + "/Order/orderList");
    }

    /**
     * get请求
     */
    public void orderList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        List<Order> orderList = orderService.selectOrderList("j2ee");
        req.setAttribute("orderList", orderList);

        req.getRequestDispatcher("/WEB-INF/jsp/Order/OrderList.jsp").forward(req, resp);
    }

    /**
     * 查看订单详情为get请求,参数/orderItem?orderID=
     */
    public void orderItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        String param = req.getParameter("orderID");
        System.out.println(param);
        Order order = orderService.selectOrder(param);
        req.setAttribute("order", order);
        req.setAttribute("newOrder", false);

        req.getRequestDispatcher("/WEB-INF/jsp/Order/OrderItem.jsp").forward(req, resp);
    }
}
