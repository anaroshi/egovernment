<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코드관리 리스트</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

<style type="text/css">
table {
	width: 600px;
	border-collapse: collapse; /* cell 간격 없앰 */
}
th, td {
	border: 1px solid #cccccc;
	padding: 5px;
}
a {
	text-decoration: none;
}
.rowValue:hover {
	background-color: #dddd;	
}
</style>
<script type="text/javascript">
function fn_delete(code) {
	if(confirm("정말 삭제하시겠습니까?")) {
		location='codeDelete.do?code='+code;
	}		
};
</script>
</head>
<body>
<div style="width:100%; text-align:left;">Total : ${count} 개</div>
<table>
<caption>코드목록</caption>
<colgroup>
	<col width="10%"/>
	<col width="10%"/>
	<col width="20%"/>
	<col width="40%"/>
	<col width="20%"/>
</colgroup>
<tr>
	<th> </th>
	<th>번호</th>
	<th>그룹명</th>
	<th>코드명</th>
	<th></th>
</tr>
<c:set var="count" value="1" />
<c:forEach items="${resultList}" var="vo" varStatus="status">
<tr class="rowValue" align="center">
	<td>${status.count}/${count}</td>
	<td><a href="codeDetail.do?code=${vo.code}" >${vo.code}</a></td>
	<td>${vo.gid}</td>
	<td>${vo.name}</td>
	<td>
		<button type="button" onclick="location.href='codeDetail.do?code=${vo.code}'" >수정</button>
		<button type="button" onclick="fn_delete('${vo.code}')" >삭제</button>
	</td>
	<c:set var="count" value="${count+1}"/>
</tr>
</c:forEach>
<tr>
<td colspan="5">
<a href="codeWrite.do">글등록</a>
</td>
</tr>
</table>
</body>
</html>