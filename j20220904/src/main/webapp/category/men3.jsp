<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script type="text/javascript" src="../js/jquery.js"></script>

<%@include file="indexEx2.jsp" %>
<style type="text/css">
	
	.cate_name{
		height: 100px;
	}
	.cate_name h1{
		text-align: center;
		padding: 20px;
		padding-top:30px;
		font-size: 30px;
	}
	
	.pro_wrap{
		width: 1250px; 
   		margin-top: 20px; 
   		margin-bottom: 20px;
   		position: relative;
		left: 400px;
		
		
	}
	.pro_img{
		width: 285px;
		height: 285px;
	}
	.pro_content{
		width: 285px;
		height: 410px;
		padding: 10px;
		display: inline-block;
		
	}
	.pro_content:hover{
		border: 2px solid black;
		
	}
	.pro_content:hover .pro_buycontent{
		display: block;
		
	}
	.pro_buycontent{
		display: none;
	}
	
	.like_img{
		width: 50px;
		height: 50px;
	}
	.pro_buynow{
		width: 150px;
		height: 50px;
		background-color: black;
		color: white;
		float: right;
		
	}
	.pro_brand{
		font-weight: bold;
		font-size: 20px;
	}
	.pro_price{
		font-weight: bold;
		color: red;
		font-size: 18px;
		fon
	}
	
	
	.filter{
		width: 270px;
		height: 680px; 
   		margin-top: 30px; 
   		border: 1px solid #A6A6A6; 
   		display: inline-block;
   		position: absolute;
   		left: 5%;
   		font-size: 20px;
   		font-weight: bold;
	}
   .dropdown{
   		margin-bottom:15px; 
   		border-bottom: 2px solid black;
   		border-collapse: collapse;
   		line-height: 50px;
   		padding-left: 20px;
	}
   
	.dropdown_content{
	  z-index : 1; /*다른 요소들보다 앞에 배치*/
	  display : none;
	  padding-left: 20px;
	  
	}
	
	.dropdown:hover .dropdown_content {
		display: block;
		
	}

</style>
<script type="text/javascript">
	function like() {
		$('.like_img').click(function() {
			$(this).attr('src','../img/contexts/heart0.png');
		});
		$('.like_img').dblclick(function() {
			$(this).attr('src','../img/contexts/heart1.png');
		})
	}
	function buynow() {
		
	}
	
</script>
</head>
<body>

	<div class="cate_name">
		<h1>${result }</h1><br>
		<hr>
	</div>

	<div class="filter">
	<h1 style="font-weight: bold; font-size: 30px; text-align: center;">FILTER</h1>
	<hr>
	<form action="#">
	   	<div class="dropdown">
	   		<span>브랜드</span>
		   	<div class="dropdown_content">
		   		<ul>
		   			<li><label for="chkbox_brand">나이키</label><input type="checkbox" name="chkbox_brand" value="nike"></li>
		   			<li><label for="chkbox_brand">아디다스</label><input type="checkbox" name="chkbox_brand" value="adidas"></li>
		   		</ul>
	   		</div>
	   	</div>
	
	   	<div class="dropdown">
	   		<span>사이즈</span>
		   	<div class="dropdown_content">
		   		<ul>
		   			<li><label for="chkbox_size">260</label><input type="checkbox" name="chkbox_size" value="260"></li>
		   			<li><label for="chkbox_size">260</label><input type="checkbox" name="chkbox_size" value="270"></li>		   			
		   		</ul>
	   		</div>
	   	</div>
	
	   	<div class="dropdown">
	   		<span>가격</span>
		   	<div class="dropdown_content">
				<ul>
					<li><a href="#">260</a></li>
					<li><a>270</a></li>
				</ul>
			</div>
		</div>
		<input type="submit" value="검색">
		</form>
	</div>
   
	<div class="pro_wrap">
		<ul> 
		<c:forEach var="list" items="${list }">
			<li class="pro_content">
			<div>
				<img alt="상품이미지" src="../img/contexts/nike_waffle01.jpg" class="pro_img"><br>
				<span class="pro_brand">${list.brand }</span><br>
				<span class="pro_model">${list.kor_name }</span><br>
				<span class="pro_price">${list.price }</span><br>
				<hr>
				<div class="pro_buycontent">
					<img class="like_img" alt="하트이미지" src="../img/contexts/heart1.png" onclick="like()">
					<button onclick="buynow()" class="pro_buynow">바로구매</button>
					<input type="hidden" name="">
				</div>
			</div>
			</li>
		</c:forEach>
			
		</ul>
	</div>
	

	
	
</body>
</html>