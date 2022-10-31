package cn.tdsmy.JPetStore.Service.impl;

import cn.tdsmy.JPetStore.Dao.PetDao;
import cn.tdsmy.JPetStore.Dao.impl.PetDaoImpl;
import cn.tdsmy.JPetStore.Entity.Pet;
import cn.tdsmy.JPetStore.Service.PetService;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/27 22:56
 * @Version 1.0
 */
public class PetServiceImpl implements PetService
{
    private PetDao petDao;

    @Override
    public Pet getPet(String itemID)
    {
        if (petDao == null)
        {
            petDao = new PetDaoImpl();
        }
        return petDao.getPet(itemID);
    }

    @Override
    public List<Pet> searchPet(String key)
    {
        if (petDao == null)
        {
            petDao = new PetDaoImpl();
        }
        return petDao.searchPet(key);
    }

    @Override
    public List<Pet> getPetCategory(String category)
    {
        if (petDao == null)
        {
            petDao = new PetDaoImpl();
        }
        return petDao.getPetCategory(category);
    }

    @Override
    public List<String> getNameList(List<Pet> petList)
    {
        List<String> nameList = new ArrayList<>();
        for (Pet pet : petList)
        {
            nameList.add(pet.getName());
        }
        return new ArrayList<>(new HashSet<>(nameList));
    }
}
