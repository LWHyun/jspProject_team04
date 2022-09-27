<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery.js"></script>
<style type="text/css">
	h1{
		text-align: center;
	}
	.search_wrap{
		width: 1000px;
		height: 100px;
		margin: 0 auto;
		text-align: center;
	}
	#searchWord{
		width: 200px;
		height: 50px;
	}
	#return{
		width: 50px;
		height: 50px;
	}
	
	#container {
		display: flex;
		margin:0 auto;
		width: 1000px;
	}
	#box-left {
	  background: red;
	  flex: 1;
	}
	#box-center {
	  background: orange;
	  flex: 1;
	}
	#box-right {
	  background: yellow;
	  flex: 1;
	}
</style>
</head>
<body>
	<h1>검색창 검색어를 입력하세요</h1>
	<hr>
	
	<div class="search_wrap">
		<div id="serach_content">
		<form action="${pageContext.request.contextPath }/category/goSearchPro.do" id="return_form">
			<input type="text" name="searchWord" placeholder="검색어를 입력하세요" id="searchWord">
			<input type="submit" class = material-icons id="return" value="검색">
		</form>
		</div>
	</div>
	
	
	<div id='container'>
    	<div id='box-left'>최근 검색어
    		<ul>
    			<li>나이키</li>
    			<li>아디다스</li>
    		</ul>
    	</div>
    	<div id='box-center'>인기검색어
    		<ul>
    			<li>나이키</li>
    			<li>아디다스</li>
    		</ul>
    	</div>
    	<div id='box-right'>추천 검색어
    		<ul>
    			<li>나이키</li>
    			<li>아디다스</li>
    		</ul>
    	</div>
	</div>
	







</body>
<script type="text/javascript">
	


	$(function() {
		var word = $('#searchWord').val();
		$('#return').click(function() {
			$('#return_form').submit();
			
		});
	});
</script>
</html>