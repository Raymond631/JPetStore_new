package cn.tdsmy.JPetStore.Service;

import cn.tdsmy.JPetStore.Entity.Pet;

import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/27 22:55
 * @Version 1.0
 */
public interface PetService
{
    public Pet getPet(String itemID);//通过id检索某个宠物的信息

    public List<Pet> searchPet(String key);//通过关键字搜索宠物列表
}
