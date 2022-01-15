<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<%-- <link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css'/>" /> --%>
<link rel="stylesheet" type="text/css" href="../css/main.css" />
<script type="text/javascript">
$(function() {
	// 생년월일 달력
	$("#birth").datepicker({
		changeMonth: true,
	  	changeYear: true,
	  	dateFormat: "yy-mm-dd", 
		showAnim: "slide", 
		showMonthAfterYear: true, dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
	});
	
	// 수정 button
	$("#btn_submit").click(function() {
		let userid  = $("#userid").val();
		let pass 	= $("#pass").val();  
		let name 	= $("#name").val();
		let checkPass = $("#checkPass").val();
		pass 		= $.trim(pass);
		name 		= $.trim(name);		
		
		if(pass=="" || pass.length <3) {
			alert("암호를 입력해주세요.");
			$("#pass").focus();
			return false;
		}
		if(pass!=checkPass) {
			alert("암호가 일치하지 않습니다. 확인해주세요.");
			$("#pass").focus();
			return false;
		}
		$("#pass").val(pass);
		
		if(name=="" || name.length <3) {
			alert("이름을 입력해주세요.");
			$("#name").focus();
			return false;
		}
		$("#name").val(name);
		
		let formData = $("#frm").serialize();
		// alert(formData);
		alert(userid);
		$.ajax({
            type : "POST",
            url  : "memberModifySave.do",
            async: false,
            dataType:"text",
            data : formData,
            success: function(result, statustext, xhr) {
            	console.log("result:"+result+" -> xhr: "+xhr);
				if(result=="1") {
					alert("저장완료");					
					location = "memberDetail.do?userid="+userid;
				} else {
					alert("저장실패");
				}
			},
			error: function() {
				alert("오류발생");
			}
        });			
	});	
	
	// userid 우편번호 찾기 -- 팝업창 이용 --
	$("#btn_zipcode").click(function(){
		//alert("우편번호 찾기");
		
		var w = 600;
		var h = 100;
		var url = "post1.do";
		window.open(url,'zipcode','width='+w+', height='+h);		
	});
	
});
</script>
</head>
<body>
<%@ include file="../include/topMenu.jsp" %>
<form id="frm" name="frm">
<input type="hidden" name="checkPass" id="checkPass" value="${vo.pass}">
<input type="hidden" name="userid" id="userid" value="${vo.userid}">
<table>
	<caption>회원정보 수정</caption>
	<tr>
		<th><label for="userid">아이디</label></th>
		<td>${vo.userid}</td>		
	</tr>
	<tr>
		<th><label for="pass">암호</label></th>
		<td><input type="password" name="pass" id="pass" required="required"> 확인용</td>
	</tr>
	<tr>
		<th><label for="name">이름</label></th>
		<td><input type="text" name="name" id="name" required="required" value="${vo.name}"></td>
	</tr>
	<tr>
		<th><label for="gender">성별</label></th>
		<td>
			<input type="radio" name="gender" value="M" <c:if test="${vo.gender == 'M'}" >checked</c:if> >남
			<input type="radio" name="gender" value="F" <c:if test="${vo.gender == 'F'}" >checked</c:if> >여
		</td>
	</tr>
	<tr>
		<th><label for="birth">생년월일</label></th>
		<td><input type="text" name="birth" id="birth" value="${vo.birth}"></td>
	</tr>
	<tr>
		<th><label for="phone">연락처</label></th>
		<td><input type="text" name="phone" id="phone" value="${vo.phone}"> (예:010-1234-1234)</td>
	</tr>
	<tr>
		<th><label for="address">주소</label></th>
		<td>
			<input type="text" name="zipcode" id="zipcode" value="${vo.zipcode}">
			<button type="button" id="btn_zipcode">우편번호 찾기</button>		
			<br>
			<input type="text" name="address" id="address" value="${vo.address}">
		</td>
	</tr>
</table>
<div class="div_button">
	<button type="button" id="btn_submit">수정</button>
	<button type="reset">취소</button>
</div>
</form>
</body>
</html>