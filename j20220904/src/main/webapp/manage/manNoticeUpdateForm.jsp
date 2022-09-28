<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>
<script type="text/javascript">
	if($("#checkbox").is(':checked') == true) {
		data.set("checkbox", 1);
	}
	else {
		data.set("checkbox", 0);
	}

/* 	function is_checked(obj){
		var is_checked = obj.checked;
		
		if(is_checked) {
			checkbox.value = 1;
			
		}
		else {
			checkbox.value = 0;
		}
	} */
</script>
<body>
  <form action="manNoticeUpdatePro.do" method="post">
	<input type="hidden" name="num" value="${notice.num}">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<table border="1">
		<caption><h2>게시판 수정</h2></caption>
		<tr><td>번호</td><td>${notice.notice_code}</td></tr>
		<tr><td>제목</td>
		    <td><input type="text" name="notice_title" required="required" 
		                           value="${notice.notice_title}"></td></tr>
		<tr><td>내용</td>
		    <td><pre><textarea rows="10" cols="40" name="notice_content" 
		                       required="required">${notice.notice_content}</textarea></pre></td></tr>
		                       
		<tr><td>상단 고정 여부</td>
			<td><input type="radio" name="fix" onclick="is_checked(this)"></td>
		</tr>
	</table>
	<input type="submit" value="확인" >
	<input type="reset"  value="취소">
  </form>
</body>
</html>