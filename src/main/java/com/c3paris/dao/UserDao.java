package com.c3paris.dao;

import com.c3paris.entity.InfoContact;

public interface UserDao {
    public InfoContact queryInfoByPhone(String phone);
    public InfoContact queryInfoByphoneAndname(String username, String password);
    public int saveInfo(InfoContact infoContact);

}
