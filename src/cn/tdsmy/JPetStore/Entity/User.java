package cn.tdsmy.JPetStore.Entity;

import java.io.Serializable;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/25 8:32
 * @Version 1.0
 */
public class User implements Serializable
{
    private static final long serialVersionUID = 8416624847483776624L;

    private String username;
    private String password;
    private String receiverName;
    private String email;
    private String phoneNumber;
    private String country;
    private String province;
    private String city;
    private String district;
    private String detailedAddress;

    public User(String username, String password, String receiverName, String email, String phoneNumber, String country, String province, String city, String district, String detailedAddress)
    {
        this.username = username;
        this.password = password;
        this.receiverName = receiverName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.country = country;
        this.province = province;
        this.city = city;
        this.district = district;
        this.detailedAddress = detailedAddress;
    }

    public User()
    {
        this.username = "";
        this.password = "";
        this.receiverName = "";
        this.email = "";
        this.phoneNumber = "";
        this.country = "";
        this.province = "";
        this.city = "";
        this.district = "";
        this.detailedAddress = "";
    }

    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
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
