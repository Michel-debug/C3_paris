package com.c3paris.dao.Impl;

import com.c3paris.dao.UserDao;
import com.c3paris.entity.InfoContact;

public class UserDaoImpl extends BaseDao implements UserDao {
    /**
     * 前两个方法用于后期拓展业务
     * @param phone
     * @return
     */
    @Override
    public InfoContact queryInfoByPhone(String phone){
        return null;
    }
    @Override
    public InfoContact queryInfoByphoneAndname(String username, String password){
        return null;
    }

    /**
     * 目前主要是记录客户信息
     * @param infoContact
     * @return
     */
    @Override
    public int saveInfo(InfoContact infoContact){
        String sql = "insert into t_contact(name,email,phone) values(?,?,?)";
        return update(sql,infoContact.getName(),infoContact.getEmail(),infoContact.getPhone());
    }
}
