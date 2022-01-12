<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코드 등록</title>
<style type="text/css">
table {
	width: 400px;
	border-collapse: collapse; 
}
th,td {
	border: 1px solid #ccccc;
	padding: 5px;
}
</style>
<script type="text/javascript">
	function fn_submit() {
		if (document.frm.name.value=="") {
			alert("코드명을 입력해주세요.");
			document.frm.name.focus();
			return false;	
		}
		document.frm.submit();
	}
</script>
</head>
<body>
<form method="post" name="frm" action="codeWriteSave.do">
<table>
	<caption>코드 등록</caption>
	<tr>
		<th>번호</th>
		<td>
			<input type="text" name="code" value="${vo.code}" readonly="readonly" />
		</td>
	</tr>
	<tr>
		<th>분류</th>		
		<td>
			<select name="gid">
				<option value="1" <c:if test="${vo.gid=='1'}">selected</c:if>>Job(업무)</option>
				<option value="2" <c:if test="${vo.gid=='2'}">selected</c:if>>Hoppy(취미)</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>코드명</th>
		<td>
			<input type="text" name="name" value="${vo.name}" />
		</td>
	</tr>
	<tr>
		<th colspan="2">
			<button type="submit" onclick="fn_submit(); return false;">저장</button>
			<button type="reset">취소</button>
			<button type="button" onclick="location.href='codeList.do'">목록</button>
		</th>
	</tr>
</table>
</form>
</body>
</html>