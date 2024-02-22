package com.c3paris.test;

import com.c3paris.entity.InfoContact;
import com.c3paris.service.Impl.Sendmail;
import org.junit.Test;

public class SendEmailTest {
    InfoContact infoContact = new InfoContact("cjj","123","123");
    @Test
    public void SendEmail(){
        Sendmail sendmail = new Sendmail(infoContact);
        sendmail.start();
    }
}
