<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
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
		  flex: 1;
		}
		#box-center {
		  
		  flex: 1;
		}
	#box-right {
		  flex: 1;
		}
	ul{
	  list-style:none;
	  line-height: 35px;
	}
	#box-center li{
	  list-style:numbers;
	  
	}
	#box-center li:first-child{
		list-style: 
	}
	#box-center{
	  border-left:1px solid black;
	  border-right:1px solid black;
	  
	}
	.box-all{
	  padding:20px;
	 
	}
	a{
	  color:black;
	  text-decoration:none;
	}
	.box_span{
	  font-weight:bold;
	  font-size:20px;
	  
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
    	<div id='box-left' class="box-all"><span class="box_span">최근 검색어</span>
    		<ul>
    		<c:forEach var="rsc_list" items="${rsc_list }">
    			<li><a href="${pageContext.request.contextPath }/category/goSearchPro.do?searchWord=${rsc_list.rsc_word }">${rsc_list.rsc_word }</a></li>
    		</c:forEach>
    		</ul>
    	</div>
    	<div id='box-center' class="box-all"><span class="box_span">인기 검색어</span>
    		<ul>
    		<c:forEach var="list" items="${list }">
    			<li><a href="${pageContext.request.contextPath }/category/goSearchPro.do?searchWord=${list.sc_word }">${list.sc_word }</a></li>
    		</c:forEach>
    		</ul>
    	</div>
    	<div id='box-right' class="box-all"><span class="box_span">추천 검색어</span>
    		<ul>
    			<li>나이키</li>
    			<li>아디다스</li>
    		</ul>
    	</div>
	</div>
	







</body>
<script type="text/javascript">
	$(function() {
		$('#return').click(function() {
			$('#return_form').submit();	
		});
	});
</script>
</html>