package cn.tdsmy.JPetStore.Service.impl;

import cn.tdsmy.JPetStore.Dao.CartDao;
import cn.tdsmy.JPetStore.Dao.impl.CartDaoImpl;
import cn.tdsmy.JPetStore.Entity.CartJson;
import cn.tdsmy.JPetStore.Service.CartService;

import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/24 9:58
 * @Version 1.0
 */
public class CartServiceImpl implements CartService {
    private CartDao cartDao;

    @Override
    public void addCartItem(String username, String itemID, int quantity) {
        if (cartDao == null) {
            cartDao = new CartDaoImpl();
        }
        cartDao.addCartItem(username, itemID, quantity);
    }

    @Override
    public void removeCartItem(String username, String itemID) {
        if (cartDao == null) {
            cartDao = new CartDaoImpl();
        }
        cartDao.removeCartItem(username, itemID);
    }

    @Override
    public void updateCart(String username, String itemID, int quantity) {
        if (cartDao == null) {
            cartDao = new CartDaoImpl();
        }
        cartDao.updateCart(username, itemID, quantity);
    }

    @Override
    public List<CartJson> selectCartList(String username) {
        if (cartDao == null) {
            cartDao = new CartDaoImpl();
        }
        return cartDao.selectCartList(username);
    }

}
