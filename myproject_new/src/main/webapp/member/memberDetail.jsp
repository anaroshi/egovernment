<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%-- <link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css'/>" /> --%>
<link rel="stylesheet" type="text/css" href="../css/main.css" />
<script type="text/javascript">
$(function() {

	// 암호변경
	$("#btn_pass").click(function(){
		let userid = $("#userid").text();
		let w = 600;
		let h = 200;
		let url = "pass1.do?userid="+userid;
		
		window.open(url,"passModify","width="+w+", height="+h);
	});
	
	// member 정보수정
	$("#btn_modify").click(function(){
		let userid = $("#userid").text();
		location 	= "memberModify.do?userid="+userid;
	});
});
</script>
</head>
<body>
<%@ include file="../include/topMenu.jsp" %>
<form id="frm" name="frm">
<table>
	<caption>회원정보</caption>
	<tr>
		<th colspan="2">가입일자 : ${vo.reg}</th>	
				
	</tr>
	<tr>
		<th width="20%"><label for="userid">아이디</label></th>
		<td width="80%" id="userid">${vo.userid}</td>		
	</tr>
	<tr>
		<th><label for="pass">암호</label></th>
		<td><button type="button" id="btn_pass">암호를 변경 하시겠습니까?</button></td>
	</tr>
	<tr>
		<th><label for="name">이름</label></th>
		<td>${vo.name}</td>
	</tr>
	<tr>
		<th><label for="gender">성별</label></th>
		<td>${vo.gender}</td>
	</tr>
	<tr>
		<th><label for="birth">생년월일</label></th>
		<td>${vo.birth}</td>
	</tr>
	<tr>
		<th><label for="phone">연락처</label></th>
		<td>${vo.phone}</td>
	</tr>
	<tr>
		<th><label for="address">주소</label></th>
		<td>
			${vo.zipcode}		
			<br>
			${vo.address}
		</td>
	</tr>
</table>
<div class="div_button">
	<button type="button" id="btn_modify">수정</button>
</div>
</form>
</body>
</html>