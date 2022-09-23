<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form>
	<select name="sel">
		<option ${param.sel=='-' ? 'selected':''}>-</option>
		<option ${param.sel=='apple' ? 'selected':''}>apple</option>
		<option ${param.sel=='banana' ? 'selected':''}>banana</option>
		<option ${param.sel=='kiwi' ? 'selected':''}>kiwi</option>
	</select>
	<input type="submit" value="선택">
</form>

<hr>

<c:choose>
	<c:when test="${param.sel == 'apple'}">
		apple을 선택하셨습니다.
	</c:when>
	<c:when test="${param.sel == 'banana'}">
		banana를 선택하셨습니다.
	</c:when>
	<c:when test="${param.sel == 'kiwi'}">
		kiwi를 선택하셨습니다.
	</c:when>
	<c:otherwise>
		-----
	</c:otherwise>
</c:choose>

</body>
</html>