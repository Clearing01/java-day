<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="fav.FavVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="fDAO" class="fav.FavDAO" />
<jsp:useBean id="fVO" class="fav.FavVO" />
<jsp:setProperty property="*" name="fVO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous">
</script>
</head>
<body>
<hr>
${member.mid}
<hr>
<%= fVO.getMid() %>
<hr>
${param.bid}
<%
FavVO vo = fDAO.selectOne(fVO); 
%>

<% 
	if(vo!=null){
%>
	<%		
		if(vo.getFav()==1){
	%>
			<div id="result" onclick="fav();">♥</div>
	<%			
		} else {
	 %>
	 		<div id="result" onclick="fav();">♡</div>
	 <%
		}
	 %>
	<%
	} else {	
	%>
	<div id="result" onclick="fav();">♡</div>
<%	
	}
%>

<!-- 
<c:if test="${member!=null}">
<div id="result" onclick="fav();">♡</div>
</c:if>
 -->
<c:if test="${member==null}">
<h3>로그인 후 이용해주세요</h3>
</c:if>

<hr>

<a href="main.do">메인으로</a>

<script type="text/javascript">
	function fav(){
		var mid = '${member.mid}';
		var bid = '${param.bid}';
		console.log('로그: fav');
		$.ajax({
			type: 'POST',
			url: 'fav',
			data: {mid:mid,bid:bid},
			success: function(result){
				console.log("로그1 ["+result+"]");
				if(result==1){
					$("#result").html("♥");
				}
				else{
					$("#result").html("♡");
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

<script type="text/javascript">
	function lstatus(){
		var mid = '${member.mid}';
		var bid = '${param.bid}';
		console.log('로그: Lstatus');
		$.ajax({
			type: 'POST',
			url: '/Lstatus',
			data: {mid:mid,bid:bid},
			success: function(result){
				console.log("로그1 ["+result+"]");
				if(result>???){
					console.log("로그2 [추천+1]");
					$("#result").html(result);
					$('#photo').prop("src","추천파일");
				}
				else{
					$("#result").html(result);
					$('#photo').prop("src","추천취소파일");
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

<script type="text/javascript">
	function nlstatus(){
		var mid = '${member.mid}';
		var bid = '${param.bid}';
		console.log('로그: NLstatus');
		$.ajax({
			type: 'POST',
			url: '/NLstatus',
			data: {mid:mid,bid:bid},
			success: function(result){
				console.log("로그1 ["+result+"]");
				if(result>???){
					console.log("로그2 [비추천+1]");
					$("#result").html(result);
					$('#photo1').prop("src","비추천파일");
				}
				else{
					$("#result").html(result);
					$('#photo1').prop("src","비추천취소파일");
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

<script type="text/javascript">
	function report(){
		var mid = '${member.mid}';
		var bid = '${param.bid}';
		console.log('로그: report');
		$.ajax({
			type: 'POST',
			url: '/Report',
			data: {mid:mid,bid:bid},
			success: function(result){
				console.log("로그1 ["+result+"]");
				if(result>???){
					console.log("로그2 [신고]+1]");
					$("#result").html(result);
					$('#photo2').prop("src","신고파일");
				}
				else{
					$("#result").html(result);
					$('#photo2').prop("src","신고취소파일");
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

</body>
</html>