<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ attribute name="type" %>
<%@ attribute name="midCheck" %>
<%@ attribute name="bid" %>
<%@ attribute name="rid" %>


<c:choose>
	<c:when test="${type == 'deleteB'}">
		<c:if test="${midCheck == mid}">
			<a href="ctrlB.jsp?action=deleteB&bid=${bid}">삭제</a>
		</c:if>
	</c:when>
	<c:when test="${type == 'deleteR'}">
		<c:if test="${midCheck == mid}">
			<a href="ctrlB.jsp?action=deleteR&rid=${rid}">삭제</a>
		</c:if>
	</c:when>
</c:choose>