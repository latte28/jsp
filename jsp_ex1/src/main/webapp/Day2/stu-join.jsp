<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 학번 이름 학과 성별 -->
	<!-- stu-join-result.jsp -->
	<form name="stu" action="stu-join-result.jsp">
		<div>
			학번 : <input name="stuNo">
			<input type="button" value="중복체크" onclick="fnIdCheck()">
		</div>
		<div>
			이름 : <input name="stuName">
		</div>
		<div>
			학과 : <input name="stuDept">
		</div>
		<div>
			성별 : 
			<input type="radio" name="gender" value="M" checked>남자
			<input type="radio" name="gender" value="M">여자
		</div>
		
		<div>
			<input type="button" value="저장" onclick="fnStuInsert()">
		</div>
		
	</form>
</body>

<script>
	let checkFlg = false;
	function fnStuInsert(){
		let stu = document.stu;
		
		if(!checkFlg){
			alert("중복체크 해주세요!");
			return;
		}
		
		if(stu.stuNo.value.length !=8 ){
			alert("학번은 8글자 이상!");
			return;
		}
		if(stu.stuName.value == ""||stu.stuDept.value==""){
			alert("이름, 학과를 모두 입력해주세요.");
			return;
		}
		stu.stuNo.disabled=false;
		stu.submit();
		
	}
	function fnIdCheck(){
		let stu = document.stu;
		if(stu.stuNo.value.length !=8 ){
			alert("학번은 8글자 이상!");
			return;
		}
		window.open(
				"id-check.jsp?stuNo=" + stu.stuNo.value,
				"check",
				"width=300, height=300"
		);
	}
	
	function getReturn(flg){
		if(flg=="N"){
			let obj = document.stu.stuNo;
			checkFlg =true;
			obj.disabled = true;
		}
	}
	

</script>
</html>









