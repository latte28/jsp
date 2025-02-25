<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
	.page {
		margin : 10px 5px;
	}
	.page a{
		padding : 5px;
		border : 1px solid #ccc;
		text-align : center;
		text-decoration: none;
		color : black;
	}
	.page .active{
		background-color : #ddd;
		font-weight : bold;
	}
	select{
		margin-bottom : 10px;
	}
</style>
</head>
<body>
	<%@include file="../db.jsp"%>
	<%
		String keyword="";
		if(request.getParameter("keyword") != null){
			keyword = request.getParameter("keyword");
		}
	%>
	<div>
		<input placeholder="검색어" id="keyword" value="<%= keyword %>">
		<button onclick="fnSearch()">검색</button>
	</div>
	<select id="number" onchange = "fnNumber(this.value)">
		<option value="3" >3개씩</option>
		<option value="5" >5개씩</option>
		<option value="10" >10개씩</option>
		<option value="15" >15개씩</option>
		<option value="20" >20개씩</option>
	</select>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>

		<%
		int pageSize = 5; // 한 페이지에 몇개씩 보여줄지
		if(request.getParameter("size") != null){
			pageSize = Integer.parseInt(request.getParameter("size"));
		}
		
		int currentPage = 1;
		if(request.getParameter("page") != null){
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		int offset = (currentPage-1)*pageSize;
		
		
		ResultSet rs = null;
		
		//전체 페이지 조회하는곳에서도 같은 조건을 넣어줘야함!!
		ResultSet rsCnt = stmt.executeQuery(
					"SELECT COUNT(*) AS TOTAL FROM BOARD "
				  + "WHERE TITLE LIKE '%" + keyword + "%' "
				);
		rsCnt.next();
		int total = rsCnt.getInt("TOTAL");
		int pageList = (int) Math.ceil((double) total / pageSize); 
		// ceil(올림), round(반올림), floor(내림)
		
		//검색 소스 추가
		String query = 
				"SELECT * FROM BOARD " 
			  + "WHERE TITLE LIKE '%" + keyword + "%' "	
			  + "OFFSET "+ offset +" ROWS FETCH NEXT "
			  + pageSize + " ROWS ONLY";
		
		rs = stmt.executeQuery(query);
		while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("BOARDNO")%></td>
			<td><%=rs.getString("TITLE")%></td>
			<td><%=rs.getString("USERID")%></td>
			<td><%=rs.getString("CNT")%></td>
			<td><%=rs.getString("CDATETIME")%></td>
		</tr>
	<%
		}
	%>
	</table>
	<div class="page">
	
	<%	
		if(currentPage != 1){
			out.println("<a href='?page=" + (currentPage-1) + "&size="+ pageSize +"'=>◀</a>");
		}
		
		for (int i = 1; i <= pageList; i++) {
		
			if(currentPage == i){
				out.println("<a href='?page=" + i + "&size="+ pageSize +"' class= 'active'>" + i + "</a>");
			}else{
				out.println("<a href='?page=" + i + "&size="+ pageSize +"'>" + i + "</a>"); //같은 페이지에서 이동
			}
		}
		if(currentPage != pageList){
			out.println("<a href='?page=" + (currentPage + 1) + "&size="+ pageSize +"'>▶</a>");
		}

	%>
	</div>	
	<input hidden id="pageSize" value="<%= pageSize %>">
	<%-- <input hidden id="paramKey" value="<%= keyword %>"> --%>
</body>
</html>
<script>

	/* let paramKey = document.querySelector("#paramKey").value;
	document.querySelector("#keyword").value= paramKey; */

	let pageSize = document.querySelector("#pageSize").value;
	let number = document.querySelector("#number");
	for(let i=0; i<number.length; i++){
		if(number[i].value==pageSize){
			number[i].selected = true;
		}
	}

	function fnNumber(num) {
		location.href = "?size=" + num;
	}
	
	function fnSearch(){
		let keyword = document.querySelector("#keyword").value;
		let pageSize = document.querySelector("#pageSize").value;
		location.href= "?keyword=" + keyword + "&size=" + pageSize;
	}
	
	
	
	
	
	
</script>