package cn.tdsmy.JPetStore.Service;

import cn.tdsmy.JPetStore.Entity.Receiver;
import cn.tdsmy.JPetStore.Entity.User;

import java.util.List;

/**
 * @Author:liliyyyyy
 * @Date: 2022/10/27 19:59
 * @Version 1.0
 */
public interface UserService {
    public boolean login(User user);

    public boolean register(User user);

    public boolean registerSuccess(User user);

    public void changePassword(User user);

    public void updateReceiver(String username, List<Receiver> receiver);
}
