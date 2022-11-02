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
    private Receiver receiver;

    public User(String username, String password, Receiver receiver)
    {
        this.username = username;
        this.password = password;
        this.receiver = receiver;
    }

    public User()
    {
        receiver = new Receiver();
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

    public Receiver getReceiver()
    {
        return receiver;
    }

    public void setReceiver(Receiver receiver)
    {
        this.receiver = receiver;
    }
}
