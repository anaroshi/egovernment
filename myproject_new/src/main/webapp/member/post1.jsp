<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 주소 검색</title>
<style type="text/css">
table {
	width: 400px;
	border-collapse: collapse;
}
input {
	width: 97%;
}
</style>
</head>
<body>
<form action="post2.do" name="frm" method="post">
<table>
	<tr>
		<th width=30%>동 입력</th>
		<td width=55%><input type="text" name="dong"></td>
		<td width=15%><button type="submit">검색</button></td>
	</tr>
</table>
</form>
</body>
</html>