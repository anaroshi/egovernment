<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
body {
    font-size: 9pt;
    color: #333333;
    font-family: 맑은 고딕;
}
button {
    font-size: 9pt;
}
table {
	width: 600px;
	border-collapse: collapse;
}
caption {
	font-size: 15pt;
	font-weight: bold;
	margin-top: 20px;	
	padding-bottom: 5px;
}
th, td {
	border: 1px solid #cccccc;
	padding: 3px;
	line-height: 2.0;
}
a {
	text-decoration: none;
}
a:hover {
	cursor: pointer;
	color: #cccccc;
}
.div_button {
	width: 600px;
	text-align: center;
	margin-top: 5px;
}
</style>

<script type="text/javascript">
$(function(){
	// 로그인 하기  
	$('#btn_submit').click(function() {
		let userid 	= $("#userid").val();
		let pass 	= $("#pass").val();
		userid 		= $.trim(userid);
		pass 		= $.trim(pass);
		
		if(userid=="" || userid.length <3) {
			alert("아이디를 입력해주세요.");
			$("#userid").focus();
			return false;
		}
		$("#userid").val(userid);
		
		if(pass=="" || pass.length <3) {
			alert("암호를 입력해주세요.");
			$("#pass").focus();
			return false;
		}
		$("#pass").val(pass);		

		$.ajax({
			type: "POST",
			url: "loginWriteSub.do",
			async: false,
			data: "userid="+userid+"&pass="+pass, // json(전송) 타입
			dtatYype: "text"				
		})
		.done(function (result, textStatus, xhr) {
			console.log("result:"+result+" -> xhr: "+xhr);
		        if(result=="ok") {
		        	alert(userid+"님 로그인 되었습니다.");
					location ="/board/boardList.do";
			} else {
				alert("로그인 정보를 다시 확인해주세요.");
			}
		})
		.fail(function(data, textStatus, errorThrown) {
			console.log("fail");
			alert("오류발생");
		});		
	});
});
</script>
</head>

<body>
<%@ include file="../include/topMenu.jsp" %>
<form id="frm" name="frm">
<table>
	<caption>로그인</caption>
	<tr>
		<th><label for="userid">아이디</label></th>
		<td>
			<input type="text" name="userid" id="userid" placeholder="아이디 입력" required="required">
		</td>		
	</tr>
	<tr>
		<th><label for="pass">암호</label></th>
		<td><input type="password" name="pass" id="pass" required="required"></td>
	</tr>
</table>
<div class="div_button">
	<button type="button" id="btn_submit">로그인</button>
	<button type="reset">취소</button>
</div>
</form>
</body>
</html>