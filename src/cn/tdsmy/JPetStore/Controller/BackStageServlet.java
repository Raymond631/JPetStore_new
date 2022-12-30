package cn.tdsmy.JPetStore.Controller;

import cn.tdsmy.JPetStore.Service.BackStage;
import cn.tdsmy.JPetStore.Service.impl.BackStageImpl;
import com.alibaba.fastjson.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/BackStage/*")
public class BackStageServlet extends HttpServlet {
    private BackStage backStage;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        urlDistribute(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        urlDistribute(req, resp);
    }

    public void urlDistribute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (backStage == null) {
            backStage = new BackStageImpl();
        }

        String url = req.getPathInfo();
        switch (url) {
            case "/IndexBack"://后台首页
                IndexBack(req, resp);
                break;
            case "/ProductAllBack":
                productAllBack(req, resp);
                break;
            case "/ProductDetailBack":
                productDetailBack(req, resp);
                break;
            case "/ServiceBack"://后台前往客服
                serviceBack(req, resp);
                break;
        }
    }


    public void IndexBack(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        JSONObject jsonObject = backStage.getIndexData();
        req.setAttribute("json", jsonObject);
        req.getRequestDispatcher("/WEB-INF/jsp/BackStage/IndexBack.jsp").forward(req, resp);
    }

    public void productAllBack(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        JSONObject jsonObject = backStage.getProductData();
        req.setAttribute("json", jsonObject);
        req.getRequestDispatcher("/WEB-INF/jsp/BackStage/ProductAllBack.jsp").forward(req, resp);
    }

    public void productDetailBack(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/BackStage/ProductDetailBack.jsp").forward(req, resp);
    }

    public void serviceBack(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/BackStage/ServiceBack.jsp").forward(req, resp);
    }
}
