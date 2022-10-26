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
    public void removeCartItem(String username, String item);//删

    public void updateCart(String username, String item, String quantity);//改

    public List<CartItem> selectCartList(String username);//查

    public BigDecimal calculateAllCost(List<CartItem> cartItemList);//计算总金额
}
