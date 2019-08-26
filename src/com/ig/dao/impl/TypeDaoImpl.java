package com.ig.dao.impl;

import com.ig.dao.BaseDao;
import com.ig.entity.Type;
import com.ig.util.DBUtil;

import javax.sql.rowset.CachedRowSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TypeDaoImpl extends DBUtil implements BaseDao<Type> {

    /**
     * 查询单个类别
     */
    @Override
    public Type getOne(Type t) {
        Type type2 = null;
        CachedRowSet crs = null;
        if (t.getTypeId() != 0) {
            crs = this.execQuery("select*from t_type where type_id=?", t.getTypeId());
        } else if (t.getTypeName() != null) {
            crs = this.execQuery("select*from t_type where type_name=?", t.getTypeName());
        }
        if (crs.size() == 0) {
            return null;
        } else {
            try {
                while (crs.next()) {
                    type2 = crsGet(crs);
                }
                crs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return type2;
    }

    /**
     * 查询所有类别
     */

    @Override
    public List<Type> getAll() {
        List<Type> list = new ArrayList<>();
        String sql = "select * from t_type";
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
     * 根据类别增加商品
     */
    @Override
    public int add(Type t) {
        String sql = "insert into  t_type (type_name) values (?)";
        Object[] args = {t.getTypeName()};
        return this.execUpdate(sql, args);
    }

    /**
     * 根据类别删除商品
     */
    @Override
    public int delete(Object id) {
        String sql = "delete from t_type where type_id=?";
        Object[] args = {id};
        return this.execUpdate(sql, args);
    }

    /**
     * 根据类别修改商品
     */
    @Override
    public int update(Type t) {
        String sql = "update t_type set type_name =? where type_id=?";
        Object[] args = {t.getTypeName(), t.getTypeId()};
        return this.execUpdate(sql, args);
    }

    /**
     *模糊查询
     */
    @Override
    public List<Type> getAll(Type type) {
        List<Type> listType = new ArrayList<>();
        if (type.getTypeName() != null) {
            CachedRowSet crs = this.execQuery(
                    "select type_id,type_name from t_type where type_name like \"%\"?\"%\" ", type.getTypeName());
            if (crs.size() != 0) {
                try {
                    while (crs.next()) {
                        listType.add(crsGet(crs));
                    }
                    crs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }else{
            listType=this.getAll();
        }
        return listType;
    }
    @Override
    public Type crsGet(CachedRowSet crs) throws SQLException {
        Type type = new Type();
        type.setTypeId(crs.getInt("type_id"));
        type.setTypeName(crs.getString("type_name"));
        return type;
    }
}
