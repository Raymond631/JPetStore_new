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
                String productID = res.getString("productID");//品种ID
                String name = res.getString("name");//品种名
                String introduce = res.getString("introduce");//品种简介

                Pet pet = new Pet();
                pet.setProductID(productID);
                pet.setName(name);
                pet.setIntroduce(introduce);

                petList.add(pet);
            }
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
        return petList;
    }

    @Override
    public List<Pet> getPetCategory(String category)
    {
        List<Pet> petList = new ArrayList<>();
        String sql = "select * from pet where category = '" + category + "'";
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql))
        {
            while (res.next())
            {
                String productID = res.getString("productID");
                String name = res.getString("name");
                String introduce = res.getString("introduce");
                String itemID = res.getString("itemID");
                String description = res.getString("description");
                int stock = res.getInt("stock");
                BigDecimal listPrice = res.getBigDecimal("listPrice");

                Pet pet = new Pet(category, productID, name, introduce, itemID, description, stock, listPrice);
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
