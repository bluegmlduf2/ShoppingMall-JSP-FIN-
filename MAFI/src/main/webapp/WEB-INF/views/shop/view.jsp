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

 section.replyForm { padding:30px 0; }
 section.replyForm div.input_area { margin:10px 0; }
 section.replyForm textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px;; height:150px; }
 section.replyForm button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
 
 section.replyList { padding:30px 0; }
 section.replyList ol { padding:0; margin:0; }
 section.replyList ol li { padding:10px 0; border-bottom:2px solid #eee; }
 section.replyList div.userInfo { }
 section.replyList div.userInfo .userName { font-size:24px; font-weight:bold; }
 section.replyList div.userInfo .date { color:#999; display:inline-block; margin-left:10px; }
 section.replyList div.replyContent { padding:10px; margin:20px 0; }
 section.replyList div.replyFooter button { font-size:14px; border: 1px solid #999; background:none; margin-right:10px; }

/* 모달설정 */
 div.replyModal { position:relative; z-index:1; display:none;}
 div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
 div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:550px; height:300px; padding:20px 10px; background:#fff; border:2px solid #666; }
 div.modalContent textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:530px; height:200px; }
 div.modalContent button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
 div.modalContent button.modal_cancel { margin-left:20px; }
</style>
 		<script>
 		/* 상품소감목록 출력AJAX */
 		function replyList(){
 			var gdsNum=${view.gdsNum};
 			//model에 넣어서 받는게 아니라 list의 json형식으로 주고받음
 			$.getJSON("/shop/view/replyList?n="+gdsNum,function(data){
					var str="";

					//여기서 data는 list형이다
					$(data).each(function(){
					
						var repDate = new Date(this.repDate);
						repDate = repDate.toLocaleDateString("ko-US");

						/*동적인 HTML코드  */
						str  +="<li data-gdsNum='"+this.gdsNum+"'>'"
						     + "<div class='userInfo'>"
						     + "<span class='userName'>" + this.userName + "</span>"
						     + "<span class='date'>" + repDate + "</span>"
						     + "</div>"
						     + "<div class='replyContent'>" + this.repCon + "</div>"

						     +"<c:if test='${member != null}'>"

						     + "<div class='replyFooter'>"
						     + "<button type='button' class='modify' data-repNum='"+this.repNum+"'>修正</button>"
						     + "<button type='button' class='delete' data-repNum='"+this.repNum+"'>削除</button>"
						     + "</div>"
						     + "</li>"
						     
						     +"</c:if>";   
					});
					
					$("section.replyList ol").html(str);
	 		});
 		}	
 		</script>
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
							<p class="gdsName"><span>商品名</span>${view.gdsName}</p>
							
							<p class="cateName"><span>カテゴリー</span>${view.cateName}</p>
						
							<p class="gdsPrice"><span>価格</span><fmt:formatNumber pattern="###,###,###" value="${view.gdsPrice}"/>ワォン</p>
							
							<p class="gdsStock"><span>在庫</span><fmt:formatNumber pattern="###,###,###" value="${view.gdsStock}"/>EA</p>

							
							<p class="cartStock">
								<span>購入数量</span>
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
							   <button type="button">カートに入れる</button>
							</p>
						 </div>
					 <div class="gdsDes">${view.gdsDes}</div>	
					 </div>
					 <div id="reply">
					 	<c:if test="${member == null}">
					 		<p>コメントを残すためには<a href="/member/signin"><b>ログイン</b></a>してください</p>
					 	</c:if>
					 	
					 	<c:if test="${member != null}">
					 	<section class="replyForm">
					 		<!--FORM태그 안에 따로 URL없이 submit버튼있으면 현재 URL로 전송한다.그리고 name안에 있는 내용에 맞춰서 ReplyVO매개변수에 맞춘다   -->
					 		<form role="form" method="post" autocomplete="off">
					 			<input type="hidden" id="gdsNum" name="gdsNum" value="${view.gdsNum}">
					 			
					 			<div class="input_area">
					 				<textarea name="repCon" id="repCon"></textarea>
					 			</div>
					 			
					 			<div class="input_area">
					 				<button type="submit" id="reply_btn">コメントを残す</button>
					 				<script>
					 						$("#reply_btn").click(function(){
					 						var formObj=$(".replyForm form[role='form']");
					 						var gdsNum=$("#gdsNum").val();
					 						var repCon=$("#repCon").val();
					 						
					 						//JSON형태{키:값,키:값,..}
					 						var data={
					 								gdsNum : gdsNum,
					 								repCon : repCon	
					 						};

					 						$.ajax({
					 							url:"/shop/view/registReply",
					 							type: "post",
					 							data:data,
					 							success:function(){
					 								replyList(); //성공시 소감평 재호출
					 								$("#repCon").val("");
					 							}
					 						});
					 						return false; //<- 이 문장으로 새로고침(reload)이 방지됨 ajax reload방지
					 					});
					 				</script>
					 			</div>
					 		</form>
					 	</section>
					 	</c:if>
					 	<section class="replyList">
					 		<ol>
					 		<%-- ajax적용하지않고 jstl로 표현한것, 데이터 절감을 위하여 ajax를 사용해야함 	
					 		<c:forEach items="${reply}" var="reply">
					 				<li>
					 					<div class="userInfo">
					 					<span class="userName">${reply.userName}</span>
					 					<span class="date"><fmt:formatDate value="${reply.repDate}" pattern="yyyy-MM-dd"/></span>
					 					</div>
					 					<div class="replyContent">${reply.repCon }</div>
					 				</li>
					 			</c:forEach> 
					 		--%>
					 		</ol>
					 		 <script>
					 		 	replyList();
					 		 </script>
					 		 <script>
						 		 $(document).on("click",".modify",function(){
						 			//$(".replyModal").attr("style","display:block;"); 
						 			$(".replyModal").fadeIn(200);
						 			
						 			var repNum=$(this).attr("data-repNum");
						 			var repCon=$(this).parent().parent().children(".replyContent").text();
						 			
						 			$(".modal_repCon").val(repCon);
						 			$(".modal_modify_btn").attr("data-repNum",repNum);
						 		 });
						 		 
						 		 $(".modal_cancel").click(function(){
									$(".replyModal").fadeOut(200);						 			 
						 		 });
					 		 </script>
					 		 <script>
					 		 //일반삭제버튼
					 		/*replyList()에서 만들어진 동적인 HTML코드에 이벤트를 적용시 $(document).on()을 사용한다  */
							/*$(documnet).ready()는 동적인 HTML코드에 적용 불가능하다. */
					 		$(document).on("click",".delete",function(){
					 		    var con=confirm("削除しますか？");
					 			if(con){
						 			var data={repNum : $(this).attr("data-repNum")};	
						 			
						 			$.ajax({
						 				url : "/shop/view/deleteReply",
						 				type : "post",
						 				data : data,
						 				success : function(result){
						 					//controller에서 반환하는 값을 메서드의 매개변수 result로 넣어준다
						 					if(result==1){
						 						replyList();					 						
						 					}else{
												alert("作成者が削除できます");					 						
						 					}
						 				},
						 				error :function(){
						 					alert("ログインしてください");
						 				}
						 			});
					 			}
					 		});
							</script>
							 <script>
							 $(document).ready(function(){
								 //모달창의 수정버튼
								 $(".modal_modify_btn").click(function(){
									 var con=confirm("修正しますか？");
									 
									 if(con){
										var data={
												repNum:$(this).attr("data-repNum"),
												repCon:$(".modal_repCon").val()
										}
										
										$.ajax({
											url :"/shop/view/modifyReply",
											type : "post",
											data : data,
											success : function(result){
												if(result==1){
													replyList();
													$(".replyModal").fadeOut(200);
												}else{
													alert("作成者が削除できます");	
												}
												
											},
											error : function(){
												alert("ログインしてください");
											}
										});
									 }
								 });
								 //모달창의 취소버튼
								 $(".modal_cancel").click(function(){
									 $(".replyModal").fadeOut(200);
								 });
							 });							
							 </script>
					 	</section>
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
	<!--모달창  -->
	<div class="replyModal">
		<div class="modalContent">
			<div>
				<textarea class="modal_repCon" name="modal_repCon"></textarea>
			</div>
			
			<div>
				<button type="button" class="modal_modify_btn">修正</button>			
				<button type="button" class="modal_cancel">取り消し</button>			
			</div>
		</div>
		<div class="modalBackground"></div>
	</div>
</body>
</html>
