package cn.tdsmy.JPetStore.Dao;

import cn.tdsmy.JPetStore.Entity.Profile;
import cn.tdsmy.JPetStore.Entity.Receiver;
import cn.tdsmy.JPetStore.Entity.User;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/25 8:41
 * @Version 1.0
 */
public interface UserDao
{
    public boolean login(User user);


    public boolean register(User user);

    public void addProfile(String username, Profile profile);

    public void addReceiver(String username, Receiver receiver);


    public Receiver getReceiver(String username);

    public Profile getProfile(String username);


    public void changePassword(User user);

    public void updateReceiver(String username, Receiver receiver);

    public void updateProfile(String username, Profile profile);


    public boolean isExist(String tableName, String username);//用于检查receiver和profile是否为空
}
