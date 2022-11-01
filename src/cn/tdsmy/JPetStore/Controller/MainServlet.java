package cn.tdsmy.JPetStore.Controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Author:liliyyyyy
 * @Date: 2022/10/28 19:09
 * @Version 1.0
 */
@WebServlet("/main")
public class MainServlet extends HttpServlet {

    private static final String MAIN = "/WEB-INF/jsp/Main/Main.jsp";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher(MAIN).forward(req,resp);
    }
}
