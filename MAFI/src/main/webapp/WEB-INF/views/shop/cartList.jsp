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
 section#content ul li { margin:10px 0; }
 section#content ul li img { width:250px; height:250px; }
 section#content ul li::after { content:""; display:block; clear:both; }
 section#content div.thumb { float:left; width:250px; }
 /* section#content div.gdsInfo { float:right; width:calc(100% - 270px); } 
 section#content div.gdsInfo { font-size:20px; line-height:2; }*/
 section#content div.gdsInfo span { display:inline-block; width:100px; font-weight:bold; margin-right:10px; }
 section#content div.gdsInfo .delete { text-align:right; }
 section#content div.gdsInfo .delete button { font-size:22px; padding:5px 10px; border:1px solid #eee; background:#eee;}

.allCheck { float:left; width:200px; }
.allCheck input { width:16px; height:16px; }
.allCheck label { margin-left:10px; }
.delBtn { float:right; width:300px; text-align:right; }
.delBtn button { font-size:18px; padding:5px 10px; border:1px solid #eee; background:#eee;}

.checkBox { float:left; width:30px; }
.checkBox input { width:16px; height:16px; }

.listResult { padding:20px; background:#eee; }
.listResult .sum { float:left; width:45%; font-size:22px; }

/* .listResult .orderOpen { float:right; width:45%; text-align:right; } */
.listResult .orderOpen button { font-size:18px; padding:5px 10px; border:1px solid #999; background:#fff;}

.orderInfo { border:5px solid #eee; padding:20px; display:none; }
.orderInfo .inputArea { margin:10px 0; }
.orderInfo .inputArea label { display:inline-block; width:120px; margin-right:10px; }
.orderInfo .inputArea input { font-size:14px; padding:5px; }
#userAddr2, #userAddr3 { width:250px; }

.orderInfo .inputArea:last-child { margin-top:30px; }
.orderInfo .inputArea button { font-size:20px; border:2px solid #ccc; padding:5px 10px; background:#fff; margin-right:20px;}
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
						<li>
						<div class="allCheck">
							<input type="checkbox" name="allcheck" id="allcheck"><label for="allCheck">全部選択</label>
						</div>
						<script>
						 $("#allcheck").click(function(){
							 /*
							 여기서 attr과 prop의 차이가 나오는데 
							 input태그 안에 checked="checked"라는 HTML 속성이 있으면 attr을 사용하면 checked라는 값을 가져올수있다
							 그러나 prop을 사용하면 화면에서 사용자가 동적으로 체크박스를 클릭할때 사용되는 속성 true,false를 가져올수있다
							 즉 prop은 사용자가 화면에서 동적 발생(체크 박스에 클릭이나 이런걸로..)시키는 true/false값을 참조할수있게한다
							 */
							 var chk=$("#allcheck").prop("checked");
							 if(chk){
								 $(".chBox").prop("checked",true);
							 }else{
								 $(".chBox").prop("checked",false);								 
							 }
						 });						
						</script>
						<div class="delBtn">
							<button type="button" class="selectDelete_btn">選択削除</button>
						</div>
						<script>
							$(".selectDelete_btn").click(function(){
								var confirm_val=confirm("削除しますか");
								
								if(confirm_val){
									var checkArr=new Array();
									
									$("input[class='chBox']:checked").each(function(){
										checkArr.push($(this).attr("data-cartNum"));
									});
									
									$.ajax({
										url:"/shop/deleteCart",
										type:"post",
										data:{chbox:checkArr},
										success:function(result){
											if(result==1){
												//성공 시 get형태로 해당페이지를 다시 불러온다
												//location없이도  ajax가 작동하며 해당페이지에 다시 뿌려줌
												location.href="/shop/cartList";
											}else{
												alert("削除できません。");
											}
										}
									});
								}
							});
						</script>
						</li>
						 <c:forEach items="${cartList}" var="cartList">
						 	 <hr>
							 <li>
							  <div class="checkBox">
							  	<input type="checkbox" name="chBox" class="chBox" data-cartNum="${cartList.cartNum}"/>
							  	<script>
							  		$(".chBox").click(function(){
							  			 $("#allcheck").prop("checked",false);
							  		});
							  	</script>
							  </div>
							  <div class="thumb">
							   <img src="${cartList.gdsThumbImg}">
							  </div> 
							  <div class="gdsInfo">
							  	<p>
								<span>カート番号:</span>${cartList.cartNum}</br>							  
								<span>商品名:</span>${cartList.gdsName}</br>							  
								<span>単価:</span><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice}"/>ウォン</br>							  
								<span>購入数量:</span>${cartList.cartStock}</br>							  
								<span>最終価格:</span><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice*cartList.cartStock}"/>ウォン</br>							  	  	
							  	</p>
							  	<div class="delete">
							  		<!--개별선택이 되어야하기때문에 EL을 사용해서 클래스명을 1개씩 만들어지도록 한다  -->
							  		<button type="button" class="delete${cartList.cartNum}btn" data-cartNum="${cartList.cartNum}">削除</button>
							  	</div>
							  	<script>
							  	$(".delete${cartList.cartNum}btn").click(function(){
							  		var con=confirm("削除しますか？");
							  		if(con){
							  			 var chkArr=new Array();
							  			 
							  			chkArr.push($(this).attr("data-cartNum"));
							  			
							  			$.ajax({
							  				url:"/shop/deleteCart",
							  				type:"post",
							  				data:{chbox:chkArr},
							  				success:function(result){
							  					if(result==1){
							  						location.href="/shop/cartList";
							  					}else{
							  						alert("削除できません");
							  					}
							  				}
							  			});
							  		}
							  	});
							  	</script>
							  </div>
							 </li>
							 <c:set var="sum" value="${sum+(cartList.gdsPrice*cartList.cartStock)}"/>
						 </c:forEach>
					</ul>
					<div class="listResult">
						<div class="sum">
							総合計：<fmt:formatNumber pattern="###,###,###" value="${sum}"/> ウォン 
						</div>
						<div class="orderOpen">
							<button type="button" class="orderOpen_btn">注文情報入力</button>
							<script>
								$(".orderOpen_btn").click(function(){
									$(".orderInfo").slideDown();//주문입력부분이 나타남
									$(".orderOpen_btn").slideUp();//버튼이 사라짐
								});
							</script>
						</div>
					</div>
					
					<div class="orderInfo">
						<form role="form" method="post" autocomplete="off">
							
							<input type="hidden" name="amount" value="${sum}">
							
							<div class="inputArea">
								<label for="">受領人</label>
								<input type="text" name="orderRec" id="orderRec" required="required">
							</div>
							
							<div class="inputArea">
								<label for="orderPhon">受領人の連絡先</label>
								<input type="text" name="orderPhon" id="orderPhon" required="required">
							</div>
							
							<div class="inputArea">
								<label for="userAddr1">郵便番号１</label>
								<input type="text" name="userAddr1" id="userAddr1" required="required">
							</div>
							
							<div class="inputArea">
								<label for="userAddr2">一次住所</label>
								<input type="text" name="userAddr2" id="userAddr2" required="required">
							</div>
							
							<div class="inputArea">
								<label for="">二次住所</label>
								<input type="text" name="userAddr3" id="userAddr3" required="required">
							</div>
							
							<div class="inputArea">
								<button type="submit" class="order_btn">注文</button>
								<button type="button" class="cancel_btn">取り消し</button>
							</div>
							
						</form>
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
