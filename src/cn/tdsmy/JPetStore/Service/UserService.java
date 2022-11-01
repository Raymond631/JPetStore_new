package cn.tdsmy.JPetStore.Service;

import cn.tdsmy.JPetStore.Entity.User;

/**
 * @Author:liliyyyyy
 * @Date: 2022/10/27 19:59
 * @Version 1.0
 */
public interface UserService {

    public User getUser(String username);

    public void insertUser(User user);

    public void updateUser(User user);
}
