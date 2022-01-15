<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서관리 리스트</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="../css/main.css" />
<style type="text/css">
.rowValue:hover {
	background-color: #dddd;	
}
</style>
<script type="text/javascript">
$(function() {
	/* $(".rowValue").click(function() {
		alert("hello");
	}); */
});
</script>
</head>
<body>
<%@ include file="../include/topMenu.jsp" %>
<table>
<caption>부서관리</caption>
<tr>
	<th> </th>
	<th>부서번호</th>
	<th>부서이름</th>
	<th>부서위치</th>
</tr>
<c:forEach items="${resultList}" var="vo" varStatus="status">
<tr class="rowValue">	
	<td>${status.count}</td>
	<td><a href="deptDetail.do?deptno=${vo.deptno}" >${vo.deptno}</a></td>
	<td>${vo.dname}</td>
	<td>${vo.loc}</td>
</tr>
</c:forEach>
<tr>
<td colspan="4">
<a href="deptWrite.do">글등록</a>
</td>
</tr>
</table>
</body>
</html>