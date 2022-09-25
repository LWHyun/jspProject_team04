<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
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

   <div class="contents-inner">
      <h2 class="text-head1 text-left">고객센터</h2>
      
      <div class="aside-wrap">
         <ol class="customer-lnb">
            <li><a href="faq.jsp">FAQ</a></li>
            <li><a href="#">공지사항</a></li>
         </ol>
      </div>
      
      <div class="aside-contents" align="center">
         <div>
            <table border="1">
               <tr>
                  <td class="div2" id='delivery'>배송현황</td>
                  <td class="div2" id='refund'>교환 / 반품 / 환불</td>
                  <td class="div2" id='order'>주문 / 결제 / 취소</td>
                  <td class="div2" id='afterService'>A/S</td>
                  <td class="div2" id='customerInfo'>회원정보</td>
               </tr>
            </table>
            
            <span id="contents"></span>
         </div>      
      </div>
   </div>
   
   <div id="footer">
        <jsp:include page="../main/footer.jsp"></jsp:include>
    </div><!-- footer -->


</body>
</html>