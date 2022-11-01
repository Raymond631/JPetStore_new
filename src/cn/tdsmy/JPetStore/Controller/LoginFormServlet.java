package cn.tdsmy.JPetStore.Controller;

import cn.tdsmy.JPetStore.Entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Author:liliyyyyy
 * @Date: 2022/10/28 13:00
 * @Version 1.0
 */
@WebServlet("/signonForm")
public class LoginFormServlet extends HttpServlet {
    private static final String LOGINFORM = "/WEB-INF/jsp/User/LoginForm.jsp";
    private User user;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher(LOGINFORM).forward(req,resp);
    }
}
