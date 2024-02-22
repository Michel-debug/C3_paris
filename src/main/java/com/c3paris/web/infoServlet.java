package com.c3paris.web;

import com.c3paris.entity.InfoContact;
import com.c3paris.service.Impl.InfoServiceImpl;
import com.c3paris.service.InfoService;
import com.c3paris.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class infoServlet extends BaseServlet{

    /**
     * 请求转发功能
     */
    protected void page(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        /*
        当前无分页功能 直接请求转发，
         */

        req.getRequestDispatcher("/pages/index.jsp").forward(req,resp );
    }

}
