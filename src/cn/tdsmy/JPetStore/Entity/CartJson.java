package cn.tdsmy.JPetStore.Entity;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @Author: Raymond Li
 * @Date: 2022/12/28 14:02
 * @Version 1.0
 */
public class CartJson implements Serializable {
    private static final long serialVersionUID = -3248687150167543850L;
    private String itemID;
    private String name;//description
    private String img;//url
    private int number;//quantity
    private BigDecimal proc;//listPrice
    private int xz;//stock

    public CartJson(String itemID, String name, String img, int number, BigDecimal proc, int xz) {
        this.itemID = itemID;
        this.name = name;
        this.img = img;
        this.number = number;
        this.proc = proc;
        this.xz = xz;
    }

    public CartJson() {
    }

    public String getItemID() {
        return itemID;
    }

    public void setItemID(String itemID) {
        this.itemID = itemID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public BigDecimal getProc() {
        return proc;
    }

    public void setProc(BigDecimal proc) {
        this.proc = proc;
    }

    public int getXz() {
        return xz;
    }

    public void setXz(int xz) {
        this.xz = xz;
    }
}
