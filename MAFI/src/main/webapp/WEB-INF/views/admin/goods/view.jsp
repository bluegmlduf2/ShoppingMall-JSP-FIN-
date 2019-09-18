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
<style>
.gdsDes img { max-width:600px; height:auto; }
</style>
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
				<form role="form" method="post" autocomplete="off">
					
					<input type="hidden" name="n" value="${goods.gdsNum}">
					
					<div class="inputArea"> 
						<label>1次分類</label> 
						<span class="category1"></span> 
						<label>２次分類</label> 
						<span class="category2">${goods.cateCode}</span>
					</div>
					
					<div class="inputArea">
					 <label for="gdsName">商品名</label>
					 <span>${goods.gdsName}</span>
					</div>
					
					<div class="inputArea">
					 <label for="gdsPrice">金額</label>
					 <span><fmt:formatNumber value="${goods.gdsPrice}" pattern="###,###,###"/></span>
					</div>
					
					<div class="inputArea">
					 <label for="gdsStock">数量</label>
					 <span>${goods.gdsStock}</span>
					</div>
					
					<div class="inputArea">
					 <label for="gdsDes">詳細情報</label>
					 <div class="gdsDes">${goods.gdsDes}</div>
					</div>
					
					<div class="inputArea">
					 <label for="gdsImg">이미지</label>
					 <p>イメージ</p>
					 <img src="${goods.gdsImg}" class="oriImg"/>
					 
					 <p>サムネイル</p>
					 <img src="${goods.gdsThumbImg}" class="thumbImg"/>
					</div>


					<div class="inputArea">
					<button type="button" id="modify_Btn" class="btn btn-warning">修正</button>
 					<button type="button" id="delete_Btn" class="btn btn-danger">削除</button>
					</div>
				
					 <script>
					  var formObj = $("form[role='form']");
					  
					  //수정
					  $("#modify_Btn").click(function(){
					   formObj.attr("action", "/admin/goods/modify");
					   formObj.attr("method", "get")
					   formObj.submit();
					  });
					  
				 	 //삭제 
				 	 $("#delete_Btn").click(function(){
	 					var con=confirm("削除しますか？");
				 	
				 	 	if(con){
				 	 	  formObj.attr("action", "/admin/goods/delete");
				 	 	  formObj.submit();				 	 		
				 	 	}
				 	 }); 

					 </script>
				</form>
			</div>
		</section>

		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp"%>
			</div>
		</footer>
	</div>

	<!--1차분류 자바스크립트  -->
	<script>
		// 컨트롤러에서 JSON데이터 받기
		var jsonData = JSON.parse('${category}');

		var cate1Arr = new Array();
		var cate1Obj = new Object();

		// 1차 분류에 넣을 데이터 뽑아냄
		for (var i = 0; i < jsonData.length; i++) {

			if (jsonData[i].level == "1") {
				cate1Obj = new Object(); //초기화
				cate1Obj.cateCode = jsonData[i].cateCode;
				cate1Obj.cateName = jsonData[i].cateName;
				cate1Arr.push(cate1Obj);
			}
		}

		// 1차 분류 뽑아낸 데이터 삽입
		var cate1Select = $("select.category1")

		for (var i = 0; i < cate1Arr.length; i++) {
			cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
					+ cate1Arr[i].cateName + "</option>");
		}
	/* 2차 분류 호출부분 */
	//해당문서에서 category1번 셀렉션이 변경될떄마다 펑션 발생
		$(document).on("change","select.category1",function(){
							var cate2Arr = new Array();
							var cate2Obj = new Object();

							// 2차 분류에 넣을 데이터 뽑아냄
							for (var i = 0; i < jsonData.length; i++) {

								if (jsonData[i].level == "2") {
									cate2Obj = new Object(); //초기화
									cate2Obj.cateCode = jsonData[i].cateCode;
									cate2Obj.cateName = jsonData[i].cateName;
									cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;

									cate2Arr.push(cate2Obj);
								}
							}

							var cate2Select = $("select.category2");
									
							//기존에 2차분류에 있던 애들(태그)을 지움
							 cate2Select.children().remove();
							//this는 선택된 자기자신을 표현한다. onchange이벤트로 발생하 category1를 나타냄
							//this는 펑션을 발생시킨 객체를 의미한다. 아래는 옵션을 선택한 객체를 this로 사용한다는것
							 $("option:selected", this).each(function(){
									
								 //category1태그에서 선택된 값을 val()함수로 불러온다
								  var selectVal = $(this).val();  
								 //1차분류 선택시 해당 값을 selectVal에 넣는다 그리고 2차분류에서 아무것도 선택하지않으면 그 값을 사용한다
								 //즉 2차분류를 선택안해도 카테고리 값이 넘어간다는것이다 
								 cate2Select.append("<option value='"+selectVal+"'>全体</option>");
								 
								  	//첫번째 값 삽입 후 
								  for(var i = 0; i < cate2Arr.length; i++) {
									   if(selectVal == cate2Arr[i].cateCodeRef) {
									    cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
									         + cate2Arr[i].cateName + "</option>");
									   }
								  }
							});
		});
	</script>
</body>
</html>
