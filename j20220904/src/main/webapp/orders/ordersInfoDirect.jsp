<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문정보</title>
<style type="text/css">

	.order-basket {
						display : block;
			
	}
	.order-wrap, .order-info {
					margin-top: 79px;
				    padding-left: 150px;
				    padding-right: 150px
				}
				
	.order-title {
			
		font-size : 32px;
		font-weight : bold;
	
	}
	
	.basketbtn{
		float : right;
	}
	
	.basketbtn, .chkBtn, .postBtn{
		background-color: black;
		color : white;
		padding : 0, 12px;
	}
	
	/* textbox들 크기 조절 */
	
	#buyername, #buyerphone, #buyermail {
		width : 300px;
		height : 30px;
		font-size : 16px;
	}
	
	#receiver_name, #receiver_phone, #address, #detailAddress, #forWrite {
		
		width : 300px;
		height : 30px;
		font-size : 16px;
	
	}
	
	.all_address, .receiver_phone, .receiver_name {
		vertical-align: center;
	} 
	

	#selectMessage {
		width : 250px;
		height : 30px;
		font-size : 13px;
	}

	#postcode {
		
		width : 195px;
		height : 30px;
		font-size : 16px;
		margin-top: 17px;
		margin-bottom: 3px;
	
	}
	
	#address {
		margin-bottom : 3px;
	}
	.order-body, .cal-tbl {	
								/* width : 1200px;
								margin-top : 30px;
								margin-bottom : 30px;
								border-top: 2px solid black;
								border-bottom: 1px solid black;	 */
								
								width : 100%;
								margin-top : 30px;
								margin-bottom : 30px;
								border-top: 2px solid black;
								border-bottom: 1px solid black;	
							}
					
	.order-user, .ship-info, .agree-info {
		font-size: 18px;
		font-weight: bold;
		margin-bottom : 10px;
	}				
	.buyer-name, .buyer-phone, .buyer-email{
		
		padding : 20px;
		text-align: center;
		vertical-align: middle;
	}
	
	.price-cal {
		text-align: center;
	}
	
	.tbl-form {
		margin-top : 15px;
		margin-bottom : 15px;
	}
	
	.order-ship {
		margin-bottom : 15px;
	}
	
	.order_info_title {
	
		font-size: 20px;
		font-weight: bold;
	}
	
	.order-basket td, .cal-tbl td, .tbl-form td, .tbl-ship th, .tbl-ship td .tbl-agree td{
			padding : 20px;
			vertical-align: middle;
			
		}
		
	.tbl-ship, .tbl-agree {
		margin-top : 15px;
	}
		
	.basketbtn, 	
	
	.all_ul {
		list-style: none;
		
	}
	
	.all_li {
		float : left;
		margin-right: 30px;
	}
	
	.choose_li{
		float : left;
		margin-top : 17px;
		margin-right : 10px;
	}
	
	.ship-req {
		margin-top: 20px;
		margin-bottom : 20px;
	}
	
	#receiver_name, #receiver_phone {
		margin-top : 12px;
	}
	
	.tbl-form, .tbl-ship, .tbl-agree {
			border-top : 2px solid black;
			border-bottom: 1px solid #E6E6E6;
	} 
	
	.agree_info {
		margin-top: 10px;
	}
	
	.agree_title {
		vertical-align: middle;
		padding : 20px;
	}
	
	.agree_contents {
		padding : 20px;
		/* display : none; */
	}
	/* .forWrite { display : none;} */
	
	
	.must {
		color: red;
	}
	
	.cal_title{
		font-size: 20px;
		font-weight: bold;
	}
	
	.totalArr {
		font-size : 17px;
	}
	
	.order-payment-box {
	
	top : 700px;
    width: 400px;
    margin-right : 300px;
    margin-top : 30px;
    float : right;
    padding: 26px;
    border: 4px solid #000;
    background: #fff;
    right: 0;
    z-index: 1
	}
	/* 
	summary {
    cursor: pointer;
     list-style: none;
     padding : 20px;
  }

 
  summary::-webkit-details-marker {
    display: none;
  }
   */
	
