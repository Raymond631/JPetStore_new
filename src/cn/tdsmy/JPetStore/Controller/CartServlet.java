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
import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/23 23:28
 * @Version 1.0
 */

@WebServlet("/Cart")
public class CartServlet extends HttpServlet
{
    private CartService cartService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        if (cartService == null)
        {
            cartService = new CartServiceImpl();
        }

        List<CartItem> cartItemList = cartService.selectCartList("j2ee");
        BigDecimal allCost = cartService.calculateAllCost(cartItemList);

        req.getSession().setAttribute("cartItemList", cartItemList);
        req.getSession().setAttribute("allCost", allCost);

        req.getRequestDispatcher("/WEB-INF/jsp/Cart/Cart.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        doGet(req, resp);
    }
}
