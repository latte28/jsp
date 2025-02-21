<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="join" action="join-result.jsp" method = "get">
		<div>
			아이디 : <input name="id">		
		</div>
		<div>
			비밀번호 : <input name="pwd" type="password">		
		</div>
		<div>
			비밀번호 확인 : <input name="pwd2" type="password">		
		</div>
		<div>
			이름 : <input name="userName">		
		</div>
		<div>
			핸드폰 : 
			<select name=phone1>
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
			</select>		
		</div>
		<div>
			성별 :
			<input type="radio" name="gender" value="M">남  <!--radio버튼은 name이 같아야 둘 중 하나만 선택 가능  -->
			<input type="radio" name="gender" value="F">여
		</div>
		<div>
			취미 : 
			<input type="checkbox" name="hobby" value="운동">운동
			<input type="checkbox" name="hobby" value="게임">게임
			<input type="checkbox" name="hobby" value="코딩">코딩
			<input type="checkbox" name="hobby" value="영화">영화
			<input type="checkbox" name="hobby" value="독서">독서
		</div>
		<div>
			<input type="button" value="회원가입" onclick="fnJoin()">
		</div>
	</form>
	
</body>
</html>
<script>
	function fnJoin(){
		let join = document.join;
		if(join.id.value.length == ""){
			alert("아이디를 입력해주세요!");
			join.id.focus();
			return;
		}
		if(join.id.value.length<6){
			alert("아이디를 6글자 이상 입력해주세요!");
			join.id.focus();
			return;
		}
		
		if(join.pwd.value != join.pwd2.value){
			alert("비밀번호를 일치하지 않습니다.");
			join.pwd2.focus();
			return;
		}
		if(join.pwd.value.length == ""){
			alert("비밀번호를 입력해주세요!");
			join.pwd.focus();
			return;
		}
		if(join.pwd.value.length<6){
			alert("비밀번호를 6글자 이상 입력해주세요!");
			join.pwd.focus();
			return;
		}
		
		var specialRule = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
	    if(!specialRule.test(join.pwd.value)){
	        alert("비밀번호 특수문자 필수!");
	        join.pwd.focus();
	        return;
	    } 	
		join.submit();
	}
	



</script>







