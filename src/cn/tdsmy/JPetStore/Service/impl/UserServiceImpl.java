package cn.tdsmy.JPetStore.Service.impl;

import cn.tdsmy.JPetStore.Dao.UserDao;
import cn.tdsmy.JPetStore.Dao.impl.UserDaoImpl;
import cn.tdsmy.JPetStore.Entity.Profile;
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
    public boolean login(User user)
    {
        if (userDao == null)
        {
            userDao = new UserDaoImpl();
        }
        return userDao.login(user);
    }

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
    public void addProfile(String username, Profile profile)
    {
        if (userDao == null)
        {
            userDao = new UserDaoImpl();
        }
        userDao.addProfile(username, profile);
    }

    @Override
    public void addReceiver(String username, Receiver receiver)
    {
        if (userDao == null)
        {
            userDao = new UserDaoImpl();
        }
        userDao.addReceiver(username, receiver);
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
    public Profile getProfile(String username)
    {
        if (userDao == null)
        {
            userDao = new UserDaoImpl();
        }
        return userDao.getProfile(username);
    }

    @Override
    public void changePassword(User user)
    {
        if (userDao == null)
        {
            userDao = new UserDaoImpl();
        }
        userDao.changePassword(user);
    }

    @Override
    public void updateReceiver(String username, Receiver receiver)
    {
        if (userDao == null)
        {
            userDao = new UserDaoImpl();
        }

        if (userDao.isExist("receiver", username))
        {
            userDao.updateReceiver(username, receiver);
        }
        else
        {
            addReceiver(username, receiver);
        }
    }

    @Override
    public void updateProfile(String username, Profile profile)
    {
        if (userDao == null)
        {
            userDao = new UserDaoImpl();
        }

        if (userDao.isExist("receiver", username))
        {
            userDao.updateProfile(username, profile);
        }
        else
        {
            addProfile(username, profile);
        }
    }
}
