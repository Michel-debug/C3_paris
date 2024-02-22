package com.c3paris.utils;

import org.apache.commons.beanutils.BeanUtils;

import java.lang.reflect.InvocationTargetException;
import java.util.Map;

public class WebUtils {
    /*
    将获取到的参数 自动转换成javabean
     */
    public static <T>T copyParamToBean(Map value, T bean){
        try{
            BeanUtils.populate(bean,value);

        }catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (InvocationTargetException e) {
            throw new RuntimeException(e);
        }
        return bean;
    }
}
