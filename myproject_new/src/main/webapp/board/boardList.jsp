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
</style>
</head>
<body>
total: ${totalRow}개<br>
<table>
    <tr>
        <th width="10%">번호</th>
        <th width="40%">제목</th>
        <th width="20%">글쓴이</th>
        <th width="20%">등록일</th>
        <th width="15%">조회수</th>
    </tr>
    <c:set var="cnt" value="1"/>
	<c:forEach items="${resultList}" var="list" varStatus="status">
	    <tr align="center">
		<td>${status.count} / ${cnt}</td>
		<td align="left">${list.title}</td>
		<td>${list.name}</td>
		<td>${list.rdate}</td>
		<td>${list.hits}</td>
    </tr>	
    <c:set var="cnt" value="${cnt+1}" />
	</c:forEach>
</table>
<div style="width: 600px; margin-top: 5px; text-align: right;">
	<button type="button" onclick="location='boardWrite.do'">글쓰기</button>
</div>
</body>
