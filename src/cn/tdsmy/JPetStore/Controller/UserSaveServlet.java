package cn.tdsmy.JPetStore.Controller;

import cn.tdsmy.JPetStore.Entity.User;
import cn.tdsmy.JPetStore.Service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @Author:liliyyyyy
 * @Date: 2022/10/28 18:18
 * @Version 1.0
 */
@WebServlet("/saveUser")
public class UserSaveServlet extends HttpServlet {
    private static final String EDITUSER = "/WEB-INF/jsp/User/UserEdit.jsp";

    private User user;
    private UserService userService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        user = (User)session.getAttribute("user");
        user = null;
        session.setAttribute("user",user);


        //获取用户输入的信息
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String ReceiverName = req.getParameter("ReceiverName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String country = req.getParameter("country");
        String province = req.getParameter("province");
        String city = req.getParameter("city");
        String district = req.getParameter("district");
        String detailedAddress = req.getParameter("detailedAddress");

        user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setReceiverName(ReceiverName);
        user.setEmail(email);
        user.setPhoneNumber(phone);
        user.setCountry(country);
        user.setProvince(province);
        user.setCity(city);
        user.setDistrict(district);
        user.setDetailedAddress(detailedAddress);

        req.getRequestDispatcher(EDITUSER).forward(req,resp);



    }
}
