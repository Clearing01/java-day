<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 미리보기</title>
</head>
<body>

<!-- 
1. 화면 깜빡임(C 방문) 없이 DB 데이터가 필요하면 -> .ajax() == 비동기 처리
2. 화면 깜빡임(C 방문) 없이 어떤 기능을 수행해야할 때 -> JS == 프론트
 -->
 
<input type="file" onchange="loadFile(this);">
<hr>
<img alt="미리보기" id="preview" />

<script type="text/javascript">
	function loadFile(input){
		if(input.files && input.files[0]){
			var fr = new FileReader();
			fr.onload = function(event){
				document.getElementById('preview').src = event.target.result;
			}
			fr.readAsDataURL(input.files[0]);
		}
		else {
			document.getElementById('preview').src = "";
		}
	} 
</script> 

</body>
</html>