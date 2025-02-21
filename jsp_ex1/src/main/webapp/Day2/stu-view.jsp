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
	<form action="stu-update.jsp">
	<%
		//학번 이름 학과 학년 점수 
		String stuNo = request.getParameter("stuNo");
		ResultSet rs = stmt.executeQuery(
				"SELECT * "
				+ "FROM STUDENT S "
				+ "INNER JOIN ENROL E ON E.STU_NO = S.STU_NO "
				+ "WHERE S.STU_NO = "
				+ "'" + stuNo + "'" );
	
		if(rs.next()){
	%>
		<div>학번 : <%=rs.getString("STU_NO") %></div>
		<div>이름 : <%=rs.getString("STU_NAME") %></div>
		<div>학과 : <%=rs.getString("STU_DEPT") %></div>
		<div>학년 : <%=rs.getString("STU_GRADE") %></div>
		<div>성적 : <%=rs.getString("ENR_GRADE") %></div>
	<%
		}else{
			out.println("조회 실패!");
		}
	%>	
		<input name="stuNo" value="<%= stuNo %>"hidden> <!-- 사용자 눈에는 보이지 않고 내부적으로 가능 -->
		<input type="submit" value="수정">
	</form>
		
</body>
</html>