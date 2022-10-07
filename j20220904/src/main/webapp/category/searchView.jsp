<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script type="text/javascript" src="../js/jquery.js"></script>
<jsp:include page="../main/header.jsp"></jsp:include>
<style type="text/css">
	.wrapper{
		height : 1800px;
		width : 100%;
		position: relative;
	}
	a{
		color: black;
		text-decoration: none;
	}
	.nameResult{
		font-weight: 700;
		font-size: 38px;
	}
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
	#btn_search{
		float:right;
	}

</style>
<script type="text/javascript">
	/* function like() {
		$('.like_img').click(function() {
			$(this).attr('src','../img/contexts/heart0.png');
		});
		$('.like_img').dblclick(function() {
			$(this).attr('src','../img/contexts/heart1.png');
		})
	} */
	
	
	$(function() {
		$(".pro_buynow").click(function() {
			confirm('바로 구매하시겠습니까?');
			location.href="#"; /* 바로구매창 이동 */
		});
	});
	
	
	$(function () {
		
		var imageName = ["heart0","heart1"];
		
		$(".like_img").click(function() {
			var num =$(this).attr('alt');
			var product_id = $(this).attr('id');
			console.log(num);
			console.log(product_id);
			if(num == 1) {
				//num=0;
				$(this).attr('alt','0');
				$.ajax({
					url:  '${pageContext.request.contextPath}/contents/deleteLike.do',
					type: 'get',
					data: {
							'product_id' : product_id ,
							'mem_id' :  '${sessionScope.mem_id}'
					      },
						
					dataType: 'text',
					success : function(data){
						console.log('data='+data);
						if(data == '1') {	
							alert('찜한 상품이 삭제되었습니다');
						}else {
							alert('로그인후 찜한 상품을 담을수 있습니다');
							location.href="${pageContext.request.contextPath}/member/loginForm.do?toURI=${toURI}";
						}
					},
					error: function(err){
						console.log(err);
					}
				});	
				
			}else 	     {
				//num++;
				$(this).attr('alt','1');
				$.ajax({
					url: '${pageContext.request.contextPath}/contents/insertLike.do',
					type: 'get',
					data: {
							'product_id' : product_id,
							'mem_id' :  '${sessionScope.mem_id}'
						  },
					dataType: 'text',
					success : function(data){
						console.log('data='+data);
						if(data == '1') {
							alert('찜한 상품이 등록되었습니다');
						}else {
							alert('로그인후 찜한 상품을 담을수 있습니다');
							
							location.href="${pageContext.request.contextPath}/member/loginForm.do?toURI=${toURI}";
						}
					},
					error: function(err){
						console.log(err);
					}
				});	
				
			
			}
			$(this).attr("src","/j20220904/img/contexts/"+ imageName[num]+".png");
		});
	});	
	
	
	//필터기능
	function searchFilter() {
		if($('input[name="radio_size"]').is(':checked')==false&&$('input[name="chkbox_brand"]').is(':checked')==false){			
			alert("체크해주세요");
		}else{
			var ca_code = 0;
			var brandArray = [];
			var searchBar = '${searchBar}';
			var ca_code ='${ca_code}';
			
			
			
			var size = $('input[name="radio_size"]:checked').val();
			$('input[name="chkbox_brand"]:checked').each(function(){//체크된 리스트 저장
	            brandArray.push($(this).val());
	        });
			console.log(size);
			console.log(brandArray);
				if(searchBar ==""){
					$.ajax({
						url : '${pageContext.request.contextPath}/category/findFilter.do',
						data : {'brandArray' : brandArray,
								'size' : size,
								'ca_code' : ca_code},
						traditional : true,
						dataType : 'html',
						success : function(data) {
							console.log(data);
							alert(data);
							$('.pro_inner').html(data);
						}
					});	
				}else if(ca_code ==""){
					$.ajax({
						url : '${pageContext.request.contextPath}/category/findFilter.do',
						data : {'brandArray' : brandArray,
								'size' : size,
								'searchBar' : searchBar},
						traditional : true,
						dataType : 'html',
						success : function(data) {
							console.log(data);
							alert(data);
							$('.pro_inner').html(data);
						}
					});	
				}
				
				
			
			
				
		}
	}
	
	//필터 초기화 버튼 누를시 동작
	$(function() {
		$('#btn_reset').click(function() {
			location.reload();
		})
	});
	
