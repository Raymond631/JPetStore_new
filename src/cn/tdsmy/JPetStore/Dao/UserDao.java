package cn.tdsmy.JPetStore.Dao;

import cn.tdsmy.JPetStore.Entity.Receiver;
import cn.tdsmy.JPetStore.Entity.User;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/25 8:41
 * @Version 1.0
 */
public interface UserDao
{
    public boolean register(User user);

    public boolean login(User user);

    public Receiver getReceiver(String username);

    public void updateUser(User user);//改
    
}
