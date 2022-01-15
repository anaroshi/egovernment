<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- 문장안에 줄바꿈을 html 태그로 변환 시작 -->
<% pageContext.setAttribute("newline", "\n"); %>
<c:set var="content" value="${fn:replace(vo.content,newline,'<br>')}" />
<!-- 문장안에 줄바꿈을 html 태그로 변환 끝 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 등록</title>
<link rel="stylesheet" type="text/css" href="../css/main.css" />
<style>
.input1 {
	width: 98%;
}
.textarea {
	width: 98%;
	height: 70px;
}
</style>
</head>
<body>
<%@ include file="../include/topMenu.jsp" %>
<form id="frm">
<table>
    <caption>게시판 상세</caption>
    <tr>
        <th width="20%"><label for="title">제목</label></th>
        <td width="80%">${vo.title}</td>
    </tr>    
    <tr>
        <th><label for="name">글쓴이</label></th>
        <td>${vo.name}</td>
    </tr>
    <tr>
        <th><label for="content">내용</label></th>
        <td height="100">${vo.content}</td>
    </tr>
    <tr>
        <th><label for="rdate">등록일</label></th>
        <td>${fn:substring(vo.rdate, 0, 10)}</td>
    </tr>
    <tr>
        <th colspan="2">
            <button type="button" onclick="location='boardList.do';">목록</button>
            <button type="button" onclick="location='boardModifyWrite.do?unq=${vo.unq}';">수정</button>
            <button type="button" onclick="location='passWrite.do?unq=${vo.unq}';">삭제</button>
        </th>        
    </tr>
</table>
</form>
</body>
</html>