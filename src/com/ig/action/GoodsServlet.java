package com.ig.action;

import com.ig.dao.impl.GoodsDaoImpl;
import com.ig.entity.Goods;
import com.ig.entity.Type;
import com.ig.service.GoodsService;
import com.ig.service.TypeService;
import com.ig.service.impl.GoodsServiceImpl;
import com.ig.service.impl.TypeServiceImpl;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/goods")
public class GoodsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static List<Goods> Lastlist;
    private String lastGoodsName;
    private static List<Goods> tuilist;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String flag;
        String pagenum = null;
        String goodsId = null;
        String goodsName = null;
        String price = null;
        String pic = null;
        String text = null;
        String stock = null;
        String typeId = null;
        String select = null;
        String salesNumber = null;
        HttpSession session = null;
        int typeid = 0;
        GoodsService goodsService = new GoodsServiceImpl();
        GoodsDaoImpl goodsDaoImpl = new GoodsDaoImpl();
        TypeService typeService = new TypeServiceImpl();
        Goods goods = new Goods();
        Goods g = new Goods();
        List<Goods> list = new ArrayList<>();
        List<Type> typeList = new ArrayList<>();
        List<List> daolist = new ArrayList();
        // 检查是否是表单文件上请求
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (isMultipart)
            flag = "1";
        else {
            flag = request.getParameter("flag");
            session = request.getSession();
            if (flag == null) {
                flag = "0";
            }
        }

        switch (Integer.valueOf(flag)) {
            case 0:
                typeList = typeService.getAll();
                session.setAttribute("typeList", typeList);

                List<Goods> list2 = goodsService.getAll();
                Lastlist = (List) session.getAttribute("Lastlist");
                pagenum = request.getParameter("pagenum");
                if (Lastlist != null) {
                    list = fengye(Lastlist, pagenum, session);
                } else {
                    list = fengye(list2, pagenum, session);
                }

                session.setAttribute("list", list);
                response.sendRedirect("backstage/product_list.jsp");
                //request.getRequestDispatcher("backstage/product_list.jsp").forward(request,response);
                break;
            /**
             * 添加商品
             */
            case 1:
//                File f = new File("D://pic//");
//                if (f.exists()) {     //判断是否存在
//                } else {
//                    f.mkdir();     //创建文件
//                }
                try {
                    //  创建上传对象
                    ServletFileUpload upload = new ServletFileUpload();
                    // 分析请求
                    FileItemIterator iter = upload.getItemIterator(request); //得到所有的上传数据
                    while (iter.hasNext()) { //循环上传表单的元素
                        FileItemStream item = iter.next();
                        String name = item.getFieldName(); //得到元素名
                        InputStream stream = item.openStream();
                        if (item.isFormField()) { //如果是普通元素，打印元素名与值
                            String value = Streams.asString(stream, "utf-8");
                            if ("goodsName".equals(name)) {
                                goods.setGoodsName(value);
                            }
                            if ("select".equals(name)) {
                                goods.setTypeId(Integer.valueOf(value));
                            }
                            if ("price".equals(name)) {
                                goods.setPrice(Double.valueOf(value));
                            }
                            if ("stock".equals(name)) {
                                goods.setStock(Integer.valueOf(value));
                            }
                            if ("text".equals(name)) {
                                goods.setText(value);
                            }
                        } else {//如果是文件型的元素，打印元素名与文件名
                            //保存文件
                            String ext = FilenameUtils.getExtension(item.getName());//获取文件后缀名
                            String file = (System.currentTimeMillis() + "." + ext);
                            if (file.contains("g")) {
                                //D:\Projects\ncp\WebContent\reception\images\goods
                                FileOutputStream fos = new FileOutputStream(new File("D:\\Projects\\ncp\\WebContent\\reception\\images\\goods\\" + file));
                                goods.setPic(file);
                                IOUtils.copy(item.openStream(), fos);
                                IOUtils.closeQuietly(item.openStream());
                                fos.flush();
                                fos.close();
                            }
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                if (goodsService.getOne(goods) != null) {
                    Goods temp = goodsService.getOne(goods);
                    goods.setGoodsId(temp.getGoodsId());
                    goodsService.update(goods);
                } else {
                    goodsService.add(goods);
                }
                response.sendRedirect("goods");
                break;
            /**
             * 修改商品时获取的值传入页面中
             * 通过id获取一个商品
             */
            case 2:
                goodsId = request.getParameter("goodsId");
                Goods good = new Goods();
                good.setGoodsId(Integer.valueOf(goodsId));
                goods = goodsService.getOne(good);
                session.setAttribute("goods", goods);
                response.sendRedirect("backstage/modify_product.jsp");
                break;
            /**
             * 修改商品销量
             */
            case 3:
                salesNumber = request.getParameter("salesNumber");
                goodsId = request.getParameter("goodsId");
                goods.setGoodsId(Integer.valueOf(goodsId));
                goods.setSalesNumber(Integer.valueOf(salesNumber));
                goodsDaoImpl.updateSalas(goods);
                break;
            /**
             * 删除商品
             */
            case 4:
                goodsId = request.getParameter("goodsId");
                goodsService.delete(Integer.valueOf(goodsId));
                response.sendRedirect("goods");
                break;
            /**
             * 通过商品名获取获取商品
             */
            case 5:
                select = request.getParameter("select");
                typeid = Integer.valueOf(select);
                if (typeid != 0) {
                    goods.setTypeId(typeid);
                }
                goodsName = request.getParameter("goodsName");
                goods.setGoodsName(goodsName);

                List<Goods> list3 = goodsService.getAll(goods);
                if (list3 != null) {
                    list = fengye(list3, pagenum, session);
                }
                session.setAttribute("list", list);
                session.setAttribute("Lastlist", list3);

                response.sendRedirect("backstage/product_list.jsp");
                break;
            /**
             * 点击销量时，销量排名
             */
            case 6:
                list = goodsService.getAll(goods);
                session.setAttribute("list", list);
                response.sendRedirect("backstage/product_list.jsp");
                break;
            /**
             * 商品分类
             */
            case 7:
                typeId = request.getParameter("typeId");
                goods.setTypeId(Integer.valueOf(typeId));
                list = goodsService.getAll(goods);
                session.setAttribute("list", list);
                response.sendRedirect("backstage/product_list.jsp");
                break;
            /**
             * 批量删除商品
             */
            case 8:
                String str = request.getParameter("str");
                String[] arr = str.split(",");
                for (int i = 0; i < arr.length; i++) {
                    goodsService.delete(Integer.valueOf(arr[i]));
                }
                response.sendRedirect("goods");
                break;
            /**
             * 前端
             */
            /**
             * 查询类型
             */
            case 9:
                typeList = typeService.getAll();
                List<List> arrlist = new ArrayList();
                for (int i = 1; i < 8; i++) {
                    goods.setTypeId(i);
                    List list1 = new ArrayList();
                    list1 = goodsService.getAll(goods);
                    arrlist.add(list1);
                }

                for (int i = 1; i < 8; i++) {
                    goods.setTypeId(i);
                    List list1 = new ArrayList();
                    list1 = goodsDaoImpl.getXinAll(goods);
                    daolist.add(list1);
                }

                session.setAttribute("typeList", typeList);
                session.setAttribute("arrlist", arrlist);
                session.setAttribute("daolist", daolist);
                response.sendRedirect("reception/index.jsp");
                break;
            /**
             * 按类型或商品名查询并排序
             */
            case 10:

                typeList = typeService.getAll();
                pagenum = request.getParameter("pagenum");

                String t = request.getParameter("t");

                if ("t".equals(t) && lastGoodsName != null) {
                    session.removeAttribute("lastGoodsName");
                }

                typeId = request.getParameter("typeId");
                if (typeId != null) {
                    goods.setTypeId(Integer.valueOf(typeId));

                }

                goodsName = request.getParameter("goodsName");

                lastGoodsName = (String) session.getAttribute("lastGoodsName");
                if (goodsName != null) {
                    if (!goodsName.equals(lastGoodsName)) {
                        session.setAttribute("lastGoodsName", goodsName);
                        goods.setGoodsName(goodsName);
                    }
                }

                price = request.getParameter("price");
                salesNumber = request.getParameter("salas");
                if (price != null) {
                    goods.setPrice(Double.valueOf(price));
                }
                if (salesNumber != null) {
                    goods.setSalesNumber(Integer.valueOf(salesNumber));
                }

                if (lastGoodsName != null & (price != null || salesNumber != null)) {
                    goods.setGoodsName(lastGoodsName);
                }

                list2 = goodsDaoImpl.getDescAll(goods);
                if (list2 != null) {
                    session.setAttribute("Lastlist", list2);
                }
                Lastlist = (List) session.getAttribute("Lastlist");
                if (Lastlist != null) {
                    list = fengye(Lastlist, pagenum, session);
                } else {
                    list = fengye(list2, pagenum, session);
                }

                if (typeId != null) {
                    g.setTypeId(Integer.valueOf(typeId));
                    tuilist = goodsDaoImpl.getXinAll(g);
                }

                session.setAttribute("list1", tuilist);

                session.setAttribute("typeList", typeList);
                session.setAttribute("list", list);
                response.sendRedirect("reception/list.jsp");
                break;
            /**
             * 按商品ID查询某个商品详情
             */
            case 11:
                typeList = typeService.getAll();
                typeId = request.getParameter("typeId");
                goodsId = request.getParameter("goodsId");
                goods.setGoodsId(Integer.valueOf(goodsId));
                good = goodsService.getOne(goods);

                g.setTypeId(Integer.valueOf(typeId));
                tuilist = goodsDaoImpl.getXinAll(g);

                session.setAttribute("list1", tuilist);
                session.setAttribute("typeList", typeList);
                session.setAttribute("goods", good);
                response.sendRedirect("reception/detail.jsp");
                break;
            case 20:
                goodsName = request.getParameter("goodsName");
                goods.setGoodsName(goodsName);
                good = goodsService.getOne(goods);
                int goodsid = 0;
                if (good != null) {
                    goodsid = good.getGoodsId();
                }
                PrintWriter out = response.getWriter();
                String msg = goodsid + "";
                out.println(msg);
                out.close();
                break;
            case 12://后台起始页数据查询
                list = goodsService.getAll();
                int number1 = list.size();//商品总数
                int number2 = 0;//商品总数量
                int number3 = 0;//总销量
                for (Goods goods1 : list) {
                    number2 += goods1.getStock();
                    number3 += goods1.getSalesNumber();
                }
                response.getWriter().write("{\"num1\":" + number1 + ",\"num2\":" + number2 + ",\"num3\":" + number3 + "}");
                break;
            default:
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    private List<Goods> fengye(List<Goods> list, String pagenum, HttpSession session) {
        List<Goods> listGoods = new ArrayList<>();

        int end = 0;//开始行数
        int start = 0;//结束行数

        int page = 0;//当前页
        int pageTotal = 0;//总页数

        if (pagenum != null) {
            page = Integer.valueOf(pagenum);//得到第几页
        } else {
            page = 1;
        }

        if (page < 1) {
            page = 1;
        }

        double pageSize = 12.0;//每页显示条数
        int pageSum = list.size();//总条数

        pageTotal = (int) Math.ceil(pageSum / pageSize);

        if (page > pageTotal) {
            page = pageTotal;
        }

        start = (page - 1) * 12;
        end = page * 12;

        if (end > pageSum) {//限定结束数组下标
            end = pageSum;
        }

        listGoods = list.subList(start, end);

        session.setAttribute("page", page);
        session.setAttribute("pageTotal", pageTotal);
        session.setAttribute("pageSum", pageSum);
        return listGoods;
    }

}
