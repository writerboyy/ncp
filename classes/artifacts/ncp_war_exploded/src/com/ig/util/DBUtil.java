package com.ig.util;

import com.sun.rowset.CachedRowSetImpl;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.sql.rowset.CachedRowSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//import javax.naming.Context;
//import javax.naming.InitialContext;
//import javax.naming.NamingException;
//import javax.sql.DataSource;

/**
 * 数据库访问的通用类
 *
 * @author Administrator
 */
public class DBUtil {
    // 修改密码
    // 在cmd环境下进入mysql/bin目录
    // mysqladmin -u用户名 -p旧密码  password 新密码
    private final static String URL = "jdbc:mysql://localhost/ncp?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
    private final static String USER = "root";
    private final static String PASSWORD = "123456";
    private final static String DRIVER = "com.mysql.cj.jdbc.Driver";

    /**
     * 定义方法返回一个连接(Connection)对象
     *
     * @return 返回值就是一个连接对象
     */
    private Connection getConnection() {
        Connection conn = null;
        try {
//            Class.forName(DRIVER);
//            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            Context ct = new InitialContext();
            DataSource dataSource = (DataSource) ct.lookup("java:comp/env/ncpDB");
            conn = dataSource.getConnection();
        } // 低版本的jdbc jar包
        catch (SQLException e) {
            e.printStackTrace();
        } catch (NamingException e) {
            e.printStackTrace();
        }
        return conn;
    }

    /**
     * 一个方法来做增加删除和修改
     *
     * @param sql   要执行的sql
     * @param param 执行的sql中包含的参数的实际值
     * @return int 表示的是受影响的行
     */
    public int execUpdate(String sql, Object... param) {
        Connection conn = getConnection();
        PreparedStatement pstmt = null;
        int result = 0;
        try {
            //conn.setAutoCommit( false );
            //conn.setAutoCommit(true);
            pstmt = conn.prepareStatement(sql);
            for (int i = 0; i < param.length; i++) {
                pstmt.setObject(i + 1, param[i]);
            }
            result = pstmt.executeUpdate();
            //conn.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeAll(null, pstmt, conn);
        }
        return result;
    }

    /**
     * 一个方法来做查询
     *
     * @param sql   要执行查询的sql语句
     * @param param 要执行sql对应的参数
     * @return CachedRowSet 缓存的结果集
     */
    public CachedRowSet execQuery(String sql, Object... param) {
        Connection conn = getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        // 实例化CachedRowSetImpl
        CachedRowSetImpl crs = null;
        try {
            crs = new CachedRowSetImpl();
            pstmt = conn.prepareStatement(sql);
            // 可以吧param当成是一个数组
            // System.out.println(param.length);

            for (int i = 0; i < param.length; i++) {
                pstmt.setObject(i + 1, param[i]);
            }
            rs = pstmt.executeQuery();
            // 建立rs和crs关系，可以将rs的数据行缓存到crs中了
            crs.populate(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 释放资源等 此处代码省略
            closeAll(rs, pstmt, conn);
        }
        return crs;
    }

    /**
     * 释放资源
     *
     * @param rs    结果集兑现
     * @param pstmt 预处理语句对象
     * @param conn  连接对象
     */
    private void closeAll(ResultSet rs, PreparedStatement pstmt, Connection conn) {
        try {
            if (rs != null)
                rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (pstmt != null)
                pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (conn != null)
                conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