</style>
<script type="text/javascript">
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

           /*  // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
               document.getElementById("detailAddress").value = extraAddr;
            console.log(extraAddr);
            } else {
                document.getElementById("detailAddress").value = '';
            } */

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
        }
    }).open();
     
}
</script>
</head>
<body>
	<div>
		<jsp:include page="../main/header.jsp"></jsp:include>
	</div>
	
	<form id="ordersForm">
	<div class="order-wrap">
 		<span class="order-title">주문정보</span>
 			<div class="go-back-basket">
 				<input type="button" value="주문정보수정" class="basketbtn" onclick="history.back();">
 			</div>
 			
 			<div class="order-basket">
					<!-- 장바구니에서 바로구매 넘어왔을 때 -->
					<div>
						<input type="hidden" value="${ordersDTO.product_id }" id="product_id" name="product_id">
						<input type="hidden" value="${ordersDTO.size_num }" id="size_num" name="size_num">
						<input type="hidden" value="${ordersDTO.cnt }" id="cnt" name="cnt">
						<input type="hidden" name="order_price" id="order_price" value="${ordersDTO.price * ordersDTO.cnt }">
					</div>
					<table class="order-body">
								
								
								<tr id="tr${ordersDTO.product_id }_${ordersDTO.size_num }">
									<td class="pd_img">
										<a href="${pageContext.request.contextPath }/contents/contents_men.do?product_id=${ordersDTO.product_id }&gender=${ordersDTO.gender}">
											<img src="${ordersDTO.s_file_path }" width="100px" style="display : block; margin:0 auto;">
										</a>
									</td>
									
									<td class="item_info"><span class="item-name">${ordersDTO.kor_name}</span><br><br><span>${ordersDTO.pd_size} <br></span><span class="item-color">${ordersDTO.color }</span></td>
									<td><input type="hidden" value="${ordersDTO.price }" name="item_price" id="price${ordersDTO.product_id}_${ordersDTO.size_num}">
										<input type="text"  readonly="readonly" value="${ordersDTO.cnt }" name="item_cnt" id="cnt${ordersDTO.product_id }_${ordersDTO.size_num}" min="1" max="99" style="width:15px;"></td>
									
									<td id="sum${ordersDTO.product_id }_${ordersDTO.size_num}" class="sumProduct">${ordersDTO.price * ordersDTO.cnt }원</td>
								</tr>
						
					</table>
 			</div>	
 				<div class="price-cal">
						<table class="cal-tbl">
							<tr class="cal_title"><td>결제 예정 금액</td></tr>
							<tr><td>${ordersDTO.price * ordersDTO.cnt }원</td></tr>
						</table>
					</div>
				</div>
				
				<!-- 여기부터 주문 정보 디테일 -->
				
				<div class="order-info">
						
						<div class="order-payment-box" id="orderPaymentBox">
							<div class="order_info_title">결제 정보</div><br><br>
							<ul class="all_ul">
								<li class="totalArr"></li><br><br>
								<li>배송비 : 무료</li><br><br>
								<li>총 결제예정금액 : </li><br><br>
								<li><input type="button" value="결제하기" id="chkBtn" class="chkBtn" onclick="requestPay()">
							</ul>
						</div>
						
						
				<div class="order-form">
						<span class="order-user">주문 고객정보</span>
						<label><input type="checkbox" id="memChkBox"> 회원 정보와 동일</label>
						<table class="tbl-form">
							<tbody>
								<tr>
									<th class="buyer-name">
											이름
									</th>
									<td>
										<div class="input-wrap" style="width: 500px;">
											 <input type="text" required="required" id="buyername" name="buyername" required> <!-- placeholder -->
										</div>
									</td>
								</tr>
								<tr>
									<th class="buyer-phone">
											휴대폰번호
									</th>
									<td>
										<div class="input-wrap" style="width: 500px;">
											 <input type="text" required="required" id="buyerphone" name="buyerphone" required> <!-- placeholder -->
										</div>
									</td>
								</tr>
								<tr>
									<th class="buyer-email">
											이메일
									</th>
									<td>
										<div class="input-wrap" style="width: 500px;">
											 <input type="text" required="required" id="buyermail" name="buyermail" required> <!-- placeholder -->
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<span class="ship-info">배송 정보</span>
						<div class="order-ship">
							<table class="tbl-ship">
								<colgroup>
									<col style="width: 165px;">
									<col>
								</colgroup>
								<tbody>
								<tr>
									<th>
											배송지 선택
									</th>
									<td>
										<div class="choose-wrap" style="width: 500px;">
											<ul class="all_ul">
												<li class="choose_li">
											 		<input type="radio" name="choose-one" id="origin-addr"> 기본 배송지
												</li>
												
												<li class="choose_li">
													<input type="radio" name="choose-one" id="new-addr" checked="checked"> 신규 입력
												</li>
											</ul>
										</div>
									</td>
								</tr>
								<tr>
									<th>
										이름
									</th>
									<td>
										<div class="input-wrap1" style="width: 500px;">
											 <input type="text" required="required" id="receiver_name" name="receiver_name" required> <!-- placeholder -->
										</div>
									</td>
								</tr>
								<tr>
									<th>
											휴대폰번호
									</th>
									<td>
										<div class="input-wrap1" style="width: 500px;">
											 <input type="text" required="required" id="receiver_phone" name="receiver_phone" required> <!-- placeholder -->
										</div>
									</td>
								</tr>
								
								<tr>
									<th>
											주소
									</th>
									<td>
										
											<input type="text" id="postcode" name="postcode" placeholder="우편번호" required>
											<input type="button" class="postBtn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
											<input type="text" id="address" name="address" placeholder="주소" required><br>
											<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소" required>
										
									</td>
								</tr>
								<tr>
									<th class="ship-req">
											배송시 요청사항
									</th>
									<td>
										<div class="ship-req" style="width: 500px;">
											<select class="message" id="selectMessage" name="msgList">
												<option value="security">부재 시 경비실에 맡겨주세요</option>
												<option value="door">부재 시 문 앞에 놓아주세요</option>
												<option value="call">배송 전에 연락 주세요</option>
												<option value="direct">직접 수령하겠습니다</option>
												<option value="write">직접 입력</option>
											</select><br><br>
											
											<div class="forWrite">
												<input type="text" id="forWrite" name="forWrite" class="direct-msg" placeholder="배송 메시지는 40자내로 입력해주세요" disabled>
											</div>
											
										</div>
									</td>
								</tr>
							</table>
						</div>
						
							<div>
								<span class="agree-info">주문동의</span>
								<table class="tbl-agree" id="agree">
									<tr>
										<td class="agree_title" id="ag_title" > <input type="checkbox" name="checkAgree" id="checkAgree" value="주문 내역에 대한 동의" required> <span class="must">[필수]</span> 주문 내역에 대한 동의</td>
									</tr>
									<tr>
										<td class="agree_contents" id="ag_ct"> 주문하는 상품, 가격, 배송정보, 할인내역 등을 최종 확인 하였으며, 구매에 동의합니다.<br><br>
										 (전자상거래법 제 8조 제2항)</td>
									</tr>
								</table>
							
							</div>
					
					</div>	 <!-- orderinfo div 끝 -->			
				</div>
			</form>
				
	<div id="footer">
		<jsp:include page="../main/footer.jsp"></jsp:include>
  	</div>
				
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath }/js/memberJs/daumAPI.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	

