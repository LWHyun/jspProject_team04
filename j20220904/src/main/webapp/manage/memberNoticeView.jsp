<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/manageCss/faq.css">
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
	            <li class="customer-lnb-item eng"><a href="notice.jsp" class="active">공지사항</a></li>
	            <li class="customer-lnb-item"><a href="faq.jsp">FAQ</a></li>
	         </ol>
	        </div>
	     	
	      <!-- 중앙 화면 -->
	      <div class="aside-contents" align="center">
	      		<h3 class="text-head2 eng">공지사항</h3>
	      
	      		<!-- 공지사항 -->
	      		<div class="tab-wrap anchor-tab multi-line" id="tabDiv">



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