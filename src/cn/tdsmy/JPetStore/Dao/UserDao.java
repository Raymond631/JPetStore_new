package cn.tdsmy.JPetStore.Dao;

import cn.tdsmy.JPetStore.Entity.User;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/25 8:41
 * @Version 1.0
 */
public interface UserDao
{
    public void addUser(User user);//增

    public void updateUser(User user);//改

    public User selectUser(String username);//查

    public User selectReceiver(String username);//查收件人
}
