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
<style>
/*
#container_box table { width:900px; }
#container_box table th { font-size:20px; font-weight:bold;
       text-align:center; padding:10px; border-bottom:2px solid #666; }
#container_box table tr:hover { background:#eee; }
#container_box table td { padding:10px; text-align:center; }
#container_box table img { width:150px; height:auto; }
*/

#container_box ul li { margin-bottom:20px; border:10px solid #eee; }
.replyInfo { background:#eee; padding:10px; font-size:18px; }
.replyInfo span { font-size:20px; font-weight:bold; margin-right:20px; }
.replyContent { padding:10px; }

.replyControll {text-align:right; padding:10px; }
.replyControll button { border:2px solid #999; background:#fff; }
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
					<ul class="orderList">
						 <c:forEach items="${reply}" var="reply">
							<li>
								<div class="replyInfo">
									<p>
									<span>コメント番号</span>${reply.repNum}
									</p>
									<p>
									<span>作成者</span>${reply.userName} (${reply.userId})
									</p>
									<p>
									<span>作成された商品</span><a href="/shop/view?n=${reply.gdsNum}">クリック</a>
									</p>
								</div>
								<div class="replyContent">
									コメント内容：	${reply.repCon}
								</div>
								<div class="replyControll">
									 	<input type="hidden" id="repNum" name="repNum" value="${reply.repNum}"/>
										<button type="submit" class="delete_${reply.repNum}_btn">削除</button>									
									<script>
										$(".delete_${reply.repNum}_btn").click(function(){
											var confirm_val=confirm("削除しますか");
											
											if(confirm_val){
												var repNum=$("input[id='repNum']").val();
												
												$.ajax({
													url:"/admin/shop/allReply",
													type:"post",
													data:{repNum:repNum},
													success:function(result){
														if(result==1){
															//성공 시 get형태로 해당페이지를 다시 불러온다
															//성공시 새로고침
															location.href="/admin/shop/allReply";
														}else{
															alert("削除できません。");
														}
													}
												});
											}
										});
									</script>
								</div>
								<hr>
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
