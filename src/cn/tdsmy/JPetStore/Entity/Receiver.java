package cn.tdsmy.JPetStore.Entity;

import java.io.Serializable;

/**
 * @Author: Raymond Li
 * @Date: 2022/11/2 12:20
 * @Version 1.0
 */
public class Receiver implements Serializable {
    private static final long serialVersionUID = 341048561940773295L;

    private String receiverName;
    private String phoneNumber;
    private String address;

    public Receiver(String receiverName, String phoneNumber, String address) {
        this.receiverName = receiverName;
        this.phoneNumber = phoneNumber;
        this.address = address;
    }

    public Receiver() {
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
