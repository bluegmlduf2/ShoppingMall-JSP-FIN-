<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>MAFI Admin</title>
<!--제이쿼리  -->
<script src="/resources/jquery/jquery-3.4.1.min.js"></script> 
<!--부트스트랩  -->
<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="/resources/bootstrap/bootstrap-theme.min.css">
<script src="/resources/bootstrap/bootstrap.min.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<!--스타일css  -->
<%@ include file="../include/style.jsp"%>
</head>
<body>
	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp"%>
			</div>
		</header>

		<nav id="nav">
			<div id="nav_box">
				<%@ include file="../include/nav.jsp"%>
			</div>
		</nav>

		<section id="container">
			<aside>
				<%@ include file="../include/aside.jsp"%>
			</aside>
			<div id="container_box">
				<h2>商品リスト</h2>
					<table>
						 <thead>
						  <tr>
						   <th>番号</th>
						   <th>商品名</th>
						   <th>カテゴリー</th>
						   <th>金額</th>
						   <th>数量</th>
						   <th>登録日</th>
						  </tr>
						 </thead>
						 <tbody>
						  <c:forEach items="${list}" var="list">
						  <tr>
						   <td>${list.gdsNum}</td>
						   <td><a href="/admin/goods/view?n=${list.gdsNum}">${list.gdsName}</a></td>
						   <td>${list.cateCode}</td>
						   <td>
						   	<fmt:formatNumber value="${list.gdsPrice}" pattern="###,###,###"/>
						   </td>
						   <td>${list.gdsStock}</td>
						   <td>
						   	<fmt:formatDate value="${list.gdsDate}" pattern="yyyy-MM-dd"/>
						   </td>
						  </tr>   
						  </c:forEach>
						 </tbody>
					</table>
			</div>
		</section>

		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp"%>
			</div>
		</footer>
	</div>
</body>
</html>
