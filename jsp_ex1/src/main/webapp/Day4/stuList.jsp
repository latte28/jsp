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
		text-decoration: none;
	}
	
	th {
		background-color: #ccc;
	}
</style>
<body>
	<%@include file="../db.jsp"%>
	
	<table>
	 	<tr>
	 		<th>학생 아이디</th>
	 		<th>이름</th>
	 		<th>학과</th>
	 		<th>과목</th>
	 		<th>점수</th>
	 	</tr>
	 <%
	 	ResultSet rs = null;
	 	String query = 
	 			"SELECT S.STU_ID, S.STU_NAME, S.STU_DEPT, G.SUBJECT, AVG(G.GRADE) AS AVG_GRADE "
	 		    + "FROM TBL_STULIST S " 
	 		    + "INNER JOIN TBL_GRADE G ON S.STU_ID = G.STU_ID " 
	 		    + "GROUP BY S.STU_ID, S.STU_NAME, S.STU_DEPT, G.SUBJECT " 
	 		    + "ORDER BY AVG(G.GRADE) DESC";
	 		    
	 	rs = stmt.executeQuery(query);
	 	while(rs.next()){
			String stuId = rs.getString("STU_ID");
	 %>	
	 	<tr>
 			<td><%=rs.getString("STU_ID") %></td>
 			<td>
 				<a href="stuViewList.jsp?stuId=<%= stuId %>"><%=rs.getString("STU_NAME") %></a>
 			</td>
 			<td><%=rs.getString("STU_DEPT") %></td>
 			<td><%=rs.getString("SUBJECT") %></td>
 			<td><%=rs.getString("AVG_GRADE") %></td>
	 	</tr>
	 	
	 <% 
		}
	 %>	
	 </table>
	 <div>
	 	<button onclick="fnUpate()">학생 추가</button>
	 </div>
</body>
</html>
<script>
	
	function fnUpate(){
		location.href="stuListUpdate.jsp";
	}

</script>











