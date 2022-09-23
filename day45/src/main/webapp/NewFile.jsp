<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

${1 div 1} <br>
${1 mod 1} 
<hr>
${1 eq 1} ${1 ne 1} ${1 lt 3} ${1 gt -1} ${1 ge -1}
<hr>
${1>3 and 1<-1} ${1>3 or 1>-1} ${not (1>3)}
<hr>
${1>2? 1:2}

</body>
</html>