<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>会员等级</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style/adminStyle.css" rel="stylesheet" type="text/css" />
 <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
 <script src="js/public.js"></script>
</head>
<body>
 <div class="wrap">
  <div class="page-title">
    <span class="modular fl"><i class="user"></i><em>会员等级</em></span>
    <span class="modular fr"><a href="add_user_rank.jsp" class="pt-link-btn">+添加会员等级</a></span>
  </div>
  <table class="list-style Interlaced">
   <tr>
    <th>会员类型</th>
    <th>等级名称</th>
    <th>等级折扣</th>
    <th>操作</th>
   </tr>

   <tr>
    <td>
     <img src="images/user_02.png"/>
     <span class="middle">普通用户组</span>
    </td>
    <td class="center">普通会员</td>
    <td class="center">90%</td>
    <td class="center">
     <a class="block">
      <img src="images/icon_drop.gif"/>
     </a>
    </td>
   </tr>
   <tr>

   </tr>
   <tr>
    <td>
     <img src="images/user_01.png"/>
     <span class="middle">普通用户组</span>
    </td>
    <td class="center">黄金会员</td>
    <td class="center">85%</td>
    <td class="center">
     <a class="block">
      <img src="images/icon_drop.gif"/>
     </a>
    </td>
   </tr>

   <tr>
    <td>
     <img src="images/user_02.png"/>
     <span class="middle">普通用户组</span>
    </td>
    <td class="center">白金会员</td>
    <td class="center">80%</td>
    <td class="center">
     <a class="block">
      <img src="images/icon_drop.gif"/>
     </a>
    </td>
   </tr>

   <tr>
    <td>
     <img src="images/user_02.png"/>
     <span class="middle">特殊用户组</span>
    </td>
    <td class="center">钻石会员</td>
    <td class="center">50%</td>
    <td class="center">
     <a class="block">
      <img src="images/icon_drop.gif"/>
     </a>
    </td>
   </tr>
  </table>
  <ul>
   <c:forEach items="${list1}" var="user">
    <li>${user.userName}</li>
   </c:forEach>
   <c:forEach items="${list2}" var="user">
    <li>${user.userName}</li>
   </c:forEach>
  </ul>
 </div>
</body>
</html>