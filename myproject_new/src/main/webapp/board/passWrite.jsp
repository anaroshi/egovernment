<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>암호 입력</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/main.css" />
<style>
input {
	width: 97%;
}
</style>
<script type="text/javascript">
$(function(){
	$("#delBtn").click(function() {		
		let pass = $.trim($("#pass").val());
		if(pass=="") {
			alert("암호를 입력해주세요.");
			$("#pass").focus();
			return false;
		}
		let unq = $.trim($("#unq").val());
		var sendData = "unq=${unq}&pass="+pass;
		//alert(sendData);
		$.ajax({
			type: "POST",
			url: "boardDelete.do",
			data: sendData,	
			dataType:"text",
			success: function(result) { // controller => "1"/"" 반환				
				if(result=="1") {
					alert("삭제 완료");
					location="boardList.do";
				} else if(result=="-1") {
					alert("비밀번호가 일치하지 않습니다.");
				} else {
					alert("삭제 실패");
				}
			},
			error : function() {
				alert("오류발생");
			}
		});		 
	});
});
</script>
</head>
<body>
<%@ include file="../include/topMenu.jsp" %>
<table>
	<tr>
		<th width="20%"><label for="pass" >암호 입력</label></th>
		<td width="50%"><input type="password" id="pass"></td>
		<td width="30%"><button type="button" id="delBtn">삭제하기</button></td>
	</tr>
</table>
</body>
</html>