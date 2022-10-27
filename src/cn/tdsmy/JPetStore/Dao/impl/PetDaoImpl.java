package cn.tdsmy.JPetStore.Dao.impl;

import cn.tdsmy.JPetStore.Dao.PetDao;
import cn.tdsmy.JPetStore.Dao.Utils.DBUtils;
import cn.tdsmy.JPetStore.Entity.CartItem;
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
    public void updatePet(List<CartItem> cartItemList)
    {
        try (Connection connection = DBUtils.getConnection())
        {
            for (CartItem cartItem : cartItemList)
            {
                String ItemID = cartItem.getItemID();
                int Quantity = Integer.parseInt(cartItem.getQuantity());

                int newStock = 0;
                String sql1 = "select * from pet where ItemID ='" + ItemID + "'";
                try (PreparedStatement statement = connection.prepareStatement(sql1); ResultSet res = statement.executeQuery(sql1))
                {
                    if (res.next())
                    {
                        int Stock = Integer.parseInt(res.getString("Stock"));
                        newStock = Stock - Quantity;
                    }
                }

                String sql2 = "update pet set Stock = '" + newStock + "' where ItemID ='" + ItemID + "'";
                try (PreparedStatement statement = connection.prepareStatement(sql2))
                {
                    statement.executeUpdate();
                }
            }
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Pet getPet(String ItemID)
    {
        Pet pet = null;//如果没查到，则返回null
        String sql = "select * from pet where ItemID ='" + ItemID + "'";
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql))
        {
            if (res.next())
            {
                String Category = res.getString("Category");
                String ProductID = res.getString("ProductID");
                String Name = res.getString("Name");
                String Description = res.getString("Description");
                String Introduce = res.getString("Introduce");
                String Stock = res.getString("Stock");
                BigDecimal ListPrice = res.getBigDecimal("ListPrice");
                pet = new Pet(Category, ProductID, ItemID, Name, Description, Introduce, Stock, ListPrice);
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
        String sql = "select * from pet where Category like '%" + key + "%' or ProductID like '%" + key + "%' or ItemID like '%" + key
                + "%' or Name like '%" + key + "%' or Description like '%" + key + "%' or Introduce like '%" + key + "%'";
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
