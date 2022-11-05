package cn.tdsmy.JPetStore.Entity;

import java.io.Serializable;

/**
 * @Author: Raymond Li
 * @Date: 2022/11/4 20:51
 * @Version 1.0
 */
public class MyLog implements Serializable
{
    private static final long serialVersionUID = -1708018176084977814L;

    private String username;
    private String time;
    private String ip;
    private String url;
    private String operationType;
    private String operationContent;
    private String status;

    public MyLog(String username, String time, String ip, String url, String operationType, String operationContent, String status)
    {
        this.username = username;
        this.time = time;
        this.ip = ip;
        this.url = url;
        this.operationType = operationType;
        this.operationContent = operationContent;
        this.status = status;
    }

    public MyLog()
    {
    }

    public void setLog(String operationType, String operationContent, String status)
    {
        this.operationType = operationType;
        this.operationContent = operationContent;
        this.status = status;
    }


    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }

    public String getTime()
    {
        return time;
    }

    public void setTime(String time)
    {
        this.time = time;
    }

    public String getIp()
    {
        return ip;
    }

    public void setIp(String ip)
    {
        this.ip = ip;
    }

    public String getUrl()
    {
        return url;
    }

    public void setUrl(String url)
    {
        this.url = url;
    }

    public String getOperationType()
    {
        return operationType;
    }

    public void setOperationType(String operationType)
    {
        this.operationType = operationType;
    }

    public String getOperationContent()
    {
        return operationContent;
    }

    public void setOperationContent(String operationContent)
    {
        this.operationContent = operationContent;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }
}
