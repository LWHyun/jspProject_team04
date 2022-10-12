<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<style>

.c1_slider-wrap{
}
.c1_slick-arrow{
	position: absolute; top:50%; transform:translateY(-50%);
	width: 64px; height:64px;
	color:#fff;
	border: none;
	text-indent: -9999px;
	overflow: hidden;
	cursor: pointer;
}
.c1_slick-prev{
	z-index:100;
	left:1%;
	background: url(/j20220904/img/banners/c1_prev.png) no-repeat 0 0;
}
.c1_slick-next{
	right:1%;
	background: url(/j20220904/img/banners/c1_next.png) no-repeat 0 0;
}
.slick-dots {
  bottom: 2%;
  left: 50%; 
  transform:translateX(-50%);
  list-style: none;
  text-align: end;
  position: absolute;
  padding: 0;
}

.slick-dots li {
  position: relative;
  display: inline-block;
  width: 20px;
  height: 20px;
  /*margin: 1px;*/
  padding: 0;
  cursor: pointer;
}

.slick-dots li button {
  font-size: 0;
  line-height: 0;
  display: block;
  width: 20px;
  height: 20px;
  padding: 5px;
  cursor: pointer;
  color: transparent;
  border: 0;
  outline: 0;
  background: 0 0;
}

.slick-dots li button:before {
  font-size: 2.7rem;
  line-height: 20px;
  position: absolute;
  top: 0;
  left: 0;
  width: 20px;
  height: 20px;
  content: '•';
  text-align: center;
  opacity: .75;
  color: #6D6968;
}

.slick-dots li.slick-active button:before {
  opacity: .75;
  color: #ffffff;
}
#c1_bannerimg{
	width: 100%;
	height: auto;
}
</style>
<style type="text/css">
c1_banner{
	width:100%;
	
}

.c1_bannerimg1{
	border-radius: 8px;
	width:100%;
}
.c1_banner1-1{
	display: flex;
	max-width: 1280px;
	margin: 0 auto;
}
.c1_banner:hover{
	cursor: pointer;
}
.c1_banner a{
text-decoration: none;
}

.c1_banner1{
	flex:1;
	margin:0.7%;
	width: 20%;
}
.c1_text{
  text-align: center;
}
.c1_bannerimg	{
	width:1200px;
	height: 600px;
	
	
}

 #c1_bannerimg1{
	width:1200px;
	height: 600px;
	margin-left: 260px;
}

#c1_bannerimg2{
	width:1200px;
	height: 600px;
	margin-left: 260px;
}

#c1_bannerimg3{
	width:1200px;
	height: 600px;
	margin-left: 260px;
} 


#c1_bannerimg4{
	width:1200px;
	height: 600px;
	margin-left: 260px;
}

#c1_bannerimg5	{
	width:1200px;
	height: 600px;
	margin-left: 260px;
}

#c1_bannerimg6 { 
	width:1200px;
	height: 600px;
	margin-left: 260px;
}

#c1_bannerimg7 {
	width:1200px;
	height: 600px;
	margin-left: 260px;
}
</style>

<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript">
jQuery(function(){
	 $.noConflict();
	
	 jQuery('.c1_slider-wrap').slick({
		  dots: true,
		  infinite: true,
		  speed: 500,
		  fade: true,
		  cssEase: 'linear',
		  autoplay: true,
		  prevArrow : "<button class='c1_slick-prev c1_slick-arrow'></button>",
		  nextArrow : "<button class='c1_slick-next c1_slick-arrow'></button>",
		  autoplaySpeed: 3000,
		  
	});
});
</script>
</head>
<body topmargin="0"  leftmargin="0" marginwidth="0" marginheight="0">
<div class="c1_slider-wrap" style="margin-bottom: 2%;">
    <div class="c1_banner">
    	<a href="http://localhost:8181/j20220904/category/searchView.do?searchBar=nike">
    	<video class="c1_bannerimg" id="c1_bannerimg1" data-video-id="6311232130112" data-account="72451143001" autoplay="autoplay" muted="muted" -webkit-playsinline="-webkit-playsinline" playsinline="playsinline" loop="loop">
    	<source src="https://nikevideo.nike.com/media/v1/pmp4/static/clear/72451143001/82c5ef26-9370-4d2d-82ae-9014e4f64293/81cb83ab-9f95-42b2-8159-2bd1c00f79d2/main.mp4">
     	</video>	
     	</a>
   	</div>
    <div class="c1_banner">
    	<a href="http://localhost:8181/j20220904/category/searchView.do?searchBar=adidas">
    	<video class="c1_bannerimg" id="c1_bannerimg1" data-video-id="6311232130112" data-account="72451143001" autoplay="autoplay" muted="muted" -webkit-playsinline="-webkit-playsinline" playsinline="playsinline" loop="loop">
    	<source src="https://brand.assets.adidas.com/video/upload/q_auto,vc_auto,c_scale,w_0.5/video/upload/running-4dfwd-launch-carousel-d_idily0.mp4">
     	</video>
     	</a>
    </div>
    <div class="c1_banner"><a href="http://localhost:8181/j20220904/category/searchView.do?searchBar=birkenstock"><img class="c1_bannerimg" id="c1_bannerimg3" src="/j20220904/img/banners/banner03(birkenstock).png" alt=""></a></div>
    <div class="c1_banner"><a href="http://localhost:8181/j20220904/category/searchView.do?searchBar=converse"><img class="c1_bannerimg" id="c1_bannerimg4" src="/j20220904/img/banners/banner04(converse).png" alt=""></a></div>
    <div class="c1_banner">
    	<a href="http://localhost:8181/j20220904/category/searchView.do?searchBar=lacoste">
    	<video class="c1_banner"  id="c1_bannerimg5" playsinline="true" muted="true" autoplay="true" loop="true" class="js-static-video l-block js-modular--starter-cover img-cover" width="100%" height="auto">
    	<source src="https://static1.lacoste.com/videos/marketing/Starter-Cover-Desk-Arena.mp4" type="video/mp4">
    	</video>
    	</a>
   	</div>
    <div class="c1_banner"><a href="http://localhost:8181/j20220904/category/searchView.do?searchBar=fila"><img class="c1_bannerimg" id="c1_bannerimg6" src="/j20220904/img/banners/banner06(fila).png" alt=""></a></div>
    <div class="c1_banner"><a href="http://localhost:8181/j20220904/category/searchView.do?searchBar=dr.martens"><img class="c1_bannerimg" id="c1_bannerimg7" src="/j20220904/img/banners/banner07(dr.martin).jfif" alt=""></a></div>
</div>
</body>
</html>



