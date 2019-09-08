<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<ul>
	<c:if test="${member != null}">
		<li><a href="/">一般画面</a></li>
		<li><a href="/member/signout">ログアウト</a></li>
	</c:if>
</ul>