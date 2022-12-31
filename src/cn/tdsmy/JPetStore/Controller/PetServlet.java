package cn.tdsmy.JPetStore.Controller;

import cn.tdsmy.JPetStore.Entity.Product;
import cn.tdsmy.JPetStore.Service.LogService;
import cn.tdsmy.JPetStore.Service.PetService;
import cn.tdsmy.JPetStore.Service.impl.LogServiceImpl;
import cn.tdsmy.JPetStore.Service.impl.PetServiceImpl;
import com.alibaba.fastjson.JSON;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/29 22:59
 * @Version 1.0
 */

@WebServlet("/Pet/*")
public class PetServlet extends HttpServlet {
    public PetService petService;
    private LogService logService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        urlDistribute(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        urlDistribute(req, resp);
    }

    public void urlDistribute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (petService == null) {
            petService = new PetServiceImpl();
        }
        if (logService == null) {
            logService = new LogServiceImpl();
        }

        String url = req.getPathInfo();
        switch (url) {
            case "/searchPet":
                searchPet(req, resp);//搜索
                break;
            case "/showDetails":
                showDetails(req, resp);
                break;
            //下面的为AJAX
            case "/searchTips":
                searchTips(req, resp);
                break;
            case "/getSearchData":
                getSearchData(req, resp);//搜索
                break;
            case "/getDetails":
                getDetails(req, resp);
                break;
        }
    }

    public void searchPet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String key = req.getParameter("keyword");
        logService.addLog(req, "Read", "搜索宠物,keyword=" + key, "true");
        req.getRequestDispatcher("/WEB-INF/jsp/Pet/PetSearch.jsp?keyword=" + key).forward(req, resp);
    }

    public void showDetails(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        req.getRequestDispatcher("/WEB-INF/jsp/Pet/details.jsp?name=" + name).forward(req, resp);
    }

    //下面的为AJAX
    public void searchTips(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyword = req.getParameter("keyword");
        List<String> ProductList = petService.searchTips(keyword);

        resp.setContentType("text/plain");
        resp.setCharacterEncoding("UTF-8");
        resp.setHeader("Access-Control-Allow-Origin", "*");//跨域，这里其实不需要设置
        resp.getWriter().print(JSON.toJSONString(ProductList));
    }

    public void getSearchData(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String key = req.getParameter("keyword");
        List<Product> productList = petService.searchPet(key);

        resp.setContentType("text/plain");
        resp.setCharacterEncoding("UTF-8");
        resp.setHeader("Access-Control-Allow-Origin", "*");//跨域，这里其实不需要设置
        resp.getWriter().print(JSON.toJSONString(productList));
    }

    public void getDetails(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        Product product = petService.getProduct(name);

        resp.setContentType("text/plain");
        resp.setCharacterEncoding("UTF-8");
        resp.setHeader("Access-Control-Allow-Origin", "*");//跨域，这里其实不需要设置
        resp.getWriter().print(JSON.toJSONString(product));
    }
}
