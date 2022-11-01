package cn.tdsmy.JPetStore.Controller;

import cn.tdsmy.JPetStore.Entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @Author:liliyyyyy
 * @Date: 2022/10/28 18:08
 * @Version 1.0
 */
@WebServlet("/editAccountForm")
public class UserEditServlet extends HttpServlet {

    private static final String EDITUSER = "/WEB-INF/jsp/User/UserEdit.jsp";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User)session.getAttribute("user");
        req.getRequestDispatcher(EDITUSER).forward(req,resp);
    }
}
