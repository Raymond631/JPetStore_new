package cn.tdsmy.JPetStore.Entity;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/23 22:48
 * @Version 1.0
 */

public class CartItem implements Serializable {
    private static final long serialVersionUID = 7328478120237328517L;
    private String itemID;
    private String productID;
    private String description;
    private int stock;
    private int quantity;
    private BigDecimal listPrice;
    private String img;

    public CartItem(String itemID, String productID, String description, int stock, int quantity, BigDecimal listPrice) {
        this.itemID = itemID;
        this.productID = productID;
        this.description = description;
        this.stock = stock;
        this.quantity = quantity;
        this.listPrice = listPrice;
    }

    public CartItem() {
    }

    @Override
    public String toString() {
        return "itemID=" + itemID + "\n"
                + "productID=" + productID + "\n"
                + "description=" + description + "\n"
                + "stock=" + stock + "\n"
                + "quantity=" + quantity + "\n"
                + "listPrice=" + listPrice + "\n";
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getItemID() {
        return itemID;
    }

    public void setItemID(String itemID) {
        this.itemID = itemID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getListPrice() {
        return listPrice;
    }

    public void setListPrice(BigDecimal listPrice) {
        this.listPrice = listPrice;
    }
}
