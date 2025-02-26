<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세보기</title>
</head>
<body>
	<%@ include file="../db.jsp" %>

	<%
		String itemName = request.getParameter("itemName");
		
		String query = 
				"SELECT P.ITEM_NAME, P.PRICE, R.CONTENTS, R.SCORE "
				+ "FROM TBL_PRODUCT P "
				+ "LEFT JOIN TBL_REVIEW R ON P.ITEM_NO = R.ITEM_NO "
				+ "WHERE P.ITEM_NAME = '" + itemName + "'";

		ResultSet rs = stmt.executeQuery(query);
		
		boolean hasData = false;
		String productName = "";
		int price = 0;


		if(rs.next()){
			productName = rs.getString("ITEM_NAME");
			price = rs.getInt("PRICE");
			hasData = true;
	%>
			<div>아이템 이름: <%= itemName %></div>
			<div>아이템 가격: <%= price %> 원</div>
	<%
			int reviewCount = 0;
			while(rs.next()){
				reviewCount++;
	%>
				<div>
					<p>평점: <%= rs.getInt("SCORE") %> </p>
					<p>리뷰: <%= rs.getString("CONTENTS") %></p>
				</div>
	<%
			}
			if(reviewCount == 0){
	%>
				<p>아직 등록된 리뷰가 없습니다.</p>
	<%
			}
		} else {
	%>
			<p>해당 제품을 찾을 수 없습니다.</p>
	<%
		}
	%>

	<div>
		<button onclick="fnRemove()">삭제</button>
		<button onclick="fnUpdate()">수정</button>
	</div>

</body>

<script>
	function fnRemove() {
		let itemName = "<%= itemName %>"; 
		location.href = "product-delete.jsp?itemName=" + itemName;
	}

	function fnUpdate() {
		alert("현재 수정은 불가능합니다.");
		location.href = "product-list.jsp";
	}
</script>

</html>
