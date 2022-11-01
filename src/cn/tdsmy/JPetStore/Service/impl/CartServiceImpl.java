package cn.tdsmy.JPetStore.Service.impl;

import cn.tdsmy.JPetStore.Dao.CartDao;
import cn.tdsmy.JPetStore.Dao.impl.CartDaoImpl;
import cn.tdsmy.JPetStore.Entity.CartItem;
import cn.tdsmy.JPetStore.Service.CartService;

import java.math.BigDecimal;
import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/24 9:58
 * @Version 1.0
 */
public class CartServiceImpl implements CartService
{
    private CartDao cartDao;

    @Override
    public void addCartItem(String username, String itemID, int quantity)
    {
        if (cartDao == null)
        {
            cartDao = new CartDaoImpl();
        }
        cartDao.addCartItem(username, itemID, quantity);
    }

    @Override
    public void removeCartItem(String username, String itemID)
    {
        if (cartDao == null)
        {
            cartDao = new CartDaoImpl();
        }

        if (itemID.equals("0"))//删除全部
        {
            cartDao.clearCart(username);
        }
        else//删除一项
        {
            cartDao.removeCartItem(username, itemID);
        }
    }

    @Override
    public void updateCart(String username, String itemID, int quantity)
    {
        if (cartDao == null)
        {
            cartDao = new CartDaoImpl();
        }
        cartDao.updateCart(username, itemID, quantity);
    }

    @Override
    public List<CartItem> selectCartList(String username)
    {
        if (cartDao == null)
        {
            cartDao = new CartDaoImpl();
        }
        return cartDao.selectCartList(username);
    }

    @Override
    public BigDecimal getAllCost(List<CartItem> cartItemList)
    {
        BigDecimal allCost = BigDecimal.valueOf(0);
        for (CartItem c : cartItemList)
        {
            BigDecimal temp = c.getListPrice().multiply(new BigDecimal(c.getQuantity()));
            allCost = allCost.add(temp);
        }
        return allCost;
    }

}
