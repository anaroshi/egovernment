<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
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
	
	// 저장 button
	$("#btn_submit").click(function() {
		let userid 	= $("#userid").val();
		let idis 	= $("#idis").val();
		let pass 	= $("#pass").val();  
		let name 	= $("#name").val();
		userid 		= $.trim(userid);
		pass 		= $.trim(pass);
		name 		= $.trim(name);
		
		if(userid=="" || userid.length <3) {
			alert("아이디를 입력해주세요.");
			$("#userid").focus();
			return false;
		}
		$("#userid").val(userid);
		
		if(idis != "checked") {
			alert("아이디 중복체크를 해주세요.");
			$("#userid").focus();
			return false;
		}
		
		if(pass=="" || pass.length <3) {
			alert("암호를 입력해주세요.");
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

		$.ajax({
            type : "POST",
            url  : "memberWriteSave.do",
            async: false,
            dataType:"text",
            data : formData,
            success: function(result, statustext, xhr) {
            	console.log("result:"+result+" -> xhr: "+xhr);
				if(result=="ok") {
					alert("저장완료");
					location ="loginWrite.do";
				} else {
					alert("저장실패");
				}
			},
			error: function() {
				alert("오류발생");
			}
        });			
	});
	
	// userid 중복체크
	$("#btn_userid").click(function(){
		
		let userid 	= $("#userid").val();		
		if(userid=="" || userid.length <3) {
			alert("아이디를 입력해주세요.");
			$("#userid").focus();
			return false;
		}
		$("#userid").val(userid);		
		
		$.ajax ({
			type : "POST",
            url  : "idcheck.do",
            async: false,
            dataType:"text",
            data : "userid="+userid, // json 타입이으로 보냄
            success: function(result, statustext, xhr) {
            	console.log("result:"+result+" -> xhr: "+xhr)
				if(result=="fail") {
					alert("이미 사용중인 아이디입니다.");
					$("#idis").val("");
					$("#userid").focus();
				} else {
					alert("사용 가능한 아이디입니다.");
					$("#idis").val("checked");
					$("#pass").focus();
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
<table>
	<tr>
		<th width="15%"><a href="">홈</a></th>
		<th width="20%"><a href="/board/boardList.do">게시판</a></th>
		<th width="15%"><a href="/code/codeList.do">코드</a></th>
		<th width="15%"><a href="/dept/deptList.do">부서</a></th>
		<th width="20%"><a href="/member/memberWrite.do">회원가입</a></th>
		<th width="15%"><a href="/member/loginWrite.do">로그인</a></th>
	</tr>
</table>

<form id="frm" name="frm">
<input type="hidden" name="idis" id="idis" value="">
<table>
	<caption>회원가입 폼</caption>
	<tr>
		<th><label for="userid">아이디</label></th>
		<td>
			<input type="text" name="userid" id="userid" placeholder="아이디 입력" required="required">
			<button type="button" id="btn_userid">중복체크</button>
		</td>		
	</tr>
	<tr>
		<th><label for="pass">암호</label></th>
		<td><input type="password" name="pass" id="pass" required="required"></td>
	</tr>
	<tr>
		<th><label for="name">이름</label></th>
		<td><input type="text" name="name" id="name" required="required"></td>
	</tr>
	<tr>
		<th><label for="gender">성별</label></th>
		<td>
			<input type="radio" name="gender" value="M">남
			<input type="radio" name="gender" value="F">여
		</td>
	</tr>
	<tr>
		<th><label for="birth">생년월일</label></th>
		<td><input type="text" name="birth" id="birth"></td>
	</tr>
	<tr>
		<th><label for="phone">연락처</label></th>
		<td><input type="text" name="phone" id="phone"> (예:010-1234-1234)</td>
	</tr>
	<tr>
		<th><label for="address">주소</label></th>
		<td>
			<input type="text" name="zipcode" id="zipcode">
			<button type="button" id="btn_zipcode">우편번호 찾기</button>		
			<br>
			<input type="text" name="address" id="address">
		</td>
	</tr>
</table>
<div class="div_button">
	<button type="button" id="btn_submit">저장</button>
	<button type="reset">취소</button>
</div>
</form>
</body>
</html>