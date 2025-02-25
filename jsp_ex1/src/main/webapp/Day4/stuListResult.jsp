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
		String STU_ID = request.getParameter("STU_ID");
		String STU_NAME = request.getParameter("STU_NAME");
		String STU_DEPT = request.getParameter("STU_DEPT");
		String SUBJECT = request.getParameter("SUBJECT");
		String GRADE = request.getParameter("GRADE");
		
		
		try{
			String query=
				"UPDATE TBL_STULIST SET "
				+ "STU_ID = '" + STU_ID + "',"
				+ "STU_NAME = '" + STU_NAME + "' "
				+ "STU_DEPT = '" + STU_DEPT + "' "
				+ "SUBJECT = '" + SUBJECT + "' "
				+ "GRADE = '" + GRADE + "' "
				+ "WHERE STU_ID = '" + STU_ID + "'";
		
			int result = stmt.executeUpdate(query);
			out.println("저장되었습니다");
			out.println("<button onclick='fnBack()'> 되돌아가기 </button>");
			
		}catch(SQLException e) {
			out.println(e.getMessage());
		}		
	%>
</body>
</html>
<script>
	function fnBack(){
		location.href = "stuList.jsp";
	}
</script>




