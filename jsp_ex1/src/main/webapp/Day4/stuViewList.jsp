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
	<form action="stuListUpdate.jsp">
	<%
		//학번 이름 학과 학년 점수 
		String stuId = request.getParameter("stuId");
		ResultSet rs = stmt.executeQuery(
				"SELECT S.STU_NAME, S.STU_DEPT, G.SUBJECT, G.GRADE "
			  + "FROM TBL_STULIST S " 
			  +	"INNER JOIN TBL_GRADE G ON S.STU_ID = G.STU_ID " 
			  + "WHERE S.STU_ID = "
			  + "'" + stuId + "'"
				);
	
		while(rs.next()){
	%>
		<div>이름 : <%=rs.getString("STU_NAME") %></div>
		<div>학과 : <%=rs.getString("STU_DEPT") %></div>
		
		<div>과목 : <%=rs.getString("SUBJECT") %></div>
		<div>점수 : <%=rs.getString("GRADE") %></div>
	<%
		}
	%>	
		<input name="stuId" value="<%= stuId %>"hidden> <!-- 사용자 눈에는 보이지 않고 내부적으로 가능 -->
		<button>삭제</button>
		<button>수정</button>
	</form>
</body>
</html>