<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>MAFI Admin</title>
<!--제이쿼리  -->
<!-- 부트스트랩 이전에 제이쿼리를 넣어줘야합니다. 부트스트랩은 제이쿼리 기반으로 작동되기 때문입니다. -->
<script src="/resources/jquery/jquery-3.4.1.min.js"></script>
<!--부트스트랩  -->
<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="/resources/bootstrap/bootstrap-theme.min.css">
<script src="/resources/bootstrap/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<!--스타일css  -->
<%@ include file="../include/style.jsp"%>
<style>
/*섬네일 크기수정  */
#content ul li img { width:200px; height:200px;}
#content ul li  { display:inline-block; margin:10px; }
#content ul li div.goodsName { padding:10px 0; text-align:center;}
/* #content ul li div.goodsName a { color:#000;} */
</style>
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
				<section id="content">
					<ul>
						 <c:forEach items="${list}" var="list">
							 <li>
							  <div class="goodsThumb">
							   <img src="${list.gdsThumbImg}">
							  </div> 
							  <div class="goodsName">
							   <a href="/shop/view?n=${list.gdsNum}">${list.gdsName}</a>
							  </div>
							 </li>
						 </c:forEach>
					</ul>
				</section>
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
