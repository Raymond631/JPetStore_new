package cn.tdsmy.JPetStore.Entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/26 17:00
 * @Version 1.0
 */
public class Order implements Serializable
{
    private static final long serialVersionUID = 7632942823786187032L;

    private String OrderID;
    private String OrderTime;
    private String PayTime;
    private User receiver;
    private List<CartItem> cartItemList;
    private BigDecimal TotalPrice;
    private String PayMethod;

    public Order(String orderID, String orderTime, String payTime, User receiver, List<CartItem> cartItemList, BigDecimal totalPrice, String payMethod)
    {
        OrderID = orderID;
        OrderTime = orderTime;
        PayTime = payTime;
        this.receiver = receiver;
        this.cartItemList = cartItemList;
        TotalPrice = totalPrice;
        PayMethod = payMethod;
    }

    public Order()
    {
        this.cartItemList = new ArrayList<>();
    }

    public String getOrderID()
    {
        return OrderID;
    }

    public void setOrderID(String orderID)
    {
        OrderID = orderID;
    }

    public String getOrderTime()
    {
        return OrderTime;
    }

    public void setOrderTime(String orderTime)
    {
        OrderTime = orderTime;
    }

    public String getPayTime()
    {
        return PayTime;
    }

    public void setPayTime(String payTime)
    {
        PayTime = payTime;
    }

    public User getReceiver()
    {
        return receiver;
    }

    public void setReceiver(User receiver)
    {
        this.receiver = receiver;
    }

    public List<CartItem> getCartItemList()
    {
        return cartItemList;
    }

    public void setCartItemList(List<CartItem> cartItemList)
    {
        this.cartItemList = cartItemList;
    }

    public BigDecimal getTotalPrice()
    {
        return TotalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice)
    {
        TotalPrice = totalPrice;
    }

    public String getPayMethod()
    {
        return PayMethod;
    }

    public void setPayMethod(String payMethod)
    {
        PayMethod = payMethod;
    }
}
