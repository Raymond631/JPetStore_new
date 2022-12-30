package cn.tdsmy.JPetStore.Controller;

import cn.tdsmy.JPetStore.Entity.Receiver;
import cn.tdsmy.JPetStore.Entity.User;
import cn.tdsmy.JPetStore.Service.LogService;
import cn.tdsmy.JPetStore.Service.UserService;
import cn.tdsmy.JPetStore.Service.impl.LogServiceImpl;
import cn.tdsmy.JPetStore.Service.impl.UserServiceImpl;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author:liliyyyyy
 * @Date: 2022/10/28 13:04
 * @Version 1.0
 */
@WebServlet("/User/*")
public class UserServlet extends HttpServlet {
    private UserService userService;
    private LogService logService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        urlDistribute(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        urlDistribute(req, resp);
    }

    public void urlDistribute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (userService == null) {
            userService = new UserServiceImpl();
        }
        if (logService == null) {
            logService = new LogServiceImpl();
        }

        String url = req.getPathInfo();
        switch (url) {
            case "/showLogin"://登录页面
                showLogin(req, resp);
                break;
            case "/showRegister"://注册页面
                showRegister(req, resp);
                break;
            case "/SelfCenter"://个人中心
                SelfCenter(req, resp);
                break;
            case "/verificationCode"://验证码
                verificationCode(req, resp);
                break;
            case "/login"://登录判断
                login(req, resp);
                break;
            case "/register"://注册判断
                register(req, resp);
                break;
            case "/changePassword"://修改密码
                changePassword(req, resp);
                break;
            case "/signOut"://退出登录
                signOut(req, resp);
                break;
            //下面的为AJAX
            case "/UsernameExist"://判断用户名是否存在
                userExist(req, resp);
                break;
            case "/checkPassword":
                checkPassword(req, resp);
                break;
            case "/updateReceiver"://更新收件人信息
                updateReceiver(req, resp);
                break;


        }
    }

    public void showLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        logService.addLog(req, "Other", "跳往登录界面", "true");
        req.getRequestDispatcher("/WEB-INF/jsp/User/Login.jsp").forward(req, resp);
    }

    public void showRegister(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        logService.addLog(req, "Other", "跳往注册界面", "true");
        req.getRequestDispatcher("/WEB-INF/jsp/User/Register.jsp").forward(req, resp);
    }

    public void SelfCenter(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        logService.addLog(req, "Read", "查看个人中心", "true");
        req.getRequestDispatcher("/WEB-INF/jsp/User/SelfCenter.jsp").forward(req, resp);
    }

    public void verificationCode(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int width = 60;
        int height = 20;
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);//创建内存图像
        Graphics2D g = (Graphics2D) image.getGraphics();//获取图片画笔

        //画背景
        g.setColor(Color.WHITE);
        g.fillRect(0, 0, width, height);

        // 画边框
        g.setColor(Color.BLACK);
        g.drawRect(0, 0, width - 1, height - 1);

        //产生随机验证码
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";//
        char[] rands = new char[4];
        for (int i = 0; i < 4; i++) {
            int rand = (int) (Math.random() * 36);
            rands[i] = chars.charAt(rand);
        }
        HttpSession session = req.getSession();
        session.setAttribute("checkCode", new String(rands));

        //画字符
        g.setColor(Color.BLACK);
        g.setFont(new Font(null, Font.ITALIC | Font.BOLD, 18));//18号字，斜体加粗
        g.drawString("" + rands[0], 1, 17);
        g.drawString("" + rands[1], 16, 15);
        g.drawString("" + rands[2], 31, 18);
        g.drawString("" + rands[3], 46, 16);

        //画干扰点
        for (int i = 0; i < 120; i++) {
            int x = (int) (Math.random() * width);//坐标
            int y = (int) (Math.random() * height);

            int red = (int) (Math.random() * 255);//颜色
            int green = (int) (Math.random() * 255);
            int blue = (int) (Math.random() * 255);
            g.setColor(new Color(red, green, blue));

            g.drawOval(x, y, 1, 0);
        }

        // 画干扰线
