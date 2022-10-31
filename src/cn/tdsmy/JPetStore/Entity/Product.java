package cn.tdsmy.JPetStore.Entity;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/31 23:10
 * @Version 1.0
 */
public class Product
{
    private String productID;
    private String name;
    private String introduce;
    private List<Item> itemList;

    public Product(String productID, String name, String introduce, List<Item> itemList)
    {
        this.productID = productID;
        this.name = name;
        this.introduce = introduce;
        this.itemList = itemList;
    }

    public Product()
    {
        itemList = new ArrayList<>();
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

    public List<Item> getItemList()
    {
        return itemList;
    }

    public void setItemList(List<Item> itemList)
    {
        this.itemList = itemList;
    }
}
