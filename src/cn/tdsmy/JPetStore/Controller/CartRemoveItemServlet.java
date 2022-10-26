package cn.tdsmy.JPetStore.Controller;

import cn.tdsmy.JPetStore.Service.CartService;
import cn.tdsmy.JPetStore.Service.impl.CartServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/24 21:06
 * @Version 1.0
 */

@WebServlet("/Cart/removeCartItem")
public class CartRemoveItemServlet extends HttpServlet
{
    private CartService cartService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        if (cartService == null)
        {
            cartService = new CartServiceImpl();
        }

        String item = req.getQueryString().substring(9);
        cartService.removeCartItem("j2ee", item);
        resp.sendRedirect(req.getContextPath() + "/Cart");
    }
}
