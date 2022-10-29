package cn.tdsmy.JPetStore.Entity;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/27 21:07
 * @Version 1.0
 */
public class Pet implements Serializable
{
    private static final long serialVersionUID = -2420866370113193184L;
    public String category;
    public String productID;
    public String name;
    public String introduce;
    public String itemID;
    public String description;
    public int stock;
    public BigDecimal listPrice;

    public Pet(String category, String productID, String name, String introduce, String itemID, String description, int stock, BigDecimal listPrice)
    {
        this.category = category;
        this.productID = productID;
        this.name = name;
        this.introduce = introduce;
        this.itemID = itemID;
        this.description = description;
        this.stock = stock;
        this.listPrice = listPrice;
    }

    public Pet()
    {
    }

    public String getCategory()
    {
        return category;
    }

    public void setCategory(String category)
    {
        this.category = category;
    }

    public String getProductID()
    {
        return productID;
    }

    public void setProductID(String productID)
    {
        this.productID = productID;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getIntroduce()
    {
        return introduce;
    }

    public void setIntroduce(String introduce)
    {
        this.introduce = introduce;
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
