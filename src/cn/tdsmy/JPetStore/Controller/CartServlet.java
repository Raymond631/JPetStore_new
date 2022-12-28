package cn.tdsmy.JPetStore.Controller;

import cn.tdsmy.JPetStore.Entity.CartJson;
import cn.tdsmy.JPetStore.Entity.User;
import cn.tdsmy.JPetStore.Service.CartService;
import cn.tdsmy.JPetStore.Service.LogService;
import cn.tdsmy.JPetStore.Service.impl.CartServiceImpl;
import cn.tdsmy.JPetStore.Service.impl.LogServiceImpl;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/23 23:28
 * @Version 1.0
 */

@WebServlet("/Cart/*")
public class CartServlet extends HttpServlet {
    private CartService cartService;
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
        if (cartService == null) {
            cartService = new CartServiceImpl();
        }
        if (logService == null) {
            logService = new LogServiceImpl();
        }

        String url = req.getPathInfo();
        switch (url) {
            case "/addCartItem":
                addCartItem(req, resp);//增
                break;
            case "/removeCartItem":
                removeCartItem(req, resp);//删
                break;
            case "/updateCart":
                updateCart(req, resp);//改
                break;
            case "/cartList":
                cartList(req, resp);//查
                break;
            case "/getData":
                getData(req, resp);//查
                break;
        }
    }


    /**
     * 注意：“增删改”用请求重定向，防止用户重复提交表单
     * 参数/addCartItem?itemID
     */
    public void addCartItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            logService.addLog(req, "Create", "加入购物车", "false");
            resp.sendRedirect(req.getContextPath() + "/User/showLogin");
        }
        else {
            String itemID = req.getParameter("itemID");
            cartService.addCartItem(user.getUsername(), itemID, 1);

            logService.addLog(req, "Create", "加入购物车,itemID=" + itemID, "true");
            resp.sendRedirect(req.getContextPath() + "/Cart/cartList");
        }
    }

    public void cartList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            logService.addLog(req, "Read", "查看购物车", "false");
            resp.sendRedirect(req.getContextPath() + "/User/showLogin");
        }
        else {
            logService.addLog(req, "Read", "查看购物车", "true");
            req.getRequestDispatcher("/WEB-INF/jsp/Cart/Cart.jsp").forward(req, resp);
        }
    }

    public void getData(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        List<CartJson> cartItemList = cartService.selectCartList(user.getUsername());

        //TODO 后端json响应标准格式
        resp.setContentType("text/plain");
        resp.setCharacterEncoding("UTF-8");
        resp.setHeader("Access-Control-Allow-Origin", "*");//跨域，这里其实不需要设置
        resp.getWriter().print(JSON.toJSONString(cartItemList));
    }

    public void updateCart(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        //TODO 后端json读取标准格式
        BufferedReader streamReader = new BufferedReader(new InputStreamReader(req.getInputStream(), "UTF-8"));
        StringBuilder responseStrBuilder = new StringBuilder();
        String inputStr;
        while ((inputStr = streamReader.readLine()) != null) {
            responseStrBuilder.append(inputStr);
        }
        JSONObject obj = JSONObject.parseObject(responseStrBuilder.toString());

        String itemID = (String) obj.get("itemID");
        int quantity = (int) obj.get("quantity");
        User user = (User) req.getSession().getAttribute("user");
        cartService.updateCart(user.getUsername(), itemID, quantity);

        logService.addLog(req, "Update", "修改购物车商品数量", "true");
        resp.sendRedirect(req.getContextPath() + "/Cart/cartList");
    }

    public void removeCartItem(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        BufferedReader streamReader = new BufferedReader(new InputStreamReader(req.getInputStream(), "UTF-8"));
        StringBuilder responseStrBuilder = new StringBuilder();
        String inputStr;
        while ((inputStr = streamReader.readLine()) != null) {
            responseStrBuilder.append(inputStr);
        }
        JSONObject obj = JSONObject.parseObject(responseStrBuilder.toString());

        String itemID = (String) obj.get("itemID");
        User user = (User) req.getSession().getAttribute("user");
        cartService.removeCartItem(user.getUsername(), itemID);

        logService.addLog(req, "Delete", "移出购物车，itemID=" + itemID, "true");
        resp.sendRedirect(req.getContextPath() + "/Cart/cartList");
    }

}
