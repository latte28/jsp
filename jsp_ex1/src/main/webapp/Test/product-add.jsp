<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 추가</title>
</head>
<body>
	<%@ include file="../db.jsp" %>
	<form name="item" action="product-insert.jsp">
		<div>
			아이템 이름: <input name="itemName" id="itemName">
			<input type="button" value="중복체크" onclick="fnNameCheck()">
		</div>
		<div>
			아이템 가격: <input name="itemPrice" id="itemPrice">
		</div>	
		<input type="button" value="추가" onclick="fnInsert()">
	</form>
	
	<script>
		let checkFlg = false;


		function fnInsert(){
			let item = document.item;
			
			if(!checkFlg){
				alert("중복체크 해주세요!");
				return;
			}
			if(item.itemPrice.value < 0 ){
				alert("가격은 0원 이상부터 입력해주세요.");
				return;
			}
			if(item.itemName.value.trim() === "" || item.itemPrice.value.trim() === ""){
				alert("빈 값은 허용되지 않습니다.");
				return;
			}
			item.submit();
		}

	
		function fnNameCheck(){
			let item = document.item;
			if(item.itemName.value.trim() === ""){
				alert("제품명을 입력하세요.");
				return;
			}

			window.open(
				"name-check.jsp?itemName=" + encodeURIComponent(item.itemName.value),
				"check",
				"width=300, height=300"
			);
		}


		function getReturn(flg){
			if(flg === "N"){

				checkFlg = true;
				document.item.itemName.disabled = true;
			}
		}
	</script>
</body>
</html>
