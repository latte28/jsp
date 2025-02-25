<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../db.jsp"%>
	
	<%
		String stuId = request.getParameter("stuId");
		try{
		 	int result = stmt.executeUpdate("" );
		 	if(result > 0){
		 		out.println("삭제되었습니다!");
		 	}else{
		 		out.println("없는 데이터입니다.");
		 	}
			
		} catch (SQLException e) {
			out.println("오류 발생!");
		}	
	%>
</body>
</html>