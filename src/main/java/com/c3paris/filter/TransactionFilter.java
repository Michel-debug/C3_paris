package com.c3paris.filter;

import com.c3paris.utils.JdbcUtils;

import javax.servlet.*;
import java.io.IOException;

public class TransactionFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        try {
            filterChain.doFilter(servletRequest,servletResponse);
            JdbcUtils.commitAndClose();
        }catch (Exception e){
            JdbcUtils.rollbackAndClose();
            e.printStackTrace();
            throw new RuntimeException();
        }
    }
}
