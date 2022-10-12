<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style type="text/css">
   header {
      display: block;
   }
   .upperCate{
   	color: black;
   }
   .cate_select{
		width : 100%;
		height: 500px;
		/* display: flex; */
		justify-content: center;
		
	}
	.cate_div{
   		margin: 10px;
   }
   
   #cate_high{
   		font-weight: bold;
   		font-size: 40px;
   }
   
   .cate_low{
   		font-weight: bold;
   		font-size: 20px;
   		line-height: 40px;
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
   
   .gnb-wrap {
      height: 145px;
      font-family: "Montserrat","Noto Sans KR",sans-serif;
   }
   .gnb-top-wrap {
      height: 98px;
   }
   .gnb-top-wrap .inner {
      position: relative;
      display: flex;
      height: 100%;
      width: 1200px;
      text-align: center;
      margin: 0 auto;
   }
   .gnb-top-wrap .inner a {
      display: flex;
       align-items: center;
       justify-content: center;
       vertical-align: middle;
       float: left;
   }
   .gnb-top-wrap .inner .gnb-search-wrap {
       position: relative;
       width: 465px;
       margin: 0 auto;
       padding-top: 20px; 
   }
   .gnb-top-wrap .inner .gnb-search-wrap input[type=search] {
       height: 34px;
       padding: 25px 72px 15px 9px;
       border: none;
       border-bottom: 2px solid #000;
       font-size: 14px;
   }
   .gnb-top-wrap .inner .gnb-search-wrap input[type=search]:focus {
       outline: none;
   }
   .gnb-top-wrap .inner .gnb-search-wrap form {
      position: relative;
   }
   .gnb-top-wrap .inner .gnb-search-wrap form button {
      position: absolute;
      bottom: 0;
      border: 0;
      outline: 0;
      border-bottom: 2px solid #000;
      background-color: white;
   }
   .gnb-top-wrap .inner .util-list-wrap .util-list {
      margin-top: 20px;
   }
   .gnb-top-wrap .inner .util-list-wrap .util-list li {
      display: flex;
      flex-direction: column;
      float: left;
      margin: 10px;   
   }
   .gnb-top-wrap .inner .util-list-wrap .util-list li a {
      text-decoration: none;
      align-items: center;
      color: black;
   }
   .gnb-bottom-wrap {
        position: relative;
      background-color: #ee1c25;
      height: 48px;  
      min-width: 1200px; 
   }
   .gnb-bottom-wrap .inner {
      position: relative;
      display: flex;
      justify-content: center;
      width: 1200px;
      height: 100%;
      margin: 0 auto;
   }
   .gnb-bottom-wrap .inner .gnb-menu {
      float: left;
      font-size: 16px;
       font-weight: 500;
       line-height: 48px;
   }
    .gnb-bottom-wrap .inner .gnb-menu li {
      display: inline-block;
      text-align: center;
      margin: 0 70px;
   }
   .gnb-bottom-wrap .inner .gnb-menu li a {
      text-decoration: none;
      color: #fff;
   }
</style>
<c:set var="loginId" value="${empty sessionScope.mem_id ? '' : sessionScope.mem_id}"/>
<c:set var="loginOut" value="${loginId == '' ? 'LOGIN' : 'LOGOUT'}"/>
<c:set var="loginOutLink" value="${loginId == '' ? '/member/loginForm.do' : '/member/logout.do' }"/>
<c:set var="joinMy" value="${loginId == '' ? 'JOIN' : 'MY' }"/>
<c:set var="joinMyLink" value="${loginId == '' ? '/member/writeForm.do' : '/mypage/mypage.do' }"/>
   <header>
      <div class="gnb-wrap">
         <div class="gnb-top-wrap">
            <div class="inner">
               <a href="${pageContext.request.contextPath }">
                  <img src="/j20220904/img/titleLogo/sin4mall.png" width="200px" height="85px">
               </a>
              	<div class="gnb-search-wrap">
                  <form action="${pageContext.request.contextPath }/category/searchView.do" id="searchViewForm">
                     <input type="search" name="searchBar" id="searchBar" value="${searchWord }" onclick="goSearch()">
                     <button class="material-icons" id="searchButton">search</button><!-- 버튼 클릭되면 진짜 찾는걸로 -->
                  </form>
               </div>
               <div class="util-list-wrap">
                  <ul class="util-list">
                  <c:if test="${sessionScope.mem_id == 'admin' }">
                	<li>
                        <a href="${pageContext.request.contextPath }/manage/manNoticeList.do" class="material-symbols-outlined">person</a>
                        <a href="#" style="font-size: 10px;">관리자</a>
                     </li>
                  </c:if>
                     <li>
                        <a href="${pageContext.request.contextPath }/manage/memNoticeList.do" class="material-symbols-outlined"><img src="https://cdn-icons-png.flaticon.com/512/584/584648.png" width="24" height="24"></a>
                        <a href="#" style="font-size: 10px;">NOTICE</a>
                     </li>
                     <li>
                        <a href="${pageContext.request.contextPath }${loginOutLink }" class="material-symbols-outlined">${loginOut }</a>
                        <a href="#" style="font-size: 10px;">${loginOut }</a>
                     </li>
                     <li>
                        <a href="${pageContext.request.contextPath }${joinMyLink}" class="material-symbols-outlined">person</a>
                        <a href="#" style="font-size: 10px;">${joinMy }</a>
                     </li>
                     <li>
                        <a href="${pageContext.request.contextPath }/basket/goToBasket.do" class="material-symbols-outlined">shopping_cart</a>
                        <a href="#" style="font-size: 10px;">CART</a>
                     </li>
                  </ul>
               </div>
            </div>
         </div>
         <div class="gnb-bottom-wrap">
            <div class="inner">
               <div class="gnbMenuWrap">
                  <ul class="gnb-menu">
                     <li id="li_brand">
                        <a href="#" style="color: #ffe100;">BRAND</a>
                     </li>
                     <li id="li_men">
                       <a href="#">MEN</a>
                     </li>
                     <li id="li_women">
                        <a href="#">WOMEN</a>
                     </li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
		<div class="cate_select" style="display:none">
			<div class="cate_div">
				<h1 id="cate_high"></h1>
				<hr>
				<ul class="cate_low" id="cate_low">
					<li>로딩중</li>
				</ul>
				<button id="close" class="custom-btn btn-close">닫기</button>
			</div>
		</div>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>	
<script type="text/javascript">
function goSearch() {
	window.open('${pageContext.request.contextPath }/category/goSearch.do','_blank','width=1000px','height=1000px');
	}
	
	////남성탭 올렸을때 카테고리 메뉴 나오는 부분
	$('.gnbMenuWrap > ul > #li_men').click(function() {
		
		$.ajax({
			url : '${pageContext.request.contextPath}/category/findCate.do',
			dataType : 'html',
			data : {result : 'men'},
			success : function(data) {
				console.log(data);
				$('#cate_low').html(data);
			}
		})
		$('#cate_high').text('MEN');
		$('.cate_select').css('display', 'flex');
	});
	
	//여성탭 클릭했을때 카테고리 메뉴 나오는 부분
	$('.gnbMenuWrap > ul > #li_women').click(function() {
		
		$.ajax({
			url : '${pageContext.request.contextPath}/category/findCate.do',
			dataType : 'html',
			data : {result : 'women'},
			success : function(data) {
				console.log(data);
				$('#cate_low').html(data);
			}
		})
		$('#cate_high').text('WOMEN');
		$('.cate_select').css('display', 'flex');
	});
	
	//브랜드 탭에 올렸을때 카테고리 메뉴 나오는 부분
	$('.gnbMenuWrap > ul > #li_brand').click(function() {
		
		$.ajax({
			url : '${pageContext.request.contextPath}/category/findCate.do',
			dataType : 'html',
			data : {result : 'brand'},
			success : function(data) {
				console.log(data);
				$('#cate_low').html(data);
			}
		})
		$('#cate_high').text('BRAND');
		$('.cate_select').css('display', 'flex');
	});

//카테고리 메뉴 닫기
$('#close').click(function() {
	$('.cate_select').css('display', 'none');
})
</script>
   </header>
