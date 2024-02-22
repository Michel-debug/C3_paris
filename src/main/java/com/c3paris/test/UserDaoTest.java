package com.c3paris.test;

import com.c3paris.dao.Impl.UserDaoImpl;
import com.c3paris.dao.UserDao;
import com.c3paris.entity.InfoContact;
import org.junit.Test;


public class UserDaoTest {
    private UserDao userDao = new UserDaoImpl();

    @Test
    public void saveInfo() {

        userDao.saveInfo(new InfoContact("michel","724915929@gmail.com","18867740611"));
    }
}