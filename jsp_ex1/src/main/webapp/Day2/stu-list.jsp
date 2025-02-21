<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table {
	width: 500px;
	border-collapse: collapse;
	margin: 10px 0;
}

th, td {
	border: 1px solid black;
	padding: 5px;
	text-align: center;
}

th {
	background-color: #ccc;
}
</style>
<body>
	<%@include file="../db.jsp"%>

	<%
	ResultSet rs = null;

	try {
		out.println("<table>");
		out.println("<tr>");
		out.println("<th> 학번 </th>");
		out.println("<th> 이름 </th>");
		out.println("<th> 학과 </th>");
		out.println("<th> 성별 </th>");
		out.println("</tr>");

		rs = stmt.executeQuery("SELECT * FROM STUDENT");
		while (rs.next()) {
			out.println("<tr>");
			out.println("<td>" + rs.getString("STU_NO") + "</td>");
			out.println("<td>" + rs.getString("STU_NAME") + "</td>");
			out.println("<td>" + rs.getString("STU_DEPT") + "</td>");
			if (rs.getString("STU_GENDER").equals("M")) {
		out.println("<td>" + "남자" + "</td>");
			} else {
		out.println("<td>" + "여자" + "</td>");
			}
			out.println("</tr>");
		}
		out.println("</table>");
	} catch (SQLException e) {
		out.println("오류 발생!");
	}
	%>

</body>
</html>