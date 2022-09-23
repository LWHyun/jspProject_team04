<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"/>
<style>
      html,
      body {
        position : relative;
        height: 60%;
        
        
      }

      .swiper mySwiper {
        
        font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
        font-size: 14px;
        color: #000;
        margin-top: 0;
        margin-bottom: 0;
        margin-right:30px;
        margin-left:30px;
        padding: 0;
      }

	/* 	.swiper-container{
			margin : 0 auto;
			position : relative;
			overflow : hidden;
			list-style : none;
			padding : 0;
			z-index : 1; }
		 */

      .swiper {
        width: 100%;
        height: 100%;
      }

      .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;

        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
      }

      .swiper-slide img {
        display: block;
        width: 100%;
        height: 430px;
        object-fit: cover;
      }
 </style>
</head>
<body>
<div class="swiper mySwiper">
      <div class="swiper-wrapper">
        <div class="swiper-slide"><img alt="Adidas" src="https://image.a-rt.com/art/product/brand/202208/1659998420963.jpg"></div> 
        <div class="swiper-slide"><img alt="Birkenstock" src="https://helios.production.bsd.coremedia.cloud/resource/image/923608/4x1/1600/400/942e9b821dff350ec343a3fd5e8406b7/E96C4B54BA4C74DBDB11F4E611626A00/musthave-vegan.jpg"></div>
        <div class="swiper-slide"><img alt="Converse" src="https://image.a-rt.com/art/product/brand/202208/1659408277002.jpg"></div>
        <div class="swiper-slide"><img alt="Dr.Martens" src="https://image.a-rt.com/art/product/brand/202206/1655686417012.jpg"></div>
        <div class="swiper-slide"><img alt="Fila" src="https://image.a-rt.com/art/product/brand/202205/1653433656019.jpg"></div>
        <div class="swiper-slide"><img alt="Lacoste" src="https://image.a-rt.com/art/product/brand/202202/1644302483326.jpg"></div>
        <div class="swiper-slide"><img alt="Nike" src="https://image.a-rt.com/art/product/brand/202201/1643069925158.jpg"></div> 
      </div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
</div>
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
	
	 <script>
      var swiper = new Swiper(".mySwiper", {
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
        autoplay:{
        	delay : 4000,
        	disableOnInteraction:false,
        },
        loop : true,
        loopAdditionalSlides : 1,
        
        
        
      });
    </script>

<div class="brand-prod-wrap">
	



</div>



</body>
</html>