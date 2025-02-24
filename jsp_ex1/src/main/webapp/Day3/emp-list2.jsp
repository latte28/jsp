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
	 <table>
	 	<tr>
	 		<th>사번</th>
	 		<th>이름</th>
	 		<th>급여</th>
	 		<th>급여등급</th>
	 		<th>팀장</th>
	 		<th>부서명</th>
	 	</tr>
	 	
	 <%
	 	ResultSet rs = null;
	 	String query = 
	 		 "SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE, NVL(E2.ENAME, '') AS TNAME, D.DNAME, E.DEPTNO " +
             "FROM EMP E " +
             "INNER JOIN EMP E2 ON E.MGR = E2.EMPNO " +
             "INNER JOIN DEPT D ON D.DEPTNO = E.DEPTNO " +
             "INNER JOIN SALGRADE S ON E.SAL BETWEEN LOSAL AND HISAL " +
             "WHERE S.GRADE >= 1 " +
             "ORDER BY S.GRADE DESC";

		rs = stmt.executeQuery(query);
		while(rs.next()){
			String deptNo = rs.getString("DEPTNO");
	 %>
	 
	 		<tr>
	 			<td><%=rs.getString("EMPNO") %></td>
	 			<td><%=rs.getString("ENAME") %></td>
	 			<td><%=rs.getString("SAL") %></td>
	 			<td><%=rs.getString("GRADE") %></td>
	 			<td><a href="emp-t-chart.jsp?deptNo=<%= rs.getString("DEPTNO") %>"><%=rs.getString("TNAME") %></a></td>
	 			<td><a href="emp-d-chart.jsp?deptNo=<%= rs.getString("DEPTNO") %>"><%= rs.getString("DNAME") %></a></td>
	 		</tr>
		 
	<% 
		}
	 %>	
	 </table>
</body>
</html>