<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
		// alert(formData);
		//비동기식  전송방식의 기능을 가지고 있는 jquery 함수
		$.ajax({
			/* 전송 전 세팅 */
			type:"POST",
			url: "boardModifySave.do",
			data: formData,
			dataType:"text", // 리턴 타입
			/* 전송 후 세팅 */
			success: function(result) { // controller => "1"/"" 반환
				if(result=="1") {
					alert("수정완료");
					location ="boardList.do";
				} else if(result=="-1") {
					alert("비밀번호가 일치하지 않습니다.");					
				} else {
					alert("수정실패");
				}
			},
			error: function() {
				alert("오류발생");
			}			
		}); 
	}
</script>
</head>
<body>
<%@ include file="../include/topMenu.jsp" %>
<form id="frm">
<input type="hidden" name="unq" value="${vo.unq}" />
<table>
    <caption>게시판 수정 화면</caption>
    <tr>
        <th width="20%"><label for="title">제목</label></th>
        <td width="80%"><input type="text" name="title" id="title" class="input1" value="${vo.title}" /></td>
    </tr>
    <tr>
        <th><label for="pass">암호</label></th>
        <td><input type="password" name="pass" id="pass" /></td>
    </tr>
    <tr>
        <th><label for="name">글쓴이</label></th>
        <td><input type="text" name="name" id="name" value="${vo.name}" /></td>
    </tr>
    <tr>
        <th><label for="content">내용</label></th>
        <td height="100px"><textarea name="content" id="content" class="textarea">${vo.content}</textarea></td>
    </tr>
    <tr>
        <th><label for="rdate">등록일</label></th>
        <td>${vo.rdate}</td>
    </tr>
    <tr>
        <th colspan="2">
            <button type="submit" onclick="fn_submit(); return false;">수정</button>
            <button type="button" onclick="location='boardList.do';">목록</button>
            <button type="reset">취소</button>
        </th>        
    </tr>
</table>
</form>
</body>
</html>