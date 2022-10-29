package cn.tdsmy.JPetStore.Entity;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/23 22:48
 * @Version 1.0
 */

public class CartItem implements Serializable
{
    private static final long serialVersionUID = 7328478120237328517L;
    private String itemID;
    private String productID;
    private String description;
    private String stock;
    private String quantity;
    private BigDecimal listPrice;
    private BigDecimal totalCost;

    public CartItem(String itemID, String productID, String description, String stock, String quantity, BigDecimal listPrice)
    {
        this.itemID = itemID;
        this.productID = productID;
        this.description = description;
        this.stock = stock;
        this.quantity = quantity;
        this.listPrice = listPrice;
        this.totalCost = listPrice.multiply(new BigDecimal(quantity));
    }

    public String getItemID()
    {
        return itemID;
    }

    public void setItemID(String itemID)
    {
        this.itemID = itemID;
    }

    public String getProductID()
    {
        return productID;
    }

    public void setProductID(String productID)
    {
        this.productID = productID;
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }

    public String getStock()
    {
        return stock;
    }

    public void setStock(String stock)
    {
        this.stock = stock;
    }

    public String getQuantity()
    {
        return quantity;
    }

    public void setQuantity(String quantity)
    {
        this.quantity = quantity;
    }

    public BigDecimal getListPrice()
    {
        return listPrice;
    }

    public void setListPrice(BigDecimal listPrice)
    {
        this.listPrice = listPrice;
    }

    public BigDecimal getTotalCost()
    {
        return totalCost;
    }

    public void setTotalCost(BigDecimal totalCost)
    {
        this.totalCost = totalCost;
    }
}
