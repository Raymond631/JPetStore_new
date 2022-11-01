package cn.tdsmy.JPetStore.Controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Author:liliyyyyy
 * @Date: 2022/10/27 23:14
 * @Version 1.0
 */

//跳转到注册界面
    @WebServlet(urlPatterns = {"/newAccountForm"})
public class UserNewFormServlet extends HttpServlet {
    private static final String NEWACCOUNTFORM = "/WEB-INF/jsp/User/user.jsp";
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher(NEWACCOUNTFORM).forward(req,resp);
    }
}
