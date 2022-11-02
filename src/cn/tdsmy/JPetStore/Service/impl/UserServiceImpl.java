package cn.tdsmy.JPetStore.Service.impl;

import cn.tdsmy.JPetStore.Dao.UserDao;
import cn.tdsmy.JPetStore.Dao.impl.UserDaoImpl;
import cn.tdsmy.JPetStore.Entity.Receiver;
import cn.tdsmy.JPetStore.Entity.User;
import cn.tdsmy.JPetStore.Service.UserService;

/**
 * @Author:liliyyyyy
 * @Date: 2022/10/27 20:04
 * @Version 1.0
 */
public class UserServiceImpl implements UserService
{
    private UserDao userDao;

    @Override
    public boolean register(User user)
    {
        if (userDao == null)
        {
            userDao = new UserDaoImpl();
        }
        return userDao.register(user);
    }

    @Override
    public boolean login(User user)
    {
        if (userDao == null)
        {
            userDao = new UserDaoImpl();
        }
        return userDao.login(user);
    }

    @Override
    public Receiver getReceiver(String username)
    {
        if (userDao == null)
        {
            userDao = new UserDaoImpl();
        }
        return userDao.getReceiver(username);
    }

    @Override
    public void updateUser(User user)
    {
        if (userDao == null)
        {
            userDao = new UserDaoImpl();
        }
        userDao.updateUser(user);
    }

    @Override
    public Receiver getUser(String username)
    {
//        User user = new User();
//        user.setUsername(username);
//        return userDao.selectReceiver(username);
        return new Receiver();
    }
}
