package cn.tdsmy.JPetStore.Entity;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/31 23:10
 * @Version 1.0
 */
public class Product {
    private String category;
    private String productID;
    private String name;
    private String introduce;
    private String img;//url
    private BigDecimal price;
    private List<Item> itemList;

    public Product(String category, String productID, String name, String introduce, String img, List<Item> itemList) {
        this.category = category;
        this.productID = productID;
        this.name = name;
        this.introduce = introduce;
        this.img = img;
        this.itemList = itemList;
    }

    public Product() {
        itemList = new ArrayList<>();
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public List<Item> getItemList() {
        return itemList;
    }

    public void setItemList(List<Item> itemList) {
        this.itemList = itemList;
    }
}