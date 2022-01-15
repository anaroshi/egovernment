<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>암호변경</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
body {
	font-size: 9pt;
}
table {
	width: 400px;
	border-collapse: collapse;
}
input {
	width: 97%;
}
</style>
<script type="text/javascript">
$(function(){
	// 암호변경
	$("#btn_passModifySave").click(function(){
		
		let userid = $("#userid").val();				
		let pass   = $("#pass").val();
		if(pass == null || pass.length < 3 ) {
			alert("기존 암호를 입력해주세요.");
			$("#pass").focus();
			return false;
		}
		pass = $.trim(pass);
		
		$("#pass").val(pass);
		
		let newPass1 = $("#newPass1").val();
		let newPass2 = $("#newPass2").val();
		$("#newPass1").val($.trim(newPass1));
		$("#newPass2").val($.trim(newPass2));
		
		if(newPass1 == null || newPass1.length < 3 ) {
			alert("변경할 새 암호를 입력해주세요.");
			$("#newPass1").focus();
			return false;
		}
		
		if(newPass2 == null || newPass2.length < 3 ) {
			alert("변경할 새 암호 확인용을 입력해주세요.");
			$("#newPass2").focus();
			return false;
		}		
		
		if(newPass1 != newPass2) {
			alert("변경할 새 암호와 확인용 암호가 일치하지 않습니다..");
			$("#newPass1").focus();
			return false;
		}
		
		//alert (`userid: `+userid+`, pass: `+pass+`, newPass1: `+newPass1+`, newPass2: `+newPass2);
		let passData = "userid="+userid+"&pass="+pass+"&newPass="+newPass1;
		
		$.ajax({
			type: "POST",
			url: "pass2.do",
			async: false,
			data: passData,
			dataType: "text"			
		})
		.done(function (result, textStatus, xhr) {
			console.log("result:"+result+" -> xhr: "+xhr);
			if (result=="1") {
				alert("암호변경 성공");
			} else {
				alert("기존 암호를 확인해 주세요.");
			}
		})
		.fail(function(data, textStatus, errorThrown) {
			console.log("fail");
			alert("오류발생");
		});			
		self.close();
	});
});

</script>
</head>
<body>
<input type="hidden" id="userid" value="${userid}">
<table>
	<tr>
		<th colspan="2">암호 변경</th>
	</tr>
	<tr>		
		<th width=40%>현재 암호</th>
		<td width=60%><input type="text" name="pass" id="pass"></td>
	</tr>
	<tr>
		<th>새 암호</th>
		<td><input type="text" name="newPass1" id="newPass1"></td>
	</tr>
	<tr>	
		<th>새 암호 확인</th>
		<td><input type="text" name="newPass2" id="newPass2"></td>
	</tr>
	<tr>	
		<th colspan="2"><button type="button" id="btn_passModifySave">변경</button></th>
	</tr>
</table>
</body>
</html>