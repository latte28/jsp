<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	
	<%-- <jsp:include page="number.jsp"></jsp:include> --%> <!-- 컴파일을 다 하고 나서 합친다 -->
	
	<%@ include file="number.jsp" %>   <!-- 일단 한곳으로 모은 후 컴파일 -->
	<%= a %> 
	
	<div>메인!!!!!!!!!</div>
	<%@ include file="footer.jsp" %>
</body>
</html>