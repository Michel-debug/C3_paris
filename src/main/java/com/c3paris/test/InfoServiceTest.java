package com.c3paris.test;

import com.c3paris.entity.InfoContact;
import com.c3paris.service.Impl.InfoServiceImpl;
import com.c3paris.service.InfoService;
import org.junit.Test;


public class InfoServiceTest {

    private InfoService infoService = new InfoServiceImpl();
    @Test
    public void saveInfo() {
            infoService.SaveInfo(new InfoContact("MICHEL","123","123123"));
    }
}