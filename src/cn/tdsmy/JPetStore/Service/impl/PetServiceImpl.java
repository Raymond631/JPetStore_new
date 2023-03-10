package cn.tdsmy.JPetStore.Service.impl;

import cn.tdsmy.JPetStore.Dao.PetDao;
import cn.tdsmy.JPetStore.Dao.impl.PetDaoImpl;
import cn.tdsmy.JPetStore.Entity.Product;
import cn.tdsmy.JPetStore.Service.PetService;

import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/27 22:56
 * @Version 1.0
 */
public class PetServiceImpl implements PetService {
    private PetDao petDao;

    @Override
    public List<Product> searchPet(String key) {
        if (petDao == null) {
            petDao = new PetDaoImpl();
        }
        return petDao.searchPet(key);
    }

    @Override
    public Product getProduct(String name) {
        if (petDao == null) {
            petDao = new PetDaoImpl();
        }
        return petDao.getProduct(name);
    }

    public List<String> searchTips(String key) {
        if (petDao == null) {
            petDao = new PetDaoImpl();
        }
        return petDao.searchTips(key);
    }
}
