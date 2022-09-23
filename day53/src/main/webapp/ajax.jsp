<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AJAX 실습</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>

<div id="box">
	<input type="text" name="mid" id="mid">
	<button class="btn" onclick="check();">중복검사</button>
	<div id="result"></div>
</div>

<script type="text/javascript">
	function check(){
		var mid = $("#mid").val();
		$.ajax({
			type: 'GET',
			url: '${pageContext.request.contextPath}/check.do?mid='+mid,
			data: {mid:mid},
			success: function(result){
				// result는 String
				// JS - 1 : 모든 데이터가 객체
				// JS - 2 : 동적타이핑(즉각적으로 자동 형변환)
				console.log("로그1 ["+result+"]");
				if(result==1){
					$("#result").text("사용 가능한 아이디입니다!");
					$("#result").css("color","blue");
				}
				else{
					$("#result").text("이미 사용중인 아이디입니다...");
					$("#result").css("color","red");
				}
			},
			error: function(request, status, error){ // 순서 체크해보기!
				console.log("상태코드: "+request.status);
				console.log("메세지: "+request.responseText);
				console.log("에러설명: "+error);
			}
		});
	}
</script>

<!-- 
	mid(V에서 입력한 값)라는 변수를 만들어서 사용자가 입력한 값을 확보한 상태
	DB한테 물어볼 예정 "mid라는 값이 DB에 이미 있어?" => DAO(M)
	C가 작업을 할 차례..!! "FC=서블릿"
 -->
</body>
</html>