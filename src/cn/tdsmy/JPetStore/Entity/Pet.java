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

    public String Category;
    public String ProductID;
    public String ItemID;//主键
    public String Name;
    public String Description;
    public String Introduce;
    public String Stock;
    public BigDecimal ListPrice;

    public Pet(String category, String productID, String itemID, String name, String description, String introduce, String stock, BigDecimal listPrice)
    {
        Category = category;
        ProductID = productID;
        ItemID = itemID;
        Name = name;
        Description = description;
        Introduce = introduce;
        Stock = stock;
        ListPrice = listPrice;
    }

    public Pet()
    {

    }

    public String getCategory()
    {
        return Category;
    }

    public void setCategory(String category)
    {
        Category = category;
    }

    public String getProductID()
    {
        return ProductID;
    }

    public void setProductID(String productID)
    {
        ProductID = productID;
    }

    public String getItemID()
    {
        return ItemID;
    }

    public void setItemID(String itemID)
    {
        ItemID = itemID;
    }

    public String getName()
    {
        return Name;
    }

    public void setName(String name)
    {
        Name = name;
    }

    public String getDescription()
    {
        return Description;
    }

    public void setDescription(String description)
    {
        Description = description;
    }

    public String getIntroduce()
    {
        return Introduce;
    }

    public void setIntroduce(String introduce)
    {
        Introduce = introduce;
    }

    public String getStock()
    {
        return Stock;
    }

    public void setStock(String stock)
    {
        Stock = stock;
    }

    public BigDecimal getListPrice()
    {
        return ListPrice;
    }

    public void setListPrice(BigDecimal listPrice)
    {
        ListPrice = listPrice;
    }
}
