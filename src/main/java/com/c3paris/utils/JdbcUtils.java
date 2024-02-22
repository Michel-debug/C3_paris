package com.c3paris.utils;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

/**
 * 数据库工具类 阿里云杜鲁门数据库连接池
 */
public class JdbcUtils {
    private static DruidDataSource dataSource;
    private static ThreadLocal<Connection> conns = new ThreadLocal<Connection>();
    static {
        try {
            Properties properties = new Properties();

            InputStream inputStream = JdbcUtils.class.getClassLoader().getResourceAsStream("jdbc.properties");

            properties.load(inputStream);

            dataSource = (DruidDataSource) DruidDataSourceFactory.createDataSource(properties);

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    /**
     * 获取连接
     * @return
     */
    public static Connection getConnection(){

        Connection conn = conns.get();

        if (conn == null){
            try{

                conn = dataSource.getConnection();

                //暂时 先注释掉 等之后项目上线 开始启用过滤器，再设置事务管理
            //    conn.setAutoCommit(false);
            }catch (SQLException e){

                e.printStackTrace();
            }
        }
        return conn;
    }

    /**
     *   提交事务
     */

    public static void commitAndClose(){
        Connection connection = conns.get();
        if (connection!=null){
            try{
                connection.commit();
            }catch (SQLException e){
                e.printStackTrace();
            }finally {
                try{
                    connection.close();
                }catch (SQLException e){
                    e.printStackTrace();
                }
            }
        }
        conns.remove();
    }

    /**
     * 事务回滚
     */
    public static void rollbackAndClose(){
        Connection connection = conns.get();
        if (connection != null){
            try{
                connection.rollback();
            }catch (SQLException e){
                e.printStackTrace();
            }finally {
                try{
                    connection.close();
                }catch (SQLException e){
                    e.printStackTrace();
                }
            }
        }
        conns.remove();
    }
//    public static void close(Connection conn){
//        try{
//            if(conn!=null){
//                conn.close();
//            }
//        }catch (SQLException e){
//            e.printStackTrace();
//        }
//    }
}
