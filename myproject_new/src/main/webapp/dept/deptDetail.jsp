<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서상세</title>
<style type="text/css">
table {
	width: 400px;
	border-collapse: collapse; /* cell 간격 없앰 */
}
th, td {
	border: 1px solid #cccccc;
	padding: 5px;
}
a {
	text-decoration: none;
}
</style>
</head>
<body>
<form action="deptWriteSave.do" method="post" name="frm">
<table>
	<caption>부서상세정보</caption>
	<tr>
		<th>부서번호</th>
		<td>${vo.deptno}</td>
	</tr>
	<tr>
		<th>부서이름</th>
		<td>${vo.dname}</td>
	</tr>
	<tr>
		<th>부서위치</th>
		<td>${vo.loc}</td>
	</tr>
	<tr>
		<th colspan="2">
			<button type="button" onclick="location.href='deptModifyWrite.do?deptno=${vo.deptno}'" >수정</button>
			<button type="button" onclick="location.href='deptDelete.do?deptno=${vo.deptno}'" >삭제</button>
			<button type="button" onclick="location.href='deptList.do'" >부서목록</button>
		</th>		
	</tr>
</table>
</form>
</body>
</html>