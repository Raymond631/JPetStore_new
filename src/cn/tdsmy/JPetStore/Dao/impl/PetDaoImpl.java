package cn.tdsmy.JPetStore.Dao.impl;

import cn.tdsmy.JPetStore.Dao.PetDao;
import cn.tdsmy.JPetStore.Dao.Utils.DBUtils;
import cn.tdsmy.JPetStore.Entity.Pet;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/27 22:08
 * @Version 1.0
 */
public class PetDaoImpl implements PetDao
{
    @Override
    public Pet getPet(String itemID)
    {
        Pet pet = null;//如果没查到，则返回null
        String sql = "select * from pet where itemID ='" + itemID + "'";
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql))
        {
            if (res.next())
            {
                String category = res.getString("category");
                String productID = res.getString("productID");
                String name = res.getString("name");
                String introduce = res.getString("introduce");
                String description = res.getString("description");
                int stock = res.getInt("stock");
                BigDecimal listPrice = res.getBigDecimal("listPrice");
                pet = new Pet(category, productID, name, introduce, itemID, description, stock, listPrice);
            }
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
        return pet;
    }

    @Override
    public List<Pet> searchPet(String key)//SQL模糊查询
    {
        List<Pet> petList = new ArrayList<>();
        String sql = "select * from pet where category like '%" + key + "%' or productID like '%" + key + "%' or name like '%" + key
                + "%' or introduce like '%" + key + "%' or itemID like '%" + key + "%' or description like '%" + key + "%'";
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql))
        {
            while (res.next())
            {
                String ProductID = res.getString("ProductID");//品种ID
                String Name = res.getString("Name");//品种名
                String Introduce = res.getString("Introduce");//品种简介

                Pet pet = new Pet();
                pet.setProductID(ProductID);
                pet.setName(Name);
                pet.setIntroduce(Introduce);

                petList.add(pet);
            }
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
        return petList;
    }
}
