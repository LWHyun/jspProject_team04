<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style type="text/css">
   header {
      display: block;
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
      background-color: #ee1c25;
      height: 48px;   
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

   <header>
      <div class="gnb-wrap">
         <div class="gnb-top-wrap">
            <div class="inner">
               <a href="index.jsp">
                  <img src="https://image.a-rt.com/art/system/site/202207/1658299296317.png">
               </a>
               <div class="gnb-search-wrap">
                  <form action="">
                     <input type="search" id="searchBar" >
                     <button class="material-icons" >search</button>
                  </form>
               </div>
               <div class="util-list-wrap">
                  <ul class="util-list">
                     <li>
                        <a href="#" class="material-symbols-outlined">login</a>
                        <a href="#" style="font-size: 10px;">LOGIN</a>
                     </li>
                     <li>
                        <a href="#" class="material-symbols-outlined">person</a>
                        <a href="#" style="font-size: 10px;">JOIN</a>
                     </li>
                     <li>
                        <a href="#" class="material-symbols-outlined">shopping_cart</a>
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
                     <li>
                        <a href="#" style="color: #ffe100;">BRAND</a>
                     </li>
                     <li>
                        <a href="#">MEN</a>
                     </li>
                     <li>
                        <a href="#">WOMEN</a>
                     </li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
      
   </header>