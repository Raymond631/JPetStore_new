package cn.tdsmy.JPetStore.Service;

import cn.tdsmy.JPetStore.Entity.Receiver;
import cn.tdsmy.JPetStore.Entity.User;

/**
 * @Author:liliyyyyy
 * @Date: 2022/10/27 19:59
 * @Version 1.0
 */
public interface UserService
{
    public boolean register(User user);

    public boolean login(User user);

    public Receiver getReceiver(String username);

    public void updateUser(User user);
}
