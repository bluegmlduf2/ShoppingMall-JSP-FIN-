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

<style>
/*섬네일 크기수정  */
#container_box table img { width:150px; height:auto;}
/*
#container_box table { width:900px; }
#container_box table th { font-size:20px; font-weight:bold;
       text-align:center; padding:10px; border-bottom:2px solid #666; }
#container_box table tr:hover { background:#eee; }
#container_box table td { padding:10px; text-align:center; }
#container_box table img { width:150px; height:auto; }
*/
 .orderInfo { border:5px solid #eee; padding:10px 20px; margin:20px 0;}
 .orderInfo span { font-size:20px; font-weight:bold; display:inline-block; width:90px; }
 
 .orderView li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
 .orderView li::after { content:""; display:block; clear:both; }
 
 .thumb { float:left; width:200px; }
 .thumb img { width:200px; height:200px; }
 .gdsInfo { float:right; width:calc(100% - 220px); line-height:2; }
 .gdsInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }

.deliveryChange { text-align:right; }
.delivery1_btn,
.delivery2_btn { font-size:16px; background:#fff; border:1px solid #999; margin-left:10px; }

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
			<div class="orderInfo">
					<c:forEach items="${orderView}" var="orderView" varStatus="status">
						<c:if test="${status.first}">
							<p><span>注文人</span>${orderView.userId}</p>
							<p><span>受領人</span>${orderView.orderRec}</p>
							<p><span>住所</span>(${orderView.userAddr1})-${orderView.userAddr2} ${orderView.userAddr3}</p>
							<p><span>価格</span><fmt:formatNumber pattern="###,###,###" value="${orderView.amount}"/>ウォン</p>
						
							<div class="deliveryChange">
								<form role="form" method="post" class="deliveryForm">
									<input type="hidden" name="orderId" value="${orderView.orderId}"/>
									<input type="hidden" name="delivery" class="delivery" value=""/>

									<button type="button" class="delivery1_btn">配達中</button>
									<button type="button" class="delivery2_btn">配達完了</button>
							
									<script>
										$(".delivery1_btn").click(function(){
											$(".delivery").val("配達中");
											run();
										});
										$(".delivery2_btn").click(function(){
											$(".delivery").val("配達完了");
											run();
										});
										
										function run(){
											$(".deliveryForm").submit();
										}
									</script>
								</form>
							</div>							
						</c:if>
					</c:forEach>
					</div>
					
					<ul class="orderView">
 						<c:forEach items="${orderView}" var="orderView"> 
							<li>
								<div class="thumb">
									<img src="${orderView.gdsThumbImg}"/>
								</div>
								<div class="gdsInfo">
									<p>
										<span>商品名</span>${orderView.gdsName}</br>
										<span>単価</span><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice}"/>ウォン</br>
										<span>購入数量</span>${orderView.cartStock}個</br>
										<span>最終価格</span><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice*orderView.cartStock}"/>ウォン</br>
									</p>
								</div>
							</li>
						</c:forEach>
					</ul>
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
