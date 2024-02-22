package com.c3paris.dao.Impl;


import com.c3paris.utils.JdbcUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public abstract class BaseDao {

    private QueryRunner queryRunner = new QueryRunner();

    /**
     * 以下所有方法 进行数据库更新查询操作，并于java bean联合处理
     *
     * @param sql
     * @param parm
     * @return
     */
    public int update(String sql, Object... parm) {
        Connection connection = JdbcUtils.getConnection();
        try {
            return queryRunner.update(connection, sql, parm);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public <T> T queryForone(Class<T> type, String sql, Object... args) {
        Connection conn = JdbcUtils.getConnection();
        try {
            return queryRunner.query(conn, sql, new BeanHandler<T>(type), args);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public <T> List<T> queryForlist(Class<T> type, String sql, Object... args) {
        Connection conn = JdbcUtils.getConnection();
        try {
            return queryRunner.query(conn, sql, new BeanListHandler<T>(type), args);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 执行返回一列的sql语句
     *
     * @param sql  sql语句
     * @param args sql对应的参数值
     * @return
     */
    public Object queryForSingleValue(String sql, Object... args) {
        Connection conn = JdbcUtils.getConnection();
        try {
            return queryRunner.query(conn, sql, new ScalarHandler(), args);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
