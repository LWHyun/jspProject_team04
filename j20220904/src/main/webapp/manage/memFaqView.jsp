<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	span {
		font: bold;
	}
	.wrap .contents-wrap .contents-aside .aside-contents {
	    width: calc(100% - 220px);
	}
	
	/* ============= FAQ  =============  */
	/* 고객센터 */
	.contents-inner .page-title-wrap {
		margin-top: 18px;
	}
	
	/* 고객센터 아랫부분 */
	.contents-wrap .page-title-wrap+.contents-inner.contents-aside {
	    margin-top: 50px;
	}
	
	/* 왼쪽 선택창 (공지사항, FAQ) */
	.wrap .contents-wrap .contents-aside .aside-wrap {
	    width: 220px;
	    padding-right: 60px;
	}
	
	.customer-wrap .customer-lnb {
	    -webkit-transform: translateY(-1px);
	    transform: translateY(-1px);
	}
	
	.customer-wrap .customer-lnb .customer-lnb-item.eng a {
		font-family: "Montserrat", sans-serif;
		font-weight: 600;
		color:red;
		text-decoration:underline !important;	
		letter-spacing: 0;
	}
	
	.customer-wrap .customer-lnb .customer-lnb-item+.customer-lnb-item {
	    margin-top: 25px;
	}
	
	
	/* 중앙화면 */
	.aside-contents {
	    margin-top: -118px;
	    width: calc(95% - 206px);
	    transform: translate(59px, 42px);
}
	.text-head2.eng, .text-head2 .eng {
	    font-family: "Montserrat",sans-serif;
	    letter-spacing: 0;
	}
	
	body .tab-wrap.multi-line {
	    font-size: 14px;
	}
	.tbl-search-wrap+.tbl-prod-wrap, .tbl-search-wrap+.tab-wrap {
	    margin-top: 40px;
	}
	body .tab-wrap {
		margin: 0 auto;
	    padding: 46px;
	}
	
	body .tab-wrap.multi-line .tabs {
	    padding: 0;
	    display: -webkit-box;
	    display: -ms-flexbox;
	    display: -webkit-box;
	    display: -ms-flexbox;
	    display: flex;
	    display: -webkit-flex;
	    -webkit-box-pack: start;
	    -ms-flex-pack: start;
	    justify-content: flex-start;
	    -ms-flex-wrap: wrap;
	    /* flex-wrap: wrap; */
	    -webkit-transform: translateX(1px);
	    transform: translateX(138px);
	}
	body .tab-wrap .tabs {
	    margin-bottom: -25px;
	}
	body .tab-wrap.multi-line .tabs .tab-item {
	    color: #666;
	    height: 20px;
	    margin: 0 0 0 -1px;
	    padding: 20px 0;
	    border: 1px solid #d5d5d5;
	    flex-grow: 0;
	    flex-shrink: 1;
	    flex-basis: calc(100%- 1px);
	    -webkit-flex: 0 1 calc(99% /5 + 1px);
	    font-size: 20px;
	    letter-spacing: -1.35px;
	    -webkit-transition: all .23s ease-out;
	    transition: all 0.23s ease-out;
	}
	
	.border-line-box-header {
	    position: relative;
	}
	
	
	.border-line-box-header+.border-line-box, .border-line-box-header+.mypage-detail-info-box, .border-line-box-header+.mypage-complete-wrap {
	    margin-top: 16px;
	}
	.border-line-box {
	    border-top: 2px solid #000;
	    border-bottom: 1px solid #b5b5b5;
	    transform: translateX(138px);
	}
	ol, ul {
	    list-style: none;
	}
	.border-line-box .fold-box-list .fold-box:first-child {
	    border-top: none;
	}
	.fold-box-list .fold-box {
	    border-bottom: 1px solid #d5d5d5;
	}
	.fold-box-list.faq-list .fold-box .fold-box-header {
	    padding-left: 57px;
	    display: inline-block;
	    width: 100%;
	    max-width: 100%;
	    white-space: nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    height: auto;
	    max-height: none;
	    font-size: 15px;
	    letter-spacing: -.75px;
	}
	.fold-box-list .fold-box .fold-box-header {
	    position: relative;
	    padding-right: 33px;
	    cursor: pointer;
	    font-size: 15px;
	    line-height: 70px;
	}
	.fold-box-list .fold-box .fold-box-header, .fold-box-list .fold-box .fold-box-contents {
	    padding: 0 20px;
	}
	
	.text-head1 {
		color: #000;
	    font-family: "Montserrat","Noto Sans KR",sans-serif;
	    font-size: 32px;
	    font-weight: 700;
	    margin-top: 50px;
	    margin-bottom: 50px;
	}
	
	.contents-width {
	    width: 1200px;
	    margin: 0 auto;
	}
	
	.aside-wrap {
		width: 220px;
		padding-right: 60px;
	}
	
	 .answer {
	   font-size: 20px;
	   display: none;
	   padding-bottom: 30px;
	   text-align: left;
	   margin: 5px 28px -6px 30px;
	   line-height: 25px;
	 }
	 #faq-title {
	   font-size: 25px;
	 }
	 .faq-content {
	   border-bottom: 1px solid #e0e0e0;
	   text-align: left;
	   padding-left: 10px;
	 }
	 .question {
	   font-size: 19px;
	   padding: 30px 0;
	   cursor: pointer;
	   border: 1px;
	   outline: none;
	   background: none;
	   width: 100%;
	   text-align: left;
	 }
	 .question:HOVER {
	   color: #2962ff;
	 }
	 [id$="-toggle"] {
	   margin-right: 15px;
	 }
	 
	 a {
		text-decoration: none;
		color		   : black;
	}
	
	table {
		border: 1px solid grey;
		border-collapse: collapse;
		margin-bottom: 30px;
		text-align: center;
		font-family: "Montserrat","Noto Sans KR",sans-serif;
	}
	
	td {
		border: 1px solid grey;
		border-collapse: collapse;
		width: 180px;
		height:40px;
		padding : 10px;
	}
	
	#tabDiv > ul > li:hover{
		background-color: black;
	}
	
	.text-head2 {
	    color: #000;
	    font-family: "Montserrat","Noto Sans KR",sans-serif;
	    font-weight: 800;
	    font-size: 22px;
	    letter-spacing: -1.1px;
	    transform: translateX(138px);
	}
	
	.text-head2.eng, .text-head2 .eng {
	    font-family: "Montserrat",sans-serif;
	    letter-spacing: 18px;
	}
	
	li.product-manage {
		margin : 6px 0 0 10px;
	}
