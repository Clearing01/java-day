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

<c:import url="NewFile1.jsp" var="url" />
<c:out value="${url}" escapeXml="false" />

<hr>

<c:import url="https://www.naver.com/" var="url2" />
<c:out value="${url2}" escapeXml="false" />

</body>
</html>