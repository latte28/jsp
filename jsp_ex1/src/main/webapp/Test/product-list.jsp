<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, th, tr, td {
		border: 1px solid black;
		border-collapse: collapse;
		padding: 10px;
		text-align: center;
	}
</style>
</head>
<body>
	<%@include file="../db.jsp"%>
	
	<table>
		<tr>
			<th>아이템 번호</th>
			<th>아이템 이름</th>
			<th>아이템 가격</th>
			<th>아이템 평점</th>
		</tr>
		
	<%
		String query = 
			  "SELECT P.ITEM_NO, P.ITEM_NAME, P.PRICE, COALESCE(TO_CHAR(ROUND(AVG(R.SCORE), 2)), '평점없음') AS AVG_GRADE "
			+ "FROM TBL_PRODUCT P "
			+ "LEFT JOIN TBL_REVIEW R ON P.ITEM_NO = R.ITEM_NO "
			+ "GROUP BY P.ITEM_NO, P.ITEM_NAME, P.PRICE "
			+ "ORDER BY P.ITEM_NO ASC";
	
		ResultSet rs = stmt.executeQuery(query);
		while(rs.next()){
	%>
			<tr>
				<td><%= rs.getString("ITEM_NO") %></td>
				<td>
					<a href="product-view.jsp?itemName=<%= rs.getString("ITEM_NAME") %>"><%= rs.getString("ITEM_NAME") %></a>
				</td>
				<td><%= rs.getString("PRICE") %></td>
				<td><%= rs.getString("AVG_GRADE") %></td>
			</tr>
	<%
		}
	
	%>
	</table>
	<div>
		<button onclick="fnadd()">제품 추가</button>
	</div>
</body>
<script>
	function fnadd(){
		location.href = "product-add.jsp";
	}
</script>
</html>