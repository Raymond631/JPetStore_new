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
    public void removeCartItem(String username, String item)
    {
        if (cartDao == null)
        {
            cartDao = new CartDaoImpl();
        }

        if (item.equals("0"))//删除全部
        {
            cartDao.clearCart(username);
        }
        else//删除一项
        {
            cartDao.removeCartItem(username, item);
        }
    }

    @Override
    public void updateCart(String username, String item, String quantity)
    {
        if (cartDao == null)
        {
            cartDao = new CartDaoImpl();
        }
        cartDao.updateCart(username, item, quantity);
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
    public BigDecimal calculateAllCost(List<CartItem> cartItemList)
    {
        BigDecimal allCost = BigDecimal.valueOf(0);
        for (CartItem c : cartItemList)
        {
            allCost = allCost.add(c.getTotalCost());
        }
        return allCost;
    }
}
