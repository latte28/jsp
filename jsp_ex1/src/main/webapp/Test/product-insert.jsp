<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../db.jsp"%>
	
	<%
		String itemName = request.getParameter("itemName");
		String itemPrice= request.getParameter("itemPrice");
		
		
		String query = "INSERT INTO TBL_PRODUCT (ITEM_NAME, ITEM_PRICE) VALUES (?, ?)";
		
		stmt.executeUpdate(query);
		
		
		out.println("저장되었습니다.");
		
	%>
</body>
</html>