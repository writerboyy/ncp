﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>header</title>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <link href="style/adminStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="header">
 <div class="logo">
  <img src="images/admin_logo.png" title="在哪儿"/>
 </div>
 <div class="fr top-link">
  <a href="admin_list.jsp" target="mainCont" title="DeathGhost"><i class="adminIcon"></i><span>管理员：${admin.userName}</span></a>
  <a href="#" title="修改密码"><i class="clearIcon"></i><span>清除缓存</span></a>
  <a href="revise_password.jsp" target="mainCont" title="修改密码"><i class="revisepwdIcon"></i><span>修改密码</span></a>
  <a href="adminLogin.jsp" target="_parent"  title="安全退出" style="background:rgb(60,60,60);"><i class="quitIcon"></i><span>安全退出</span></a>
 </div>
</div>
</body>
</html>