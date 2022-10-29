package cn.tdsmy.JPetStore.Service.impl;

import cn.tdsmy.JPetStore.Dao.PetDao;
import cn.tdsmy.JPetStore.Dao.impl.PetDaoImpl;
import cn.tdsmy.JPetStore.Entity.Pet;
import cn.tdsmy.JPetStore.Service.PetService;

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
}
