package cn.tdsmy.JPetStore.Controller;

import cn.tdsmy.JPetStore.Entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @Author:liliyyyyy
 * @Date: 2022/10/29 23:04
 * @Version 1.0
 */
public class SignOffServlet extends HttpServlet {

    private static final String MAIN = "/WEB-INF/jsp/Main/Main.jsp";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User)session.getAttribute("user");
        user = null;
        session.setAttribute("user",user);
        req.getRequestDispatcher(MAIN).forward(req,resp);
    }
}
