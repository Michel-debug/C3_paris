package com.c3paris.web;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;

public class BaseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        String action = req.getParameter("action");
        try{
            Method declaredMethod = this.getClass().getDeclaredMethod(action,HttpServletRequest.class,HttpServletResponse.class);
            declaredMethod.invoke(this,req,resp);
        }catch (Exception e){
            e.printStackTrace();
            throw new RuntimeException(e); //给过滤器使用
        }
    }
}
