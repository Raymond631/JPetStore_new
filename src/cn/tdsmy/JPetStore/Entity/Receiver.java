package cn.tdsmy.JPetStore.Entity;

import java.io.Serializable;

/**
 * @Author: Raymond Li
 * @Date: 2022/11/2 12:20
 * @Version 1.0
 */
public class Receiver implements Serializable
{
    private static final long serialVersionUID = 341048561940773295L;

    private String receiverName;
    private String email;
    private String phoneNumber;
    private String country;
    private String province;
    private String city;
    private String district;
    private String detailedAddress;

    public Receiver(String receiverName, String email, String phoneNumber, String country, String province, String city, String district, String detailedAddress)
    {
        this.receiverName = receiverName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.country = country;
        this.province = province;
        this.city = city;
        this.district = district;
        this.detailedAddress = detailedAddress;
    }

    public Receiver()
    {
        this.receiverName = "";
        this.email = "";
        this.phoneNumber = "";
        this.country = "";
        this.province = "";
        this.city = "";
        this.district = "";
        this.detailedAddress = "";
    }

    public String getReceiverName()
    {
        return receiverName;
    }

    public void setReceiverName(String receiverName)
    {
        this.receiverName = receiverName;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public String getPhoneNumber()
    {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber)
    {
        this.phoneNumber = phoneNumber;
    }

    public String getCountry()
    {
        return country;
    }

    public void setCountry(String country)
    {
        this.country = country;
    }

    public String getProvince()
    {
        return province;
    }

    public void setProvince(String province)
    {
        this.province = province;
    }

    public String getCity()
    {
        return city;
    }

    public void setCity(String city)
    {
        this.city = city;
    }

    public String getDistrict()
    {
        return district;
    }

    public void setDistrict(String district)
    {
        this.district = district;
    }

    public String getDetailedAddress()
    {
        return detailedAddress;
    }

    public void setDetailedAddress(String detailedAddress)
    {
        this.detailedAddress = detailedAddress;
    }
}
