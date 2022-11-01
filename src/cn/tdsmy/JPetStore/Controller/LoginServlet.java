package cn.tdsmy.JPetStore.Controller;

import cn.tdsmy.JPetStore.Entity.User;
import cn.tdsmy.JPetStore.Service.UserService;
import cn.tdsmy.JPetStore.Service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @Author:liliyyyyy
 * @Date: 2022/10/28 13:04
 * @Version 1.0
 */
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {

    private static final String LOGINFORM = "/WEB-INF/jsp/User/LoginForm.jsp";
    private static final String MAIN = "/WEB-INF/jsp/Main/Main.jsp";

    private User user;
    private UserService userService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        userService = new UserServiceImpl();
        user = userService.getUser(username);

        HttpSession session = req.getSession();
        session.setAttribute("user",user);

        //获得输入的验证码值
        String value1=req.getParameter("vCode");
        /*获取图片的值*/
        String value2=(String)session.getAttribute("checkcode");
        Boolean isSame = false;
        /*对比两个值（字母不区分大小写）*/
        if(value2.equalsIgnoreCase(value1)){
            isSame = true;
        }


        if (user == null || !isSame){
            if(!isSame){
                session.setAttribute("messageSignOn", "Invalid Verification Code.   Signon failed.");
            }else{
                session.setAttribute("messageSignOn", "Invalid username or password.  Signon failed.");
            }
            session.setAttribute("user", null);
            req.getRequestDispatcher(LOGINFORM).forward(req, resp);
        }else {
            user.setPassword(null);
            req.getRequestDispatcher(MAIN).forward(req, resp);
        }
    }
}
