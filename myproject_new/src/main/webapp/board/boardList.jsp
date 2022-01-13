<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<style>
body {
    font-size: 9pt;
}
button {
    font-size: 9pt;
}
table {
    width: 600px;
    border-collapse: collapse;
}
th,td {
    border: 1px solid #cccccc;
    padding: 3px;
}
.div1 {
	width: 600px;
	text-align: center;
	font-size: 15pt;
}
.div2 {
	width: 600px;
	text-align: left;
	font-size: 9pt;
}
.div3 {
	width: 600px;
	text-align: right;
	font-size: 9pt;
}
a {
	text-decoration: none;
}
</style>
<script type="text/javascript">

</script>
</head>
<body>
<!-- 번호, 제목, 글쓴이, 등록일, 조회수 -->
<div class="div1">일반 게시판 목록</div>
<div class="div2">total: ${totalRow}</div>

<form name="searchFrm" method="post" action="boardList.do">
<div class="div2">
<!-- 검색기능 -->
	<select name="searchGubun" id="searchGubun">
		<option value="title">제목</option> 
		<option value="name">글쓴이</option> 
		<option value="content">내용</option> 
	</select>
	<input type="text" name="searchText" id="searchText">
	<button type="submit">검색</button>
<!-- </form> -->
</div>
<div class="div3">
<!-- <form name="pageFrm" method="Post" action="boardList.do"> -->
페이지수: 
	<select name="unit" id="unit">
		<option value="10" <c:if test="${unit==10}">selected</c:if>>10</option>
		<option value="20" <c:if test="${unit==20}">selected</c:if>>20</option>
		<option value="30" <c:if test="${unit==30}">selected</c:if>>30</option>
		<option value="40" <c:if test="${unit==40}">selected</c:if>>40</option>
	</select>
</div>
</form>	

<table>
    <tr>
        <th width="10%">번호</th>
        <th width="40%">제목</th>
        <th width="20%">글쓴이</th>
        <th width="20%">등록일</th>
        <th width="15%">조회수</th>
    </tr>
    <c:set var="cnt" value="${rowNunmer}"/>
	<c:forEach items="${resultList}" var="list" varStatus="status">
	    <tr align="center">
		<td>${cnt}</td>
		<td align="left"><a href="boardDetail.do?unq=${list.unq}&cnt=1">${list.title}</a></td>
		<td>${list.name}</td>
		<td>${list.rdate}</td>
		<td>${list.hits}</td>
    </tr>	
    <c:set var="cnt" value="${cnt-1}" />
	</c:forEach>
</table>

<!-- 페이지 번호 보이기 -->
<div style="width: 600px; margin-top: 5px; text-align: center;">
<c:forEach var="i" begin="1" end="${totalPage}"> 
	<a href="boardList.do?viewPage=${i}&unit=${unit}">${i}</a>  
</c:forEach>
</div>

<div style="width: 600px; margin-top: 5px; text-align: right;">
	<button type="button" onclick="location='boardWrite.do'">글쓰기</button>
</div>
</body>