//        g.setColor(Color.GREEN);
//        for (int i = 0; i < 4; i++) {
//            int x1 = (int) (Math.random() * width);
//            int y1 = (int) (Math.random() * height);
//            int x2 = (int) (Math.random() * width);
//            int y2 = (int) (Math.random() * height);
//            g.drawLine(x1, y1, x2, y2);
//        }

        //画完图像后，释放画笔
        g.dispose();

        //将图像传到客户端
        try (ServletOutputStream sos = resp.getOutputStream(); ByteArrayOutputStream baos = new ByteArrayOutputStream()) {
            resp.setContentType("image/jpeg");
            //设置浏览器不要缓存此图片
            resp.setHeader("Pragma", "No-cache");
            resp.setHeader("Cache-Control", "no-cache");
            resp.setDateHeader("Expires", 0);//过期时间

            ImageIO.write(image, "JPEG", baos);//写入二进制流
            byte[] buffer = baos.toByteArray();//转为二进制数组
            resp.setContentLength(buffer.length);//设置长度
            sos.write(buffer);//传回客户端
        }
    }

    public void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String vCode = req.getParameter("vCode");//获得输入的验证码值
        String checkCode = (String) req.getSession().getAttribute("checkCode");//获取图片的值
        if (!vCode.equalsIgnoreCase(checkCode))//验证码错误
        {
            req.setAttribute("messageBox", "验证码错误！");
            logService.addLog(req, "Other", "登录验证码错误", "false");
            req.getRequestDispatcher("/WEB-INF/jsp/User/Login.jsp").forward(req, resp);
        }
        else {
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);

            if (userService.login(user))//登录成功
            {
                if (username.equals("root"))//超级管理员，登录后台界面
                {
                    req.getSession().setAttribute("user", user);
                    logService.addLog(req, "Read", "管理员查看用户日志" + username, "true");
                    resp.sendRedirect(req.getContextPath() + "/BackStage/IndexBack");
                }
                else//普通用户
                {
                    req.getSession().setAttribute("user", user);//通过session保持登录状态
                    logService.addLog(req, "Read", "登录,username=" + username, "true");
                    resp.sendRedirect(req.getContextPath());
                }
            }
            else//用户名或密码错误
            {
                req.setAttribute("messageBox", "用户名或密码错误！");
                logService.addLog(req, "Read", "用户名或密码错误，登录失败", "false");
                req.getRequestDispatcher("/WEB-INF/jsp/User/Login.jsp").forward(req, resp);
            }
        }
    }

    public void register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String vCode = req.getParameter("vCode");//获得输入的验证码值
        String checkCode = (String) req.getSession().getAttribute("checkCode");//获取图片的值
        if (!vCode.equalsIgnoreCase(checkCode))//验证码错误
        {
            req.setAttribute("messageBox", "验证码错误！");
            logService.addLog(req, "Other", "注册验证码错误", "false");
            req.getRequestDispatcher("/WEB-INF/jsp/User/Register.jsp").forward(req, resp);
        }
        else {
            //获取用户输入的用户名和密码
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            String password_repeat = req.getParameter("password_repeat");
            if (!password.equals(password_repeat)) {
                req.setAttribute("messageBox", "两次输入的密码不一致！");

                logService.addLog(req, "Read", "两次输入的密码不一致，无法注册", "false");
                req.getRequestDispatcher("/WEB-INF/jsp/User/Register.jsp").forward(req, resp);
            }
            else {
                User user = new User();
                user.setUsername(username);
                user.setPassword(password);

                if (userService.register(user))//注册成功（进行用户名查重）
                {
                    req.getSession().setAttribute("user", user);
                    logService.addLog(req, "Create", "注册新用户,username=" + username, "true");
                    resp.sendRedirect(req.getContextPath());//请求重定向，避免刷新时重复提交表单
                }
                else//用户名已存在
                {
                    req.setAttribute("messageBox", "用户名已存在！");

                    logService.addLog(req, "Read", "用户名重复，无法注册", "false");
                    req.getRequestDispatcher("/WEB-INF/jsp/User/Register.jsp").forward(req, resp);
                }
            }
        }
    }

    public void changePassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String vCode = req.getParameter("vCode");//获得输入的验证码值
        String checkCode = (String) req.getSession().getAttribute("checkCode");//获取图片的值
        if (!vCode.equalsIgnoreCase(checkCode))//验证码错误
        {
            req.setAttribute("messageBox", "验证码错误！");
            logService.addLog(req, "Other", "改密验证码错误", "false");
            req.getRequestDispatcher("/WEB-INF/jsp/User/SelfCenter.jsp").forward(req, resp);
        }
        else {
            User user = (User) req.getSession().getAttribute("user");
            String password_old = req.getParameter("password_old");
            String password_new = req.getParameter("password_new");
            String password_repeat = req.getParameter("password_repeat");
            System.out.println(password_old + ":" + password_new + ":" + password_repeat);
            if (!password_old.equals(user.getPassword())) {
                req.setAttribute("messageBox", "原密码错误！");
                logService.addLog(req, "Other", "改密原密码错误", "false");
                req.getRequestDispatcher("/WEB-INF/jsp/User/SelfCenter.jsp").forward(req, resp);
            }
            else {
                if (!password_new.equals(password_repeat)) {
                    req.setAttribute("messageBox", "两次输入的密码不一致！");
                    logService.addLog(req, "Other", "改密两次输入的密码不一致", "false");
                    req.getRequestDispatcher("/WEB-INF/jsp/User/SelfCenter.jsp").forward(req, resp);
                }
                else {
                    user.setPassword(password_new);
                    userService.changePassword(user);
                    logService.addLog(req, "Update", "修改密码", "true");
                    resp.sendRedirect("../");
                }
            }
        }
    }

    public void signOut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("user", null);

        logService.addLog(req, "Other", "退出登录", "true");
        resp.sendRedirect(req.getContextPath());
    }

    //下面的为AJAX
    public void userExist(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        User user = new User();
        user.setUsername(username);

        resp.setContentType("text/plain");
        resp.setHeader("Access-Control-Allow-Origin", "*");
        PrintWriter out = resp.getWriter();
        if (userService.registerSuccess(user))//注册成功（进行用户名查重）
        {
            out.print("");
        }
        else//用户名已存在
        {
            out.print("用户名已存在");
        }
    }

    public void checkPassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BufferedReader streamReader = new BufferedReader(new InputStreamReader(req.getInputStream(), "UTF-8"));
        StringBuilder responseStrBuilder = new StringBuilder();
        String inputStr;
        while ((inputStr = streamReader.readLine()) != null) {
            responseStrBuilder.append(inputStr);
        }
        JSONObject obj = JSONObject.parseObject(responseStrBuilder.toString());
        String password_old = (String) obj.get("password");

        User user = (User) req.getSession().getAttribute("user");
        String password = user.getPassword();

        resp.setContentType("text/plain");
        resp.setHeader("Access-Control-Allow-Origin", "*");
        PrintWriter out = resp.getWriter();
        if (password_old.equals(password))//原密码输入正确
        {
            out.print("");
        }
        else {
            out.print("原密码有误，请重新输入！");
        }
    }

    public void updateReceiver(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BufferedReader streamReader = new BufferedReader(new InputStreamReader(req.getInputStream(), "UTF-8"));
        StringBuilder responseStrBuilder = new StringBuilder();
        String inputStr;
        while ((inputStr = streamReader.readLine()) != null) {
            responseStrBuilder.append(inputStr);
        }
        //TODO 后端解析json数组
        JSONArray arr = JSONArray.parseArray(responseStrBuilder.toString());
        List<Receiver> receiverList = new ArrayList<>();
        for (int i = 0; i < arr.size(); i++) {
            JSONObject object = (JSONObject) arr.get(i);
            Receiver receiver = new Receiver();
            receiver.setReceiverName((String) object.get("name"));
            receiver.setPhoneNumber((String) object.get("tel"));
            receiver.setAddress((String) object.get("adr"));
            receiverList.add(receiver);
        }

        User user = (User) req.getSession().getAttribute("user");
        userService.updateReceiver(user.getUsername(), receiverList);
    }

}
