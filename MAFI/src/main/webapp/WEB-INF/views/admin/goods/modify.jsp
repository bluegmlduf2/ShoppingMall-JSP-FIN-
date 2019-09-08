<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<h2>商品登録</h2>
				<form role="form" method="post" autocomplete="off">
					<input type="hidden" name="gdsNum" value="${goods.gdsNum}"/>
					
					<div class="inputArea"> 
						<label>1次分類</label> 
						<select class="category1">
							<option value="">全体</option>
						</select> <label>２次分類</label> 
						<select class="category2" name="cateCode">
							<option value="">全体</option>
						</select>
					</div>
					
					<div class="inputArea">
					 <label for="gdsName">商品名</label>
					 <input type="text" id="gdsName" name="gdsName" value="${goods.gdsName}"/>
					</div>
					
					<div class="inputArea">
					 <label for="gdsPrice">金額</label>
					 <input type="text" id="gdsPrice" name="gdsPrice" value="${goods.gdsPrice}"/>
					</div>
					
					<div class="inputArea">
					 <label for="gdsStock">数量</label>
					 <input type="text" id="gdsStock" name="gdsStock" value="${goods.gdsStock}"/>
					</div>
					
					<div class="inputArea">
					 <label for="gdsDes">詳細情報</label>
					 <textarea rows="5" cols="50" id="gdsDes" name="gdsDes" >${goods.gdsDes}</textarea>
					</div>
					
					<div class="inputArea">
					 <button type="submit" id="update_Btn" class="btn btn-primary">修正完了</button>
					 <button type="button" id="back_Btn" class="btn btn-primary">戻る</button>
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
													 cate2Select.append("<option value='"+selectVal+"'>전체</option>");
													 
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

					 	 <script>
					 	 		//카테고리에 값을 넣는 과정 
							 	var select_cateCode = '${goods.cateCode}';
							 	var select_cateCodeRef = '${goods.cateCodeRef}';
							 	var select_cateName = '${goods.cateName}';
							 	//상위 카테고리가 아닐시 1,2카테고리 둘다 넣어줌
							 	if(select_cateCodeRef != null && select_cateCodeRef != '') {
							 	 $(".category1").val(select_cateCodeRef);
							 	 $(".category2").val(select_cateCode);
							 	 $(".category2").children().remove();
							 	 $(".category2").append("<option value='"
							 	       + select_cateCode + "'>" + select_cateName + "</option>");
							 	} else {
							 	//상위카테고리일시 2카테고리는 값이 없기때문에 1카테고리만 넣어줌
							 	 $(".category1").val(select_cateCode);
							 	 //$(".category2").val(select_cateCode);
							 	 // select_cateCod가 부여되지 않는 현상이 있어서 아래 코드로 대체
							 	 $(".category2").append("<option value='" + select_cateCode + "' selected='selected'>全体</option>");
							 	}	

							 	
						 	 //취소 
						 	 $("#back_Btn").click(function(){
						 		//상세정보페이지로 상품번호와 다시 던져버려서 그전 화면으로 만듬
						 		//history.back();
						 		location.href="/admin/goods/view?n="+${goods.gdsNum};					 		
						 	}); 					 	 
						 </script>
					</div>
				</form>
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
