<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소 선택</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
table {
	width: 500px;
	border-collapse: collapse;
}
input {
	width: 97%;
}
</style>
<script type="text/javascript">
$(function() {
	// 선택한 주소 적용하기  
	$('#btn_send').click(function() {
		let addr = $("#address").val();
		
		let addr_array = addr.split(" ");
		let zipCode = addr_array[0].substring(1,addr_array[0].length-1);
		let address = addr.replace(addr_array[0],"");
		
		//alert(zipCode+" / "+address);
		// 본화면에 주소 적용하기 ---------- memberWrite.jsp
// 		opener.document.frm.zipcode.value = zipCode;
// 		opener.document.frm.address.value = address;
		
		$("#zipcode", opener.document).val(zipCode);
		$("#address", opener.document).val(address);
		
		self.close();		
	});
});
</script>
</head>
<body>
<table>
	<tr>
		<th width=20%>주소</th>
		<td width=65%>
			<select id="address">
				<c:forEach items="${resultList}" var="list">
					<option value="${list.addr}" >${list.addr}</option>
				</c:forEach>
			</select>
		</td>
		<td width=15%><button type="button" id="btn_send">적용하기</button></td>
	</tr>
</table>
</body>
</html>