</script>
</head>
<body>
<div class="wrapper">
	<div class="cate_name">
		<c:if test="${result ==0 }">
			<h1 class="nameResult">${searchBar } 을(를) 검색한 결과</h1><br>
		</c:if>
		<c:if test="${result ==1 }">
			<h1 class="nameResult">${ca_name }</h1>
		</c:if>
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
		   			<li><input type="checkbox" name="chkbox_brand" value="ADIDAS"><label for="chkbox_brand">아디다스</label></li>
		   			<li><input type="checkbox" name="chkbox_brand" value="BIRKENSTOCK"><label for="chkbox_brand">버켄스탁</label></li>
		   			<li><input type="checkbox" name="chkbox_brand" value="CONVERSE"><label for="chkbox_brand">컨버스</label></li>
		   			<li><input type="checkbox" name="chkbox_brand" value="DR.MARTENS"><label for="chkbox_brand">닥터마틴</label></li>
		   			<li><input type="checkbox" name="chkbox_brand" value="FILA"><label for="chkbox_brand">휠라</label></li>
		   			<li><input type="checkbox" name="chkbox_brand" value="LACOSTE"><label for="chkbox_brand">라코스테</label></li>
		   			<li><input type="checkbox" name="chkbox_brand" value="NIKE"><label for="chkbox_brand">나이키</label></li>
		   		</ul>
	   		</div>
	   	</div>
	
	   	<div class="dropdown">
	   		<span>사이즈</span>
		   	<div class="dropdown_content">
		   		<ul>
		   			<li><input type="radio" name="radio_size" value="220"><label for="chkbox_size">220</label></li>
		   			<li><input type="radio" name="radio_size" value="230"><label for="chkbox_size">230</label></li>
		   			<li><input type="radio" name="radio_size" value="240"><label for="chkbox_size">240</label></li>
		   			<li><input type="radio" name="radio_size" value="250"><label for="chkbox_size">250</label></li>
		   			<li><input type="radio" name="radio_size" value="260"><label for="chkbox_size">260</label></li>
		   			<li><input type="radio" name="radio_size" value="270"><label for="chkbox_size">270</label></li>		   			
		   			<li><input type="radio" name="radio_size" value="280"><label for="chkbox_size">280</label></li>		   			
		   			<li><input type="radio" name="radio_size" value="290"><label for="chkbox_size">290</label></li>		   			
		   		</ul>
	   		</div>
	   	</div>
	
		<button type="reset" id="btn_reset" class="custom-btn btn-close">초기화</button>
		<button type="button" id="btn_search" class="custom-btn btn-close" onclick="searchFilter()">검색하기</button>
		</form>
	</div>

	<div class="pro_wrap">
		<ul class="pro_inner"> 
			<c:forEach var="list" items="${list }">
			<li class="pro_content">
				<div>
					<a href="${pageContext.request.contextPath}/contents/contents_men.do?product_id=${list.product_id}&&gender=${list.gender}">
					<img alt="상품이미지" src="${list.s_file_path }" class="pro_img"><br>
					<span class="pro_brand">${list.brand }</span><br>
					<span class="pro_model">${list.kor_name }</span><br>
					<span class="pro_price">${list.price }</span><span>원</span><br>
					</a>
					<hr>
					<div class="pro_buycontent">
					<c:choose>
						<c:when test="${list.like_product_id > 0 }">
							<img class="like_img" alt="1"   src="../img/contexts/heart0.png" id="${list.product_id }">
						</c:when>
						<c:otherwise>
							<img class="like_img" alt="0"  src="../img/contexts/heart1.png" id="${list.product_id }">
						</c:otherwise>
					</c:choose>
						<button type="button" class="pro_buynow">바로구매</button>
					</div>
				</div>
			</li>
			</c:forEach>
			
		</ul>
	</div>
	
</div>
<jsp:include page="../main/footer.jsp"></jsp:include>
	
</body>
</html>