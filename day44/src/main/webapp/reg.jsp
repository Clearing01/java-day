<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
<div id="result"></div>
<form name="rForm" action="controller.jsp" method="post">
	<input type="hidden" name="action" value="reg">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" onchange="check()" name="mid" id="mid" class="input_id" required></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="mpw" required></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="mname" required></td>
		</tr>
		<tr>
			<td>계정권한</td>
			<td>
				<select name="role" id="role">
					<option selected>MEMBER</option>
					<option>ADMIN</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" value="회원가입">
			</td>
		</tr>
	</table>
</form>
<hr>
<a href="login.jsp">돌아가기</a>

<script type="text/javascript">
	function check() {
		var mid=document.getElementById('mid').value;
		var null1="null";
		var noName="(이름없음)";
		if(mid==null1 || mid==noName){
			document.getElementById("result").innerText = "사용할 수 없는 아이디입니다.";
			return false;
		}
		else {
			document.getElementById("result").innerText = "";	
		}		  
	}
</script>

<!--
<script
  src="https://code.jquery.com/jquery-3.6.0.slim.min.js"
  integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI="
  crossorigin="anonymous">
</script>

<script>
	$('.input_id').focusout(function){
		let userId = $('.input_id').val(); // input_id에 입력되는 값
		
		$.ajax({
			url: "checkId.json",
			type: "post",
			data: {userId: userId},
			dataType: 'json',
			success: function(result){
				if(result==0){
					$("#checkId").html('사용할 수 없는 아이디입니다.');
					$("#checkId".attr('color','red');
				} else {
					$("#checkId").html('사용할 수 있는 아이디입니다.');
					$("#checkId".attr('color','green');
				}
			},
			error : function(){
				alert("서버 요청 에러");
			}
		})
	})
</script> 
  --> 

</body>
</html>