package cn.tdsmy.JPetStore.Controller;

import cn.tdsmy.JPetStore.Entity.Order;
import cn.tdsmy.JPetStore.Entity.Receiver;
import cn.tdsmy.JPetStore.Entity.User;
import cn.tdsmy.JPetStore.Service.LogService;
import cn.tdsmy.JPetStore.Service.OrderService;
import cn.tdsmy.JPetStore.Service.impl.LogServiceImpl;
import cn.tdsmy.JPetStore.Service.impl.OrderServiceImpl;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/28 20:34
 * @Version 1.0
 */

@WebServlet("/Order/*")
public class OrderServlet extends HttpServlet {
    private OrderService orderService;
    private LogService logService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        urlDistribute(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        urlDistribute(req, resp);
    }

    public void urlDistribute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (orderService == null) {
            orderService = new OrderServiceImpl();
        }
        if (logService == null) {
            logService = new LogServiceImpl();
        }

        String url = req.getPathInfo();
        switch (url) {
            case "/showOrderSubmit":
                showOrderSubmit(req, resp);//查看订单详情
                break;
            case "/showMyOrder":
                showMyOrder(req, resp);//查看订单详情
                break;
            case "/showOrderDetails":
                showOrderDetails(req, resp);//查看订单详情
                break;
            case "/newOrder":
                newOrder(req, resp);//提交订单
                break;
            case "/deleteOrder":
                deleteOrder(req, resp);//删除订单
                break;
            case "/getAddress":
                getAddress(req, resp);
                break;
            case "/getData":
                getData(req, resp);
                break;
            case "/getOrder":
                getOrder(req, resp);
                break;
            case "/getDetails":
                getDetails(req, resp);
                break;
        }
    }

    public void showOrderSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/Order/OrderSubmit.jsp").forward(req, resp);
    }

    public void showMyOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/Order/MyOrder.jsp").forward(req, resp);
    }

    public void showOrderDetails(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/Order/OrderDetails.jsp").forward(req, resp);
    }

    /**
     * 参数/deleteOrder?orderID=
     */
    public void deleteOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String orderID = req.getParameter("orderID");
        orderService.deleteOrder(orderID);
        System.out.println("删除订单" + orderID);

        logService.addLog(req, "Delete", "Delete除订单，orderID=" + orderID, "true");
    }


    public void getAddress(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        List<Receiver> receiverList = orderService.getReceiver(user.getUsername());

        resp.setContentType("text/plain");
        resp.setCharacterEncoding("UTF-8");
        resp.setHeader("Access-Control-Allow-Origin", "*");//跨域，这里其实不需要设置
        resp.getWriter().print(JSON.toJSONString(receiverList));
    }

    public void getData(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        JSONObject obj = (JSONObject) req.getSession().getAttribute("cart_data");

        resp.setContentType("text/plain");
        resp.setCharacterEncoding("UTF-8");
        resp.setHeader("Access-Control-Allow-Origin", "*");//跨域，这里其实不需要设置
        resp.getWriter().print(JSON.toJSONString(obj));
    }

    public void getOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        List<Order> orderList = orderService.getOrder(user.getUsername());

        resp.setContentType("text/plain");
        resp.setCharacterEncoding("UTF-8");
        resp.setHeader("Access-Control-Allow-Origin", "*");//跨域，这里其实不需要设置
        resp.getWriter().print(JSON.toJSONString(orderList));
        System.out.println(JSON.toJSONString(orderList));
    }

    public void getDetails(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String orderID = req.getParameter("orderID");
        Order order = orderService.getDetails(orderID);
        System.out.println("huoqudingdanshuju");

        resp.setContentType("text/plain");
        resp.setCharacterEncoding("UTF-8");
        resp.setHeader("Access-Control-Allow-Origin", "*");//跨域，这里其实不需要设置
        resp.getWriter().print(JSON.toJSONString(order));
        System.out.println(JSON.toJSONString(order));
    }

    public void newOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BufferedReader streamReader = new BufferedReader(new InputStreamReader(req.getInputStream(), "UTF-8"));
        StringBuilder responseStrBuilder = new StringBuilder();
        String inputStr;
        while ((inputStr = streamReader.readLine()) != null) {
            responseStrBuilder.append(inputStr);
        }
        JSONObject obj = JSONObject.parseObject(responseStrBuilder.toString());

        User user = (User) req.getSession().getAttribute("user");
        String orderID = orderService.createOrderID();
        String orderTime = orderService.getTimeNow();

        String receiverName = (String) obj.get("name");
        String phoneNumber = (String) obj.get("tel");
        String address = (String) obj.get("adr");
        Receiver receiver = new Receiver(receiverName, phoneNumber, address);

        JSONObject cart_data = (JSONObject) req.getSession().getAttribute("cart_data");
        Object totalPrice = cart_data.get("cost");
        String payMethod = (String) obj.get("pay");
        //TODO 只能转为jsonArray，无法转为List
        JSONArray cart_info = (JSONArray) cart_data.get("cart_info");
        JSONArray item_index = (JSONArray) cart_data.get("item_index");


        Order order = new Order();
        order.setOrderID(orderID);
        order.setOrderTime(orderTime);
        order.setReceiver(receiver);
        if (totalPrice instanceof Integer) {
            order.setTotalPrice(new BigDecimal(totalPrice.toString()));//Integer->String->BigDecimal
        }
        else if (totalPrice instanceof BigDecimal) {
            order.setTotalPrice((BigDecimal) totalPrice);
        }
        order.setPayMethod(payMethod);

        orderService.addOrder(user.getUsername(), order, cart_info, item_index);
    }


}
