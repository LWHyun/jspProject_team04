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
	
	.custom-btn {
	  width: 130px;
	  height: 40px;
	  color: #fff;
	  border-radius: 5px;
	  padding: 10px 25px;
	  font-family: 'Lato', sans-serif;
	  font-weight: 500;
	  background: transparent;
	  cursor: pointer;
	  transition: all 0.3s ease;
	  position: relative;
	  display: inline-block;
	   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
	   7px 7px 20px 0px rgba(0,0,0,.1),
	   4px 4px 5px 0px rgba(0,0,0,.1);
	  outline: none;
	}
		.btn-close {
	  width: 130px;
	  height: 40px;
	  line-height: 42px;
	  padding: 0;
	  border: none;
	  background: rgb(255,27,0);
	background: linear-gradient(0deg, rgba(255,27,0,1) 0%, rgba(251,75,2,1) 100%);
	}
	.btn-close:hover {
	  color: #f0094a;
	  background: transparent;
	   box-shadow:none;
	}
	.btn-close:before,
	.btn-close:after{
	  content:'';
	  position:absolute;
	  top:0;
	  right:0;
	  height:2px;
	  width:0;
	  background: #f0094a;
	  box-shadow:
	   -1px -1px 5px 0px #fff,
	   7px 7px 20px 0px #0003,
	   4px 4px 5px 0px #0002;
	  transition:400ms ease all;
	}
	.btn-close:after{
	  right:inherit;
	  top:inherit;
	  left:0;
	  bottom:0;
	}
	.btn-close:hover:before,
	.btn-close:hover:after{
	  width:100%;
	  transition:800ms ease all;
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
	
	#X1 {
		border:1px white solid;
		display: inline-block;
		width: 20px;
		
		float: right;
	}
</style>
</head>
<body onload="rcs_load()">
	<h1>검색창 검색어를 입력하세요</h1>
	<hr>
	
	<div class="search_wrap">
		<div id="serach_content">
		<form action="${pageContext.request.contextPath }/category/goSearchPro.do" id="return_form" name="frm">
			<input type="text" name="searchWord" placeholder="검색어를 입력하세요" id="searchWord">
			<button type="button" class="custom-btn btn-close" id="close" onclick=chk()>검색</button>
			
		</form>
		</div>
	</div>
	
	
	<div id='container'>
    	<div id='box-left' class="box-all"><span class="box_span">최근 검색어</span>
    		<ul id="box-left-ul">
    		
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
	/* $(function() {
		$('#close').click(function() {
			$('#return_form').submit();	
		});
	}); */
	
	function chk() {
		if(frm.searchWord.value==""||frm.searchWord.value==null){
			alert("검색어를 입력해주세요");
			frm.searchWord.focus();
			return;
		}else{
			$(function() {
				$('#close').click(function() {
					$('#return_form').submit();	
				});
			});
		}
	}
	
	function rcs_load() {
		$.ajax({
			url : '${pageContext.request.contextPath}/category/findRcs.do',
			dataType : 'html',
			success : function(data) {
				$('#box-left-ul').html(data);
			}
		});
	};
	
	
	
</script>
</html>