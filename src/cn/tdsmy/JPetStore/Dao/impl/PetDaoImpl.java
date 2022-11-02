package cn.tdsmy.JPetStore.Dao.impl;

import cn.tdsmy.JPetStore.Dao.PetDao;
import cn.tdsmy.JPetStore.Dao.Utils.DBUtils;
import cn.tdsmy.JPetStore.Entity.Item;
import cn.tdsmy.JPetStore.Entity.Product;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/27 22:08
 * @Version 1.0
 */
public class PetDaoImpl implements PetDao
{
    @Override
    public List<Product> searchPet(String key)//SQL模糊查询
    {
        List<Product> productList = new ArrayList<>();
//        String sql = "select * from pet where category like '%" + key + "%' or productID like '%" + key + "%' or name like '%" + key
//                + "%' or introduce like '%" + key + "%' or itemID like '%" + key + "%' or description like '%" + key + "%'";
//        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql))
//        {
//            while (res.next())
//            {
//                String productID = res.getString("productID");//品种ID
//                String name = res.getString("name");//品种名
//                String introduce = res.getString("introduce");//品种简介
//
//                Pet pet = new Pet();
//                pet.setProductID(productID);
//                pet.setName(name);
//                pet.setIntroduce(introduce);
//
//                petList.add(pet);
//            }
//        }
//        catch (SQLException e)
//        {
//            throw new RuntimeException(e);
//        }
        return productList;
    }

    @Override
    public Map<String, Product> getProductMap(String category)
    {
        Map<String, Product> productMap = new HashMap<>();//key:productID,value:product
        try (Connection connection = DBUtils.getConnection())
        {
            String sql = "select * from product where category = '" + category + "'";
            try (PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql))
            {
                while (res.next())
                {
                    String productID = res.getString("productID");
                    String name = res.getString("name");
                    String introduce = res.getString("introduce");

                    Product product = new Product();
                    product.setProductID(productID);
                    product.setName(name);
                    product.setIntroduce(introduce);

                    productMap.put(productID, product);
                }
            }

            productMap.forEach((productID, product) ->
            {
                String sql2 = "select * from item where productID = '" + product.getProductID() + "'";
                try (PreparedStatement statement = connection.prepareStatement(sql2); ResultSet res = statement.executeQuery(sql2))
                {
                    while (res.next())
                    {
                        String itemID = res.getString("itemID");
                        String description = res.getString("description");
                        int stock = res.getInt("stock");
                        BigDecimal listPrice = res.getBigDecimal("listPrice");

                        Item item = new Item(itemID, description, stock, listPrice);
                        product.getItemMap().put(itemID, item);
                    }
                }
                catch (SQLException e)
                {
                    throw new RuntimeException(e);
                }
            });
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
        return productMap;
    }
}
