<%@page import="com.MAFI.domain.GoodsViewVO"%>
<%@page import="java.util.List"%>
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
 div.goods div.goodsImg { float:left; width:350px; }
 div.goods div.goodsImg img { width:350px; height:auto; }
 
 div.goods div.goodsInfo { float:right; width:330px; font-size:22px; }
 div.goods div.goodsInfo p { margin:0 0 20px 0; }
 div.goods div.goodsInfo p span { display:inline-block; width:100px; margin-right:15px; }
 
 div.goods div.goodsInfo p.cartStock input { font-size:22px; width:75px; text-align:center; padding:5px; margin:0; border:1px solid #eee; }
 div.goods div.goodsInfo p.cartStock button { font-size:26px; border:none; background:none; }
 div.goods div.goodsInfo p.addToCart { text-align:right; }
 div.goods div.gdsDes { font-size:18px; clear:both; padding-top:30px; }
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
					
					<form role="form" method="post">
						<input type="hidden" "gdsNum" value="${view.gdsNum}"/>					
					</form>
					
					<div class="goods">
						<div class="goodsImg">
							<img src="${view.gdsImg}">
						</div>
						<div class="goodsInfo">
							<p class="gdsName"><span>상품명</span>${view.gdsName}</p>
							
							<p class="cateName"><span>카테고리</span>${view.cateName}</p>
						
							<p class="gdsPrice"><span>가격 </span><fmt:formatNumber pattern="###,###,###" value="${view.gdsPrice}"/>원</p>
							
							<p class="gdsStock"><span>재고 </span><fmt:formatNumber pattern="###,###,###" value="${view.gdsStock}"/>EA</p>

							
							<p class="cartStock">
								<span>구입수량</span>
								<button type="button" class="plus">+</button>
								<input type="number"  class="numBox" id="numBox" min="1" max="${view.gdsStock}" value="1" readonly="readonly"/>
								<button type="button" class="minus">-</button>							
							</p>

							<script type="text/javascript">
									$(".plus").click(function() {
										var num=$(".numBox").val();
										var plusNum=Number(num)+1;
										 
										if(plusNum >= ${view.gdsStock}){
											$(".numBox").val(num);	
											alert("在庫超過");
										}else{
											$(".numBox").val(plusNum);	
										}
									});
									
									$(".minus").click(function(){
										   var num = $(".numBox").val();
										   var minusNum = Number(num) - 1;
										   
										   if(minusNum <= 0) {
										    $(".numBox").val(num);
										   } else {
										    $(".numBox").val(minusNum);          
										   }
									 });
							</script>

							<p class="addToCart">
							   <button type="button">카트에 담기</button>
							</p>
							  <p class="addToCart">
							   <button type="button">카트에 담기</button>
							 </p>
						 </div>
					 <div class="gdsDes">${view.gdsDes}</div>	
					 </div>												
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
