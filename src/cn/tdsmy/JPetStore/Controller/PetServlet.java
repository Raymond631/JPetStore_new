package cn.tdsmy.JPetStore.Controller;

import cn.tdsmy.JPetStore.Entity.Product;
import cn.tdsmy.JPetStore.Service.PetService;
import cn.tdsmy.JPetStore.Service.impl.PetServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/29 22:59
 * @Version 1.0
 */

@WebServlet("/Pet/*")
public class PetServlet extends HttpServlet
{
    public PetService petService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        urlDistribute(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        urlDistribute(req, resp);
    }

    public void urlDistribute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        if (petService == null)
        {
            petService = new PetServiceImpl();
        }

        String url = req.getPathInfo();
        switch (url)
        {
            case "/homePage":
                homePage(req, resp);
                break;
            case "/searchPet":
                searchPet(req, resp);
                break;
            case "/petList":
                petList(req, resp);
                break;
            case "/petProduct":
                petProduct(req, resp);
                break;
        }
    }


    /**
     * get请求
     */
    public void homePage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        req.getRequestDispatcher("/WEB-INF/jsp/Pet/HomePage.jsp").forward(req, resp);
    }

    /**
     * post请求
     */
    public void searchPet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        String key = req.getParameter("keyword");
        System.out.println(key);
    }

    /**
     * get请求
     * 参数/petList?category=
     */
    public void petList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        String category = req.getParameter("category");
        Map<String, Product> productMap = petService.getProductMap(category);

        req.getSession().setAttribute("category", category);
        req.getSession().setAttribute("productMap", productMap);

        req.getRequestDispatcher("/WEB-INF/jsp/Pet/Category.jsp").forward(req, resp);
    }

    /**
     * get请求
     * 参数/petProduct?productID=
     */
    public void petProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        Map<String, Product> productMap = (Map<String, Product>) req.getSession().getAttribute("productMap");
        Product product = productMap.get(req.getParameter("productID"));
        req.setAttribute("product", product);

        req.getRequestDispatcher("/WEB-INF/jsp/Pet/PetProduction.jsp").forward(req, resp);
    }
}
