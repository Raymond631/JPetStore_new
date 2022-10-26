package cn.tdsmy.JPetStore.Dao;

import cn.tdsmy.JPetStore.Entity.CartItem;

import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/24 10:02
 * @Version 1.0
 */
public interface CartDao
{
    public void addCartItem(String username, CartItem cartItem);//增

    public void removeCartItem(String username, String item);//删

    public void clearCart(String username);//清空

    public void updateCart(String username, String item, String quantity);//改

    public List<CartItem> selectCartList(String username);//查
}