</style>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
   $(function() {
      $('#delivery').click(function() {
         $.ajax({
               url : 'faqDelivery.jsp',
               dataType: 'html',
               success : function(data) {
                        $('#contents').html(data)
                     }
         })
      })
   })
   
   $(function() {
      $('#refund').click(function() {
         $.ajax({
               url : 'faqRefund.jsp',
               dataType: 'html',
               success : function(data) {
                        $('#contents').html(data)
                     }
         })
      })
   })
   
   $(function() {
      $('#order').click(function() {
         $.ajax({
               url : 'faqOrder.jsp',
               dataType: 'html',
               success : function(data) {
                        $('#contents').html(data)
                     }
         })
      })
   })
   
   $(function() {
      $('#afterService').click(function() {
         $.ajax({
               url : 'faqAfterService.jsp',
               dataType: 'html',
               success : function(data) {
                        $('#contents').html(data)
                     }
         })
      })
   })
   
  $(function() {
      $('#afterService').click(function() {
         $.ajax({
               url : 'faqAfterService.jsp',
               dataType: 'html',
               success : function(data) {
                        $('#contents').html(data)
                     }
         })
      })
   })
   
     $(function() {
      $('#customerInfo').click(function() {
         $.ajax({
               url : 'faqCustomerInfo.jsp',
               dataType: 'html',
               success : function(data) {
                        $('#contents').html(data)
                     }
         })
      })
   })
   
</script>
</head>
<body>
   <div id="header">
       <jsp:include page="../main/header.jsp"></jsp:include>
    </div><!-- header -->

   <div id="contentsWrap" class="contents-wrap">
     <div class="contents-width">
	   <div class="contents-inner">
	   
	     <!--고객센터 -->
	   	  <div class="page-title-wrap mypage">
	      	<h2 class="text-head1 text-left">고객센터</h2>
	      </div>
	      
	      <!-- 고객센터 밑 화면 -->
	      <div class="contents-inner contents-aside customer-wrap">
	      	<!-- 왼쪽 선택창 -->
	      	<div class="aside-wrap">
	         <ol class="customer-lnb">
	            <li class="customer-lnb-item"><a href="${pageContext.request.contextPath }/manage/memNoticeList.do">공지사항</a></li>
	            <li class="customer-lnb-item eng"><a href="#" class="active">FAQ</a></li>
	         </ol>
	       </div>
	     	
	      <!-- 중앙 화면 -->
	      <div class="aside-contents" align="center">
	      		<h3 class="text-head2 eng">FAQ</h3>
	      
	      		<!-- 선택 탭 -->
	      		<div class="tab-wrap anchor-tab multi-line" id="tabDiv">
					<ul class="tabs">
							<li class="tab-item"><a href="javascript:void(0)" id="delivery" class="tab-link" >배송현황</a></li>
							<li class="tab-item ui-tabs-active"><a href="javascript:void(0)" id="refund" class="tab-link">교환 / 반품 / 환불</a></li>
							<li class="tab-item"><a href="javascript:void(0)" id="order" class="tab-link">주문 / 결제 / 취소</a></li>
							<li class="tab-item"><a href="javascript:void(0)" id="afterService" class="tab-link">A/S</a></li>
							<li class="tab-item"><a href="javascript:void(0)" id="customerInfo" class="tab-link">회원정보</a></li>
					</ul>
				</div>

	            <!-- <span id="contents"></span> -->
	            
	            <!-- 질문 목록 띄워주기 -->
	            <div class="border-line-box fold-box-list-wrap">
	            	<div id="contents" class="fold-box-list faq-list"></div>
	            </div>
	      </div>      
	   </div>
	</div>
	   </div>
	</div>
   <div id="footer">
        <jsp:include page="../main/footer.jsp"></jsp:include>
    </div><!-- footer -->

</body>
</html>