<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 등록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/main.css" />
<style>
.input1 {
	width: 98%;
}
.textarea {
	width: 98%;
	height: 70px;
}
</style>
<script type="text/javascript">
	function fn_submit() {
		let title = $.trim($("#title").val());
		let pass = $.trim($("#pass").val());
		
		if (title =="") {
			alert("제목을 입력해주세요!");
			$("#title").focus();
			return false;
		}
		$("#title").val(title);
		
		if (pass=="") {
			alert("암호를 입력해주세요!");
			$("#pass").focus();
			return false;
		}
		$("#pass").val(pass);
		
		let formData = $("#frm").serialize();
		
		//비동기식  전송방식의 기능을 가지고 있는 jquery 함수
		$.ajax({
			type:"POST",
			url:"boardWriteSave.do",
			data: formData,
			dataType:"text", // 리턴 타입
			success: function(data) {
				if(data=="ok") {
					alert("저장완료");
					location ="boardList.do";
				} else {
					alert("저장실패");
				}
			},
			error: function() {
				alert("오류발생");
			}			
		}); 
		
		// document.frm.submit(); // 동기전송방식		
	};

</script>
</head>
<body>
<%@ include file="../include/topMenu.jsp" %>
<form id="frm">
<table>
    <caption>게시판 등록</caption>
    <tr>
        <th width="20%"><label for="title">제목</label></th>
        <td width="80%"><input type="text" name="title" id="title" class="input1" /></td>
    </tr>
    <tr>
        <th><label for="pass">암호</label></th>
        <td><input type="password" name="pass" id="pass" /></td>
    </tr>
    <tr>
        <th><label for="name">글쓴이</label></th>
        <td><input type="text" name="name" id="name" /></td>
    </tr>
    <tr>
        <th><label for="content">내용</label></th>
        <td><textarea name="content" id="content" class="textarea"></textarea></td>
    </tr>
    <tr>
        <th colspan="2">
            <button type="submit" onclick="fn_submit(); return false;">저장</button>
            <button type="reset">취소</button>
        </th>        
    </tr>
</table>
</form>
</body>
</html>