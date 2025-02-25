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
	
	<!-- 학생 아이디, 이름, 학과, 과목, 점수 -->
	<form name="stuList" action="stuListResult.jsp">
	<%
		String stuId = request.getParameter("stuId");
		String query = "SELECT * FROM STUDENT WHERE STU_ID ='" + stuId + "'";
		ResultSet rs = stmt.executeQuery(query);
		rs.next();
	%>
		<div>
			학생 아이디 : <input name="STU_ID" value="<%=rs.getString("STU_ID") %>">
		</div>
		<div>
			이름 : <input name="STU_NAME" value="<%=rs.getString("STU_NAME") %>">
		</div>
		<div>
			학과 : <input name="STU_DEPT" value="<%=rs.getString("STU_DEPT") %>">
		</div>
		<div>
			과목 : <input name="SUBJECT" value="<%=rs.getString("SUBJECT") %>">
		</div>
		<div>
			점수 : <input name="GRADE" value="<%=rs.getString("GRADE") %>">
		</div>
		
		<input type="submit" value="저장" >
	
	</form>
</body>
</html>