package com.ig.dao.impl;

import com.ig.dao.BaseDao;
import com.ig.entity.User;
import com.ig.util.DBUtil;

import javax.sql.rowset.CachedRowSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDaoImpl extends DBUtil implements BaseDao<User> {

    /**
     * 根据用户名或编号查询单个用户
     */
    @Override
    public User getOne(User user) {
        User user2 = null;
        CachedRowSet crs = null;
        if (user.getUserId() != 0) {
            crs = this.execQuery("select * from t_user where user_id = ?", user.getUserId());
        } else if (user.getUserName() != null) {
            crs = this.execQuery("select * from t_user where user_name = ?", user.getUserName());
        }
        if (crs.size() != 0) {
            try {
                while (crs.next()) {
                    user2 = crsGet(crs);
                }
                crs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return user2;
    }

    /**
     * 查询所有用户
     */
    @Override
    public List<User> getAll() {
        List<User> list = new ArrayList<>();
        String sql = "select * from t_user where grade<9";
        CachedRowSet crs = this.execQuery(sql);
        try {
            while (crs.next()) {
                list.add(crsGet(crs));
            }
            crs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * 查询所有用户并分页
     */
    public List<User> getAll(int pageNo, int pageSize) {
        List<User> list = new ArrayList<>();
        String sql = "select * from t_user where  grade<9 limit ?,?";
        Object[] agrs = {(pageNo - 1) * pageSize, pageSize};
        CachedRowSet crs = this.execQuery(sql, agrs);
        try {
            while (crs.next()) {
                list.add(crsGet(crs));
            }
            crs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * 按属性查
     *
     * @param user
     * @return
     */
    @Override
    public List<User> getAll(User user) {
        List<User> list = new ArrayList<>();
        if (user.getUserName() != null) {//根据用户名查
            String sql = "select * from t_user where user_name like \"%\"?\"%\" and grade<9";
            Object[] agrs = {user.getUserName()};
            CachedRowSet crs = this.execQuery(sql, agrs);
            try {
                while (crs.next()) {
                    list.add(crsGet(crs));
                }
                crs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else if (user.getTell() != null) {//根据电话查
            String sql = "select * from t_user where tell=? and grade<9";
            Object[] agrs = {user.getTell()};
            CachedRowSet crs = this.execQuery(sql, agrs);
            try {
                while (crs.next()) {
                    list.add(crsGet(crs));
                }
                crs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {//根据等级查
            String sql = "select * from t_user where grade = ? and grade<9";
            Object[] agrs = {user.getGrade()};
            CachedRowSet crs = this.execQuery(sql, agrs);
            try {
                while (crs.next()) {
                    list.add(crsGet(crs));
                }
                crs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public List<User> getAll(User user,int pageNo, int pageSize) {
        List<User> list = new ArrayList<>();
        if (user.getUserName() != null) {//根据用户名查
            String sql = "select * from t_user where user_name like \"%\"?\"%\" and grade<9 limit ?,?";
            Object[] agrs = {user.getUserName(),(pageNo - 1) * pageSize, pageSize};
            CachedRowSet crs = this.execQuery(sql, agrs);
            try {
                while (crs.next()) {
                    list.add(crsGet(crs));
                }
                crs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else if (user.getTell() != null) {//根据电话查
            String sql = "select * from t_user where tell=? and grade<9 limit ?,?";
            Object[] agrs = {user.getTell(),(pageNo - 1) * pageSize, pageSize};
            CachedRowSet crs = this.execQuery(sql, agrs);
            try {
                while (crs.next()) {
                    list.add(crsGet(crs));
                }
                crs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {//根据等级查
            String sql = "select * from t_user where grade = ? and grade<9 limit ?,?";
            Object[] agrs = {user.getGrade(),(pageNo - 1) * pageSize, pageSize};
            CachedRowSet crs = this.execQuery(sql, agrs);
            try {
                while (crs.next()) {
                    list.add(crsGet(crs));
                }
                crs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    /**
     * 添加用户
     */
    @Override
    public int add(User user) {
        String sql = "insert into t_user (user_name, password,tell,address,grade) values(?,?,?,?,?)";
        Object[] args = {user.getUserName(), user.getPassword(), user.getTell(), user.getAddress(),
                user.getGrade()};
        return this.execUpdate(sql, args);
    }

    /**
     * 删除用户
     */
    @Override
    public int delete(Object uid) {
        String sql = "delete from t_user where user_id=?";
        Object[] args = {uid};
        return this.execUpdate(sql, args);
    }

    /**
     * 修改用户
     */
    @Override
    public int update(User user) {
        String sql = "update t_user set user_name = ?,password = ?,tell =?,address = ?,grade = ? where user_id=?";
        Object[] args = {user.getUserName(), user.getPassword(), user.getTell(), user.getAddress(), user.getGrade(),
                user.getUserId()};
        return this.execUpdate(sql, args);
    }

    /**
     * 处理查询结果
     */
    @Override
    public User crsGet(CachedRowSet crs) throws SQLException {
        User user = new User();
        user.setUserId(crs.getInt("user_id"));
        user.setUserName(crs.getString("user_name"));
        user.setPassword(crs.getString("password"));
        user.setTell(crs.getString("tell"));
        user.setAddress(crs.getString("address"));
        user.setGrade(crs.getInt("grade"));
        return user;
    }

}