// 화면 로딩될때 가격 계산도 해줘
	$(function(){
		calcTotal()
	})
	
	
	
	function calcTotal() {
	
		// 모든 소계를 가져와야함
		let targetSumArr = document.getElementsByClassName("sumProduct")
		
		// 모든 소계 합산
		let result = 0;
		for ( let i = 0 ; i < targetSumArr.length ; i++){
			let str = targetSumArr[i].innerHTML
			result += parseInt(str.substring(0,str.length-1))
		}
		// 합산 가격 반영
		
		let totalArr = document.getElementsByClassName("totalArr")
		for (let i = 0; i < totalArr.length; i++){
			totalArr[i].innerHTML = result+"원"
		}
	 	
	}


	// 체크박스 이벤트리스너
	$(document).ready(function(){
		$("#memChkBox").change(function(){
			if($("#memChkBox").is(":checked")){

			$('#buyername').val('${members.mem_name}');
			$('#buyerphone').val('${members.mem_tel}');
			$('#buyermail').val('${members.mem_email1}'+'@'+'${members.mem_email2}');
			
		} else {
			
			$('#buyername').val('');
			$('#buyerphone').val('');
			$('#buyermail').val('');
			
		}
			
		});
		
	});
	
	// 가져온 member정보 radio 체크에 따라 보여주기
	$(document).ready(function(){
        $("#origin-addr").change(function(){
           if($("#origin-addr").is(":checked")){

           $('#receiver_name').val('${members.mem_name}');
           $('#receiver_phone').val('${members.mem_tel}');
           $('#postcode').val('${members.mem_zipcode}');
           $('#address').val('${members.mem_addr1}');
           $('#detailAddress').val('${members.mem_addr2}');
           
           }
        });
			
    
       $("#new-addr").change(function(){
       	  if($("#new-addr").is(":checked")){
      	 
           $('#receiver_name').val(null);
           $('#receiver_phone').val(null);
           $('#postcode').val(null);
           $('#address').val(null);
           $('#detailAddress').val(null);

    	         }
        
           });
           
       $('#selectMessage').change(function(){
   		let value = $('#selectMessage option:selected').val();
   		console.log(value);
   		if (value == 'write') {
   			$('#forWrite').attr("disabled", false);
   		} else {
   			$('#forWrite').attr("disabled", true);
   		}
   		
   	});
   	
        });
	
	
	function valid() {
	   	 
	   	 console.log(111);
	   	 
	   	 if(!$('#buyername').val()){
	   	 	alert('주문고객 정보 - 이름을 입력해주세요');
	   	 	$('#buyername').focus();
	    		return false;
	    	}
	    	
	  		if(!$('#buyerphone').val()){
	       	alert('주문고객 정보 - 휴대폰 번호를 입력해주세요');
	      	 	$('#buyerphone').focus();
	       	return false;
	       }
	   	 
	    	if(!$('#buyermail').val()){
	    		alert('주문고객 정보 - 이메일을 입력해주세요');
	   	 	$('#buyermail').focus();
	    		return false;
	    	}
	    	
	    
	    	if(!$('#receiver_name').val()){
	    		alert('배송 정보 - 이름을 입력해주세요');
	   	 	$('#receiver_name').focus();
	    		return false;
	    	}
	    	
	    	if(!$('#receiver_phone').val()){
	    		alert('배송 정보 - 휴대폰 번호를 입력해주세요');
	   	 	$('#receiver_phone').focus();
	    		return false;
	    	}
	    	
	    	if(!$('#postcode').val()){
	    		alert('배송 정보 - 우편번호를 입력해주세요');
	   	 	$('#postcode').focus();
	    		return false;
	    	}
	    	
	    	if(!$('#address').val()){
	    		alert('배송 정보 - 주소를 입력해주세요');
	   	 	$('#address').focus();
	    		return false;
	    	}
	    	
	    	if(!$('#detailAddress').val()){
	    		alert('배송 정보 - 상세주소를 입력해주세요');
	   	 	$('#detailAddress').focus();
	    		return false;
	    	}
	    	
	    	if(!$('#checkAgree').is(':checked')){
	    		alert('주문내역에 대한 동의가 필요합니다.');
	   	 	$('#checkAgree').focus();
	    		return false;
	    	}
	    	
	    	return true;
	   	 
	    }
	
	
	function requestPay() {
		
		if(!valid()) {
	   		return false;
	   	}
		
		let buyer = $('#buyername').val();
		
        //var IMP = window.IMP; // 생략가능
        IMP.init('imp71553354');
        // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
        IMP.request_pay({
            //pg: 'inicis', // version 1.1.0부터 지원.
            pg: 'html5_inicis',
            /*
            'kakao':카카오페이,
            html5_inicis':이니시스(웹표준결제)
            'nice':나이스페이
            'jtnet':제이티넷
            'uplus':LG유플러스
            'danal':다날
            'payco':페이코
            'syrup':시럽페이
            'paypal':페이팔
            */
            pay_method: 'card',
            /*
            'samsung':삼성페이,
            'card':신용카드,
            'trans':실시간계좌이체,
            'vbank':가상계좌,
            'phone':휴대폰소액결제
            */
            merchant_uid: 'merchant_' + new Date().getTime(),
            /*
            merchant_uid에 경우
            https://docs.iamport.kr/implementation/payment
            위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
            참고하세요.
            나중에 포스팅 해볼게요.
            */
            name: '주문명:결제테스트',
            //결제창에서 보여질 이름
            amount: parseInt($('.totalArr').html()),
            //가격
            buyer_email: 'abcMartek@siot.do',
            buyer_name: buyer, //구매자 이름
            buyer_tel: '010-7586-5945',
            buyer_addr: '경기도 의정부시 신곡동',
            buyer_postcode: '123-456',
            /*
            모바일 결제시,
            결제가 끝나고 랜딩되는 URL을 지정
            (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
            */
        }, function (rsp) {
            console.log(rsp);
             if (rsp.success) {
               $.ajax({
                  url: "${pageContext.request.contextPath}/orders/insertOrdList.do", //가맹점 서버
                    method: "POST",
                    /*headers: { "Content-Type": "application/text" },*/
                    data: $('#ordersForm').serialize(),
                    dataType: 'text',
                    success: function(data){
                       //var msg1 = '결제가 완료되었습니다.';
                        //msg1 += '고유ID : ' + rsp.imp_uid;
                        //msg1 += '상점 거래ID : ' + rsp.merchant_uid;
                        //msg1 += '결제 금액 : ' + rsp.paid_amount;
                        //msg1 += '구매자 이름 :' + rsp.buyer_name;
                        //msg += '카드 승인번호 : ' + rsp.apply_num;
                        //msg1 += '구매자'+ rsp.buyer_name + '님의';
                        alert('구매자 '+ rsp.buyer_name + '님의 결제가 완료되었습니다.');
                        location.href="${pageContext.request.contextPath}/orders/goToOrderComplete.do";
                      },
                      error: function(err){
                         var msg2 = '결제에 실패하였습니다.';
                         alert(msg2);
                      }
                      
                  });
             } else if(rsp.fail) {
            	 alert('결제에 실패하였습니다.');
            	 
             }
        })
    };
	
	
</script>
</html>