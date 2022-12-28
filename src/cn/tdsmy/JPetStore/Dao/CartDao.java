package cn.tdsmy.JPetStore.Dao;

import cn.tdsmy.JPetStore.Entity.CartJson;

import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/24 10:02
 * @Version 1.0
 */
public interface CartDao {
    public void addCartItem(String username, String itemID, int quantity);//增

    public void removeCartItem(String username, String itemID);//删

    public void clearCart(String username);//清空

    public void updateCart(String username, String itemID, int quantity);//改

    public List<CartJson> selectCartList(String username);//查
}
