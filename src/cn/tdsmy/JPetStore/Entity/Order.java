package cn.tdsmy.JPetStore.Entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/26 17:00
 * @Version 1.0
 */
public class Order implements Serializable
{
    private static final long serialVersionUID = 7632942823786187032L;
    private String orderID;
    private String orderTime;
    private String payTime;
    private User receiver;
    private List<CartItem> cartItemList;
    private BigDecimal totalPrice;
    private String payMethod;

    public Order(String orderID, String orderTime, String payTime, User receiver, List<CartItem> cartItemList, BigDecimal totalPrice, String payMethod)
    {
        this.orderID = orderID;
        this.orderTime = orderTime;
        this.payTime = payTime;
        this.receiver = receiver;
        this.cartItemList = cartItemList;
        this.totalPrice = totalPrice;
        this.payMethod = payMethod;
    }

    public Order()
    {
    }

    public String getOrderID()
    {
        return orderID;
    }

    public void setOrderID(String orderID)
    {
        this.orderID = orderID;
    }

    public String getOrderTime()
    {
        return orderTime;
    }

    public void setOrderTime(String orderTime)
    {
        this.orderTime = orderTime;
    }

    public String getPayTime()
    {
        return payTime;
    }

    public void setPayTime(String payTime)
    {
        this.payTime = payTime;
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
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice)
    {
        this.totalPrice = totalPrice;
    }

    public String getPayMethod()
    {
        return payMethod;
    }

    public void setPayMethod(String payMethod)
    {
        this.payMethod = payMethod;
    }
}
