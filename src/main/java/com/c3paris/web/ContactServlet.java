package com.c3paris.web;

import com.c3paris.entity.InfoContact;
import com.c3paris.service.Impl.InfoServiceImpl;
import com.c3paris.service.Impl.Sendmail;
import com.c3paris.service.InfoService;
import com.c3paris.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Properties;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

public class ContactServlet extends BaseServlet{
    private InfoService infoService = new InfoServiceImpl();
    protected void contactService(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        //resp.getWriter().write(username+" "+phone+" "+email);
        String token = (String)req.getSession().getAttribute(KAPTCHA_SESSION_KEY);
        System.out.println(token);
        req.getSession().removeAttribute(KAPTCHA_SESSION_KEY);
        req.setAttribute("scrollTo","feedback");
        if (token != null && req.getParameter("code").equals(token)){
                InfoContact infoContact = WebUtils.copyParamToBean(req.getParameterMap(),new InfoContact());
                infoService.SaveInfo(infoContact);
                try {
                    Sendmail send = new Sendmail(infoContact);
                    send.start();
                }catch (Exception e){
                    req.setAttribute("message","failed! our email ne marche pas !");
                    e.printStackTrace();
                    req.getRequestDispatcher("/pages/index.jsp").forward(req,resp);
                }
                req.setAttribute("message","success, we have received your email, please wait be patient !!!!!");
                req.getRequestDispatcher("/pages/index.jsp").forward(req,resp);

        }else{
            req.setAttribute("message","failed! your code isn't correct, please repeat!!!!");
            InfoContact infoContact = WebUtils.copyParamToBean(req.getParameterMap(),new InfoContact());
            req.setAttribute("name",infoContact.getName());
            req.setAttribute("email",infoContact.getEmail());
            req.setAttribute("phone",infoContact.getPhone());
            req.setAttribute("comment",infoContact.getComment());
            req.getRequestDispatcher("/pages/index.jsp").forward(req,resp);
        }


    }


}
