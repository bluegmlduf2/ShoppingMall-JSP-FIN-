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
							<!-- 
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
							-->
							<div class="inputArea">
								<p>
								<input type="text" id="sample2_postcode" name="userAddr1" placeholder="郵便番号">
								<input type="button" onclick="sample2_execDaumPostcode()" value="郵便番号探し"><br>
								</p>
								<p>
								<input type="text" id="sample2_address" name="userAddr2" placeholder="住所"><br>
								<input type="text" id="sample2_detailAddress" name="userAddr3" placeholder="詳細住所">
								<input type="text" id="sample2_extraAddress" placeholder="参考項目">
								</p>
								
								<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
								<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
								<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
								</div>
								
								<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
								<script>
								    // 우편번호 찾기 화면을 넣을 element
								    var element_layer = document.getElementById('layer');
								
								    function closeDaumPostcode() {
								        // iframe을 넣은 element를 안보이게 한다.
								        element_layer.style.display = 'none';
								    }
								
								    function sample2_execDaumPostcode() {
								        new daum.Postcode({
								            oncomplete: function(data) {
								                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
								
								                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
								                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
								                var addr = ''; // 주소 변수
								                var extraAddr = ''; // 참고항목 변수
								
								                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
								                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								                    addr = data.roadAddress;
								                } else { // 사용자가 지번 주소를 선택했을 경우(J)
								                    addr = data.jibunAddress;
								                }
								
								                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
								                if(data.userSelectedType === 'R'){
								                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
								                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
								                        extraAddr += data.bname;
								                    }
								                    // 건물명이 있고, 공동주택일 경우 추가한다.
								                    if(data.buildingName !== '' && data.apartment === 'Y'){
								                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
								                    }
								                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								                    if(extraAddr !== ''){
								                        extraAddr = ' (' + extraAddr + ')';
								                    }
								                    // 조합된 참고항목을 해당 필드에 넣는다.
								                    document.getElementById("sample2_extraAddress").value = extraAddr;
								                
								                } else {
								                    document.getElementById("sample2_extraAddress").value = '';
								                }
								
								                // 우편번호와 주소 정보를 해당 필드에 넣는다.
								                document.getElementById('sample2_postcode').value = data.zonecode;
								                document.getElementById("sample2_address").value = addr;
								                // 커서를 상세주소 필드로 이동한다.
								                document.getElementById("sample2_detailAddress").focus();
								
								                // iframe을 넣은 element를 안보이게 한다.
								                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
								                element_layer.style.display = 'none';
								            },
								            width : '100%',
								            height : '100%',
								            maxSuggestItems : 5
								        }).embed(element_layer);
								
								        // iframe을 넣은 element를 보이게 한다.
								        element_layer.style.display = 'block';
								
								        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
								        initLayerPosition();
								    }
								
								    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
								    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
								    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
								    function initLayerPosition(){
								        var width = 300; //우편번호서비스가 들어갈 element의 width
								        var height = 400; //우편번호서비스가 들어갈 element의 height
								        var borderWidth = 5; //샘플에서 사용하는 border의 두께
								
								        // 위에서 선언한 값들을 실제 element에 넣는다.
								        element_layer.style.width = width + 'px';
								        element_layer.style.height = height + 'px';
								        element_layer.style.border = borderWidth + 'px solid';
								        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
								        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
								        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
								    }
								</script>							
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
