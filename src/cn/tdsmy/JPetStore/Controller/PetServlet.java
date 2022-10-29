package cn.tdsmy.JPetStore.Controller;

import cn.tdsmy.JPetStore.Entity.Pet;
import cn.tdsmy.JPetStore.Service.PetService;
import cn.tdsmy.JPetStore.Service.impl.PetServiceImpl;

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
            case "/searchPet":
                searchPet(req, resp);
                break;
        }
    }

    /**
     * post请求
     */
    public void searchPet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        String key = req.getParameter("keyword");
        List<Pet> petList = petService.searchPet(key);
        for (Pet pet : petList)
        {
            System.out.println();
            System.out.println(pet.getProductID());
            System.out.println(pet.getName());
            System.out.println(pet.getIntroduce());
            System.out.println();
        }
    }
}
