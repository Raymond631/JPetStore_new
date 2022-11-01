package cn.tdsmy.JPetStore.Service.impl;

import cn.tdsmy.JPetStore.Dao.UserDao;
import cn.tdsmy.JPetStore.Dao.impl.UserDaoImpl;
import cn.tdsmy.JPetStore.Entity.User;
import cn.tdsmy.JPetStore.Service.UserService;

/**
 * @Author:liliyyyyy
 * @Date: 2022/10/27 20:04
 * @Version 1.0
 */
public class UserServiceImpl implements UserService {

    private UserDao userDao;

    public UserServiceImpl(){
        userDao = new UserDaoImpl();
    }
    @Override
    public User getUser(String username) {
        User user = new User();
        user.setUsername(username);
        return userDao.selectReceiver(username);
    }

    @Override
    public void insertUser(User user) {
        userDao.addUser(user);

    }

    @Override
    public void updateUser(User user) {
        userDao.updateUser(user);

    }
}
