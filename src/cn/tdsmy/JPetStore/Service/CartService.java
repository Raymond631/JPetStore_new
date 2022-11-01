package cn.tdsmy.JPetStore.Service;

import cn.tdsmy.JPetStore.Entity.CartItem;

import java.math.BigDecimal;
import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/24 9:51
 * @Version 1.0
 */
public interface CartService
{
    public void addCartItem(String username, String itemID, int quantity);//增

    public void removeCartItem(String username, String itemID);//删

    public void updateCart(String username, String itemID, int quantity);//改

    public List<CartItem> selectCartList(String username);//查

    public BigDecimal getAllCost(List<CartItem> cartItemList);
}
