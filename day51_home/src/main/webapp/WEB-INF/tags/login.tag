<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:choose>
	<c:when test="${member != null}">
		<h1>${member.mname}님, 반갑습니다!</h1>
		<a href="logout.do">로그아웃</a>
		<form action="search.do" method="post">
			<input type="hidden" name="searchContent" value="${member.mid}">
			<input type="hidden" name="searchCondition" value="loginMember">
			<input type="submit" value="내 게시글 보기">
		</form>
	</c:when>
	<c:otherwise>
	<h1>GUEST님, 반갑습니다!</h1>
	<form action="login.do" method="post">
		<input type="hidden" name="action" value="login">
		ID&nbsp;<input type="text" name="mid">&nbsp;&nbsp;PW&nbsp;<input type="password" name="mpw">&nbsp;&nbsp;
		<input type="submit" value="로그인">
	</form>
	</c:otherwise>
</c:choose>