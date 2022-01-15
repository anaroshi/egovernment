<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코드 등록</title>
<link rel="stylesheet" type="text/css" href="../css/main.css" />
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
<%@ include file="../include/topMenu.jsp" %>
<form method="post" name="frm" action="codeWriteSave.do">
<table>
	<caption>코드 등록</caption>
	<tr>
		<th>분류</th>
		<td>
			<select name="gid">
				<option value="1">Jop(업무)</option>
				<option value="2">Hoppy(취미)</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>코드명</th>
		<td>
			<input type="text" name="name" />
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