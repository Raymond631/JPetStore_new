package cn.tdsmy.JPetStore.Controller;

import cn.tdsmy.JPetStore.Service.CartService;
import cn.tdsmy.JPetStore.Service.impl.CartServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Enumeration;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/24 19:56
 * @Version 1.0
 */

@WebServlet("/Cart/updateCart")
public class CartUpdateServlet extends HttpServlet
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

        Enumeration<String> itemList = req.getParameterNames();
        while (itemList.hasMoreElements())
        {
            String item = itemList.nextElement();
            String quantity = String.valueOf(req.getParameter(item));
            cartService.updateCart("j2ee", item, quantity);
        }
        resp.sendRedirect(req.getContextPath() + "/Cart");
    }
}
