package com.c3paris.service.Impl;

import com.c3paris.dao.Impl.UserDaoImpl;
import com.c3paris.dao.UserDao;
import com.c3paris.entity.InfoContact;
import com.c3paris.service.InfoService;

public class InfoServiceImpl implements InfoService {

    private UserDao userDao = new UserDaoImpl();
    public InfoServiceImpl(){

    }
    @Override
    public void SaveInfo(InfoContact infoContact) {
        userDao.saveInfo(infoContact);
    }
}
