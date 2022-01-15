<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서상세</title>
<link rel="stylesheet" type="text/css" href="../css/main.css" />
</head>
<body>
<%@ include file="../include/topMenu.jsp" %>
<form action="deptModify.do" method="post" name="frm">
<input type="hidden" name="deptno" value="${vo.deptno}">
<table>
	<caption>부서상세정보</caption>
	<tr>
		<th width="30%">부서번호</th>
		<td width="70%">${vo.deptno}</td>
	</tr>
	<tr>
		<th>부서이름</th>
		<td><input type="text" name="dname" value="${vo.dname}"></td>
	</tr>
	<tr>
		<th>부서위치</th>
		<td><input type="text" name="loc" value="${vo.loc}"></td>
	</tr>
	<tr>
		<th colspan="2">
			<button type="submit" >수정</button>
			<button type="button" onclick="location.href='deptList.do'" >취소</button>
		</th>		
	</tr>
</table>
</form>
</body>
</html>