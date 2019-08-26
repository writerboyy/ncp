package com.ig.dao.impl;

import com.ig.dao.BaseDao;
import com.ig.entity.Goods;
import com.ig.util.DBUtil;

import javax.sql.rowset.CachedRowSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GoodsDaoImpl extends DBUtil implements BaseDao<Goods> {

    /**
     * 查询单个商品
     */
    @Override
    public Goods getOne(Goods goods) {
        Goods good = new Goods();
        /**
         * 根据商品名查询商品
         */
        if (goods.getGoodsName() != null) {
            CachedRowSet crs = this.execQuery(
                    "select goods_id,goods_name,price,text,pic,stock,sales_number,type_id from t_goods where goods_name=?",
                    goods.getGoodsName());
            if (crs.size() != 0) {
                try {
                    while (crs.next()) {
                        good = crsGet(crs);
                    }
                    crs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return good;
            }
        }
        /**
         * 根据商品Id查询商品
         */
        if (goods.getGoodsId() != 0) {
            CachedRowSet crs = this.execQuery(
                    "select goods_id,goods_name,price,text,pic,stock,sales_number,type_id from t_goods where goods_id =?",
                    goods.getGoodsId());
            if (crs.size() != 0) {
                try {
                    while (crs.next()) {
                        good = crsGet(crs);
                    }
                    crs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return good;
            }
        }
        return null;
    }

    /**
     * 根据属性查询
     */
    @Override
    public List<Goods> getAll(Goods goods) {

        List<Goods> listGoods = new ArrayList<>();
        /**
         * 根据类别查询商品
         */
        if (goods.getTypeId() != 0 && goods.getGoodsName() == null) {
            CachedRowSet crs = this.execQuery(
                    "select goods_id,goods_name,price,text,pic,stock,sales_number,type_id from t_goods where type_id =?",
                    goods.getTypeId());
            if (crs.size() != 0) {
                try {
                    while (crs.next()) {
                        listGoods.add(crsGet(crs));
                    }
                    crs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return listGoods;
            }
        }

        /**
         * 根据商品名模糊查询商品
         */
        if (goods.getGoodsName() != null) {
            /**
             * 根据类别查询商品
             */
            if (goods.getTypeId() != 0) {
                CachedRowSet crs = this.execQuery(
                        "select goods_id,goods_name,price,text,pic,stock,sales_number,type_id from t_goods where goods_name like \"%\"?\"%\" and type_id =? ",
                        goods.getGoodsName(), goods.getTypeId());
                if (crs.size() != 0) {
                    try {
                        while (crs.next()) {
                            listGoods.add(crsGet(crs));
                        }
                        crs.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    return listGoods;
                }
            } else {
                CachedRowSet crs = this.execQuery(
                        "select goods_id,goods_name,price,text,pic,stock,sales_number,type_id from t_goods where goods_name like \"%\"?\"%\"",
                        goods.getGoodsName());
                if (crs.size() != 0) {
                    try {
                        while (crs.next()) {
                            listGoods.add(crsGet(crs));
                        }
                        crs.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    return listGoods;
                }
            }
        } else {
            /**
             * 如果属性什么都不传就是 查询销量排行的商品
             */
            CachedRowSet crs = this.execQuery(
                    "select goods_id,goods_name,price,text,pic,stock,sales_number,type_id from t_goods order by sales_number DESC ");
            if (crs.size() != 0) {
                try {
                    while (crs.next()) {
                        listGoods.add(crsGet(crs));
                    }
                    crs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return listGoods;
            }
        }
        return null;
    }

    /**
     * 查询商品按升序查询
     */
    public List<Goods> getDescAll(Goods goods) {
        List<Goods> listGoods = new ArrayList<>();
        /**
         * 根据类别人气降序查询商品
         */
        if (goods.getTypeId() != 0 && goods.getGoodsName() == null) {
            /**
             * 根据类别价格降序查询商品
             */
            if (goods.getPrice() != null) {
                if (goods.getPrice() > 0) {
                    CachedRowSet crs = this.execQuery(
                            "select goods_id,goods_name,price,text,pic,stock,sales_number,type_id from t_goods where type_id =? order by price DESC",
                            goods.getTypeId());
                    if (crs.size() != 0) {
                        try {
                            while (crs.next()) {
                                listGoods.add(crsGet(crs));
                            }
                            crs.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                        return listGoods;
                    }
                } else if (goods.getPrice() < 0) {
                    CachedRowSet crs = this.execQuery(
                            "select goods_id,goods_name,price,text,pic,stock,sales_number,type_id from t_goods where type_id =? order by price ASC",
                            goods.getTypeId());
                    if (crs.size() != 0) {
                        try {
                            while (crs.next()) {
                                listGoods.add(crsGet(crs));
                            }
                            crs.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                        return listGoods;
                    }
                }
            } else if (goods.getSalesNumber() != 0) {
                if (goods.getSalesNumber() > 0) {
                    CachedRowSet crs = this.execQuery(
                            "select goods_id,goods_name,price,text,pic,stock,sales_number,type_id from t_goods where type_id =? order by sales_number DESC",
                            goods.getTypeId());
                    if (crs.size() != 0) {
                        try {
                            while (crs.next()) {
                                listGoods.add(crsGet(crs));
                            }
                            crs.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                        return listGoods;
                    }

                } else if (goods.getSalesNumber() < 0) {
                    CachedRowSet crs = this.execQuery(
                            "select goods_id,goods_name,price,text,pic,stock,sales_number,type_id from t_goods where type_id =? order by sales_number ASC",
                            goods.getTypeId());
                    if (crs.size() != 0) {
                        try {
                            while (crs.next()) {
                                listGoods.add(crsGet(crs));
                            }
                            crs.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                        return listGoods;
                    }
                }

            } /**
             * 根据类别查询商品
             */
            else {
                CachedRowSet crs = this.execQuery(
                        "select goods_id,goods_name,price,text,pic,stock,sales_number,type_id from t_goods where type_id =?",
                        goods.getTypeId());
                if (crs.size() != 0) {
                    try {
                        while (crs.next()) {
                            listGoods.add(crsGet(crs));
                        }
                        crs.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    return listGoods;
                }
            }
        } else {
            /**
             * 根据相应商品价格降序查询商品
             */
            if (goods.getPrice() != null) {
                if (goods.getPrice() > 0) {
                    CachedRowSet crs = this.execQuery(
                            "select goods_id,goods_name,price,text,pic,stock,sales_number,type_id from t_goods where goods_name like \"%\"?\"%\" order by price DESC",
                            goods.getGoodsName());
                    if (crs.size() != 0) {
                        try {
                            while (crs.next()) {
                                listGoods.add(crsGet(crs));
                            }
                            crs.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                        return listGoods;
                    }
                } else if (goods.getPrice() < 0) {
                    CachedRowSet crs = this.execQuery(
                            "select goods_id,goods_name,price,text,pic,stock,sales_number,type_id from t_goods where goods_name like \"%\"?\"%\" order by price ASC",
                            goods.getGoodsName());
                    if (crs.size() != 0) {
                        try {
                            while (crs.next()) {
                                listGoods.add(crsGet(crs));
                            }
                            crs.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                        return listGoods;
                    }
                }
            } else if (goods.getSalesNumber() != 0) {
                if (goods.getSalesNumber() > 0) {
                    CachedRowSet crs = this.execQuery(
                            "select goods_id,goods_name,price,text,pic,stock,sales_number,type_id from t_goods where goods_name like \"%\"?\"%\" order by sales_number DESC",
                            goods.getGoodsName());
                    if (crs.size() != 0) {
                        try {
                            while (crs.next()) {
                                listGoods.add(crsGet(crs));
                            }
                            crs.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                        return listGoods;
                    }

                } else if (goods.getSalesNumber() < 0) {
                    CachedRowSet crs = this.execQuery(
                            "select goods_id,goods_name,price,text,pic,stock,sales_number,type_id from t_goods where goods_name like \"%\"?\"%\" order by sales_number ASC",
                            goods.getGoodsName());
                    if (crs.size() != 0) {
                        try {
                            while (crs.next()) {
                                listGoods.add(crsGet(crs));
                            }
                            crs.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                        return listGoods;
                    }
                }
            }
            /**
             * 根据商品名模糊查询商品
             */
            else {
                CachedRowSet crs = this.execQuery(
                        "select goods_id,goods_name,price,text,pic,stock,sales_number,type_id from t_goods where goods_name like \"%\"?\"%\"",
                        goods.getGoodsName());
                if (crs.size() != 0) {
                    try {
                        while (crs.next()) {
                            listGoods.add(crsGet(crs));
                        }
                        crs.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    return listGoods;
                }
            }
        }
        return null;
    }

    /**
     * 查询所有商品
     */
    public List<Goods> getAll() {
        List<Goods> listGoods = new ArrayList<>();
        CachedRowSet crs = this
                .execQuery("select goods_id,goods_name,price,text,pic,stock,sales_number,type_id from t_goods");
        if (crs.size() != 0) {
            try {
                while (crs.next()) {
                    listGoods.add(crsGet(crs));
                }
                crs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return listGoods;
        }
        return null;
    }

    /**
     * 增加商品
     */
    @Override
    public int add(Goods goods) {
        String sql = "insert into  t_goods (goods_name,price,text,pic,stock,sales_number,type_id) values (?,?,?,?,?,?,?)";
        Object[] args = {goods.getGoodsName(), goods.getPrice(), goods.getText(), goods.getPic(), goods.getStock(),
                goods.getSalesNumber(), goods.getTypeId()};
        return this.execUpdate(sql, args);
    }

    /**
     * 通过商品id删除商品
     */
    @Override
    public int delete(Object goods_id) {
        String sql = "delete from t_goods where goods_id=?";
        Object[] args = {goods_id};
        return this.execUpdate(sql, args);
    }

    /**
     * 通过一个新的商品，利用原先的id，替换原先的商品 更新商品
     */
    @Override
    public int update(Goods goods) {
        String sql = "update t_goods set goods_name=?,price=?,text=?,pic=?,stock=?,sales_number=?,type_id=? where goods_id=?";
        Object[] args = {goods.getGoodsName(), goods.getPrice(), goods.getText(), goods.getPic(), goods.getStock(),
                goods.getSalesNumber(), goods.getTypeId(), goods.getGoodsId()};
        return this.execUpdate(sql, args);
    }

    /**
     * 查询某个商品最新的产品
     */

    public List<Goods> getXinAll(Goods goods) {

        List<Goods> listGoods = new ArrayList<>();
        /**
         * 根据类别查询商品
         */
        CachedRowSet crs = this.execQuery(
                "select goods_id,goods_name,price,text,pic,stock,sales_number,type_id from t_goods where type_id =? ORDER BY goods_id DESC",
                goods.getTypeId());
        if (crs.size() != 0) {
            try {
                while (crs.next()) {
                    listGoods.add(crsGet(crs));
                }
                crs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return listGoods;
        }
        return null;
    }

    /**
     * 修改商品销量
     */
    public int updateSalas(Goods goods) {
        GoodsDaoImpl goodsDao = new GoodsDaoImpl();
        Goods good = goodsDao.getOne(goods);
        good.getSalesNumber();

        String sql = "update t_goods set sales_number=? where goods_id=?";
        Object[] args = {goods.getSalesNumber() + good.getSalesNumber(), goods.getGoodsId()};
        return this.execUpdate(sql, args);
    }

    @Override
    public Goods crsGet(CachedRowSet crs) throws SQLException {
        Goods goods = new Goods();
        goods.setGoodsId(crs.getInt("goods_id"));
        goods.setGoodsName(crs.getString("goods_name"));
        goods.setPrice(crs.getDouble("price"));

        goods.setText(crs.getString("text"));
        goods.setPic(crs.getString("pic"));
        goods.setSalesNumber(crs.getInt("sales_number"));
        goods.setStock(crs.getInt("stock"));
        goods.setTypeId(crs.getInt("type_id"));
        return goods;
    }

}
