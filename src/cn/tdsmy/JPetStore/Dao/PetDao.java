package cn.tdsmy.JPetStore.Dao;

import cn.tdsmy.JPetStore.Entity.Pet;

import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/27 21:15
 * @Version 1.0
 */
public interface PetDao
{
    public Pet getPet(String itemID);//通过id检索某个宠物的信息

    public List<Pet> searchPet(String key);//通过关键字搜索宠物列表
}
