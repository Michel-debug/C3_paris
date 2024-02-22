package com.c3paris.service.Impl;

import com.c3paris.entity.InfoContact;
import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class Sendmail extends Thread{
    private static final String serviceMail = "3514392219@qq.com";   //代理服务器邮箱
//    private static final String serviceUsername="3514392219@qq.com";
//    private static final String servicePassword="axgpwocbmjbzdbaf";
    private static final String serviceUsername="m79322502-159902051";
    private static final String serviceEmail = "fengjiaqi@c3paris.com";
    private static final String servicePassword="Fengjiaqi123!";
    private InfoContact infoContact;

    private static final String responsableMail = "fengjiaqi@c3paris.com";


    public Sendmail(InfoContact infoContact){
        this.infoContact = infoContact;
    }

    @Override
    public void run() {
        try{
                Properties prop = new Properties();
//                prop.setProperty("mail.host","smtp.qq.com");
//                prop.setProperty("mail.transport.protocol","smtp");
//                prop.setProperty("mail.smtp.auth","true");
            prop.setProperty("mail.host","smtp.ionos.fr");
            prop.setProperty("mail.transport.protocol","smtp");
            prop.setProperty("mail.smtp.auth","true");
                // 关于QQ邮箱，还要设置SSL加密，加上以下代码即可
                MailSSLSocketFactory sf = new MailSSLSocketFactory();
                sf.setTrustAllHosts(true);
                prop.put("mail.smtp.ssl.enable","true");
                prop.put("mail.smtp.ssl.socketFactory",sf);
            //1、创建定义整个应用程序所需的环境信息的 Session 对象

            Session session = Session.getDefaultInstance(prop, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(serviceUsername,servicePassword);
                }
            });
            session.setDebug(true);

            //2.获取连接对象
            Transport transport = session.getTransport();
            transport.connect("smtp.ionos.fr",serviceEmail,servicePassword);

            /*
            one for responsable
             */
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(serviceEmail));
            message.setRecipient(Message.RecipientType.TO,new InternetAddress(responsableMail));
            message.setSubject("Feed back from"+"c3_client:"+infoContact.getName());
            String feedbackMsg="name : "+infoContact.getName()+"\n"+"phone : "+infoContact.getPhone()+"\n"+"email : "+infoContact.getEmail()+
                    "\n"+"Message : "+infoContact.getComment();
            message.setText(feedbackMsg);

            transport.sendMessage(message, message.getAllRecipients());
            System.out.println("for responsable");

            /*
            one for client
             */
            Message cutomerServiceMsg = new MimeMessage(session);
            cutomerServiceMsg.setFrom(new InternetAddress(serviceEmail));
            cutomerServiceMsg.setRecipient(Message.RecipientType.TO,new InternetAddress(infoContact.getEmail()));
            cutomerServiceMsg.setSubject("Reception automatique  -- C3 Paris");
            String customServiceMail="Think you for your feedback, we are trying to respond you\n"+
                    "                                                                    --- C3 Paris";
            cutomerServiceMsg.setText(customServiceMail);
            transport.sendMessage(cutomerServiceMsg, cutomerServiceMsg.getAllRecipients());
            System.out.println("for client");

            transport.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
