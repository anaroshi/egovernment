<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 세션 로그인 체크
	String USERID = (String)session.getAttribute("sessionUserID");
%>
<table>
	<tr>
		<th width="15%"><a href="">홈</a></th>
		<th width="20%"><a href="/board/boardList.do">게시판</a></th>
		<th width="15%"><a href="/code/codeList.do">코드</a></th>
		<th width="15%"><a href="/dept/deptList.do">부서</a></th>
<% 
	if(USERID == null) { 
%>
		<th width="20%"><a href="/member/memberWrite.do">회원가입</a></th>
		<th width="15%"><a href="/member/loginWrite.do">로그인</a></th>
<%
	} else {
%>
		<th width="20%"><a href="/member/memberDetail.do?userid=<%=USERID%>">회원정보</a></th>
		<th width="15%"><a href="/member/logout.do">로그아웃</a></th>
<%
	}
%>
	</tr>
</table>
</body>
</html>