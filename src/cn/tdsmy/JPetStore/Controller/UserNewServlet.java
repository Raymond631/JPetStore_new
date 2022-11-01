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
 * @Date: 2022/10/28 10:29
 * @Version 1.0
 */
@WebServlet("/newUser")
public class UserNewServlet extends HttpServlet {

    private static final String MAIN = "/WEB-INF/jsp/Main/Main.jsp";
    private static final String NEWUSERFORM = "/WEB-INF/jsp/User/user.jsp";

    private User user;
    private User user1;
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

        user1 = new User();
        user1.setUsername(username);
        user1.setPassword(password);
        user1.setReceiverName(ReceiverName);
        user1.setEmail(email);
        user1.setPhoneNumber(phone);
        user1.setCountry(country);
        user1.setProvince(province);
        user1.setCity(city);
        user1.setDistrict(district);
        user1.setDetailedAddress(detailedAddress);

        //获得输入的验证码值
        String value1=req.getParameter("vCode");
        /*获取图片的值*/
        String value2=(String)session.getAttribute("checkcode");
        Boolean isSame = false;
        /*对比两个值（字母不区分大小写）*/
        if(value2.equalsIgnoreCase(value1)){
            isSame = true;
        }
        if(isSame){
            userService = new UserServiceImpl();
            userService.insertUser(user1);
            req.getRequestDispatcher(MAIN).forward(req, resp);

        }else {
            session.setAttribute("messageAccount", "Invalid Verification Code.");
            req.getRequestDispatcher(NEWUSERFORM).forward(req, resp);
        }

    }
}

