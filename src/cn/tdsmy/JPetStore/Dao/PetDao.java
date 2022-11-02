package cn.tdsmy.JPetStore.Dao;

import cn.tdsmy.JPetStore.Entity.Product;

import java.util.List;
import java.util.Map;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/27 21:15
 * @Version 1.0
 */
public interface PetDao
{
    public List<Product> searchPet(String key);//通过关键字搜索宠物列表

    public Map<String, Product> getProductList(String category);
}