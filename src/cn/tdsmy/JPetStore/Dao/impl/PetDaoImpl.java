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
import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/27 22:08
 * @Version 1.0
 */
public class PetDaoImpl implements PetDao {
    @Override
    public List<Product> searchPet(String key)//SQL模糊查询
    {
        List<Product> productList = new ArrayList<>();
        String sql = "select * from product where name like '%" + key + "%'";
        System.out.println(sql);
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql)) {
            while (res.next()) {
                String name = res.getString("name");//品种名
                String introduce = res.getString("introduce");//品种简介
                String img = res.getString("img");
                BigDecimal price = res.getBigDecimal("price");

                Product product = new Product();
                product.setName(name);
                product.setIntroduce(introduce);
                product.setImg(img);
                product.setPrice(price);
                productList.add(product);
            }
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }

    public List<String> searchTips(String key) {
        List<String> productList = new ArrayList<>();
        String sql = "select * from product where name like '%" + key + "%'";
        System.out.println(sql);
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql)) {
            while (res.next()) {
                String name = res.getString("name");//品种名
                productList.add(name);
            }
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }

    @Override
    public Product getProduct(String name) {
        Product product = new Product();
        try (Connection connection = DBUtils.getConnection()) {
            String sql = "select * from product where name = '" + name + "'";
            try (PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql)) {
                if (res.next()) {
                    String productID = res.getString("productID");
                    String introduce = res.getString("introduce");

                    product.setName(name);
                    product.setProductID(productID);
                    product.setIntroduce(introduce);
                }
            }

            String sql2 = "select * from item where productID = '" + product.getProductID() + "'";
            try (PreparedStatement statement = connection.prepareStatement(sql2); ResultSet res = statement.executeQuery(sql2)) {
                while (res.next()) {
                    String itemID = res.getString("itemID");
                    String description = res.getString("description");
                    int stock = res.getInt("stock");
                    BigDecimal listPrice = res.getBigDecimal("listPrice");

                    String img = res.getString("img");
                    product.setImg(img);

                    Item item = new Item(itemID, description, stock, listPrice);
                    product.getItemList().add(item);
                }
            }
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return product;
    }
}
