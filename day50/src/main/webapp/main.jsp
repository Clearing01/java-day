<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="kim" tagdir="/WEB-INF/tags" %>
<jsp:useBean id="member" class="member.MemberVO" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>

<!--  <style type="text/css">

	#reply {
		display: none;
	}
	#content {
		display: block;
	}

</style>  -->
<link rel="stylesheet" href="css/main.css" type="text/css" />
</head>
<body>
	
	<div id="header">
		<h1>작은 티모</h1>
		
		<div class="gnb">
			<ul>
				<li><a href="ctrlB.jsp">메인으로</a></li>
				<li><kim:login /></li>
			</ul>
		</div>
	</div>
	
	<div id="wrapper">
	
		<div id="content">
			<h2>글 등록하기</h2>
					<kim:write type="msg" />
		</div>
		
		<div id="main">
			<h2>글 목록보기</h2>
			<c:forEach var="v" items="${datas}">
				<c:set var="b" value="${v.boardVO}" />
				
					<div id="board">
						<h3>[${b.mid}] ${b.msg} [ 좋아요 ${b.favcnt} | 댓글 ${b.rcnt} ]
							<kim:delete midCheck="${b.mid}" bid="${b.bid}" type="deleteB"/>
						</h3>
					</div>
					
						<div class="reply">
							<ul>
								<c:forEach var="r" items="${v.rList}">
									<li>[${r.mid}] ${r.rmsg}
										<kim:delete midCheck="${r.mid}" rid="${r.rid}" type="deleteR" />
									</li>
								</c:forEach>
							</ul>
						</div>
					
						<div class="reply">
								<kim:write type="rmsg" bid="${b.bid}" />
						</div>
						
			</c:forEach>
		</div>
		<a href="main.do?cnt=${cnt+2}">더보기&gt;&gt;</a> <br>
		<h3>최근 가입한 친구</h3>
		<c:forEach var="m" items="${datas2}">
			[${m.mname}]
		</c:forEach>
		
	</div>
		
	<div id="footer">
		회사소개 | 이용약관 | <strong>개인정보처리방침</strong> | 보호정책 | 고객센터 <strong>ⓒ Corp.</strong>
	</div>

 <script type="text/javascript">
	function login(){
		window.open("login.jsp","로그인창","width=500, height=500");	
	}
	function signUp(){
		window.open("signUp.jsp","회원가입창","width=500, height=500");	
	}
<!--	
	function writeBoard(){
		if(${mid==null}){
			alert('로그인 후 이용하세요');
		}
		else {
			document.bForm.submit();
		}
	}
-->
</script>
<!-- 
<script type="text/javascript">
	function writeReply(){
		if(${mid==null}){
			alert('로그인 후 이용하세요');
		}
		else {
			document.rForm.submit();
		}
	}
</script>
 -->

</body>
</html>