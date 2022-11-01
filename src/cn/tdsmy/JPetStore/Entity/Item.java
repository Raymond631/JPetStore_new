package cn.tdsmy.JPetStore.Entity;

import java.math.BigDecimal;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/31 23:10
 * @Version 1.0
 */
public class Item
{
    private String itemID;
    private String description;
    private int stock;
    private BigDecimal listPrice;

    public Item(String itemID, String description, int stock, BigDecimal listPrice)
    {
        this.itemID = itemID;
        this.description = description;
        this.stock = stock;
        this.listPrice = listPrice;
    }

    public Item()
    {
    }

    public String getItemID()
    {
        return itemID;
    }

    public void setItemID(String itemID)
    {
        this.itemID = itemID;
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }

    public int getStock()
    {
        return stock;
    }

    public void setStock(int stock)
    {
        this.stock = stock;
    }

    public BigDecimal getListPrice()
    {
        return listPrice;
    }

    public void setListPrice(BigDecimal listPrice)
    {
        this.listPrice = listPrice;
    }
}
