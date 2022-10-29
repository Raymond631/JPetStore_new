package cn.tdsmy.JPetStore.Controller;

import cn.tdsmy.JPetStore.Entity.CartItem;
import cn.tdsmy.JPetStore.Service.CartService;
import cn.tdsmy.JPetStore.Service.impl.CartServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Enumeration;
import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/23 23:28
 * @Version 1.0
 */

@WebServlet("/Cart/*")
public class CartServlet extends HttpServlet
{
    private CartService cartService;

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
        if (cartService == null)
        {
            cartService = new CartServiceImpl();
        }
        
        /*
          req.getContextPath();  //web应用根路径，如/JPetStore_war_exploded
          req.getServletPath();  //servlet映射路径，如/Cart
          req.getPathInfo();     //与getServletPath()获取的路径互补，能得到模糊匹配*的路径部分 ，如/cartList
          req.getRequestURI();   //除去host和端口号之外的所有路径，如/JPetStore_war_exploded/Cart/cartList
         */
        String url = req.getPathInfo();
        switch (url)
        {
            case "/cartList":
                cartList(req, resp);
                break;
            case "/updateCart":
                updateCart(req, resp);
                break;
            case "/removeCartItem":
                removeCartItem(req, resp);
                break;
        }
    }

    /**
     * get请求
     */
    public void cartList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        List<CartItem> cartItemList = cartService.selectCartList("j2ee");
        BigDecimal allCost = cartService.calculateAllCost(cartItemList);

        req.getSession().setAttribute("cartItemList", cartItemList);
        req.getSession().setAttribute("allCost", allCost);

        req.getRequestDispatcher("/WEB-INF/jsp/Cart/Cart.jsp").forward(req, resp);
    }

    /**
     * post请求
     */
    public void updateCart(HttpServletRequest req, HttpServletResponse resp) throws IOException
    {
        Enumeration<String> itemList = req.getParameterNames();
        while (itemList.hasMoreElements())
        {
            String item = itemList.nextElement();
            String quantity = String.valueOf(req.getParameter(item));
            cartService.updateCart("j2ee", item, quantity);
        }
        resp.sendRedirect(req.getContextPath() + "/Cart/cartList");
    }

    /**
     * get请求
     * url带参数 /removeCartItem?cartItem=
     */
    public void removeCartItem(HttpServletRequest req, HttpServletResponse resp) throws IOException
    {
        String item = req.getQueryString().substring(9);
        cartService.removeCartItem("j2ee", item);
        resp.sendRedirect(req.getContextPath() + "/Cart/cartList");
    }
}
