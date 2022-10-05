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
	
	.basketbtn {
		float : right;
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
					
	.order-user, .ship-info, .order-agree {
		font-size: 18px;
		font-weight: bold;
		margin-bottom : 10px;
	}				
	.buyer-name, .buyer-phone, .buyer-email{
		
		padding : 20px;
		
	}
	
	.tbl-form {
		margin-top : 15px;
		margin-bottom : 15px;
	}
	
	.order-basket td, .cal-tbl td, .tbl-form td, .tbl-ship th, .tbl-ship td{
			padding : 20px;
			vertical-align: middle;
			
		}
		
	.tbl-ship {
		margin-top : 15px;
	}
		
	
	ul {
		list-style: none;
		
	}
	
	li {
		float : left;
		margin-right: 30px;
	}
	
	.tbl-form, .tbl-ship, .agree-box {
			border-top : 2px solid black;
			border-bottom: 1px solid #E6E6E6;
	} 
	
	.order-payment-box {
	position: sticky;
	top : 500px;
    width: 400px;
    margin-right : 100px;
    margin-top : 30px;
    float : right;
    padding: 26px;
    border: 4px solid #000;
    background: #fff;
    right: 0;
    z-index: 1
	}
	
	summary {
    cursor: pointer;
     list-style: none;
     padding : 20px;
  }

 
  summary::-webkit-details-marker {
    display: none;
  }
  
	
	
	
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
	
	<div class="order-wrap">
 		<span class="order-title">주문정보</span>
 			<div class="go-back-basket">
 				<input type="button" value="주문정보수정" class="basketbtn" onclick="history.back();">
 			</div>
 			
 			<div class="order-basket">
					<!-- 장바구니에서 바로구매 넘어왔을 때 -->
					<table class="order-body">
					
								
								<tr id="tr${ordersDTO.product_id }_${ordersDTO.size_num }">
									<td class="pd_img"><img src="${ordersDTO.s_file_path }" width="100px"></td>
									
									<td class="item_info"><span class="item-name">${ordersDTO.kor_name}</span><br><br><span>${ordersDTO.pd_size} <br></span><span class="item-color">${ordersDTO.color }</span></td>
									<td><input type="hidden" value="${ordersDTO.price }" name="item_price" id="price${ordersDTO.product_id}_${ordersDTO.size_num}">
										<input type="text"  readonly="readonly" value="${ordersDTO.cnt }" name="item_cnt" id="cnt${ordersDTO.product_id }_${ordersDTO.size_num}" min="1" max="99" style="width:15px;"></td>
									
									<td id="sum${ordersDTO.product_id }_${ordersDTO.size_num}" class="sumProduct">${ordersDTO.price * ordersDTO.cnt }원</td>
								</tr>
						
					</table>
 			</div>	
 				<div class="price-cal">
						<table class="cal-tbl">
							<tr><td>결제 예정 금액</td></tr>
							<tr><td>${ordersDTO.price * ordersDTO.cnt }원</td></tr>
						</table>
					</div>
				</div>
				
				<!-- 여기부터 주문 정보 디테일 -->
				
				<div class="order-info">
						
						<div class="order-payment-box" id="orderPaymentBox">
							<h4>결제 정보 </h4><br><br>
							<ul>
								<li class="totalArr"></li><br><br>
								<li>배송비 : 무료</li><br><br>
								<li>총 결제예정금액 : </li><br><br>
								<li><input type="button" value="결제하기" onclick="">
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
											 <input type="text" required="required" id="buyername" value=""> <!-- placeholder -->
										</div>
									</td>
								</tr>
								<tr>
									<th class="buyer-phone">
											휴대폰번호
									</th>
									<td>
										<div class="input-wrap" style="width: 500px;">
											 <input type="text" required="required" id="buyerphone" value=""> <!-- placeholder -->
										</div>
									</td>
								</tr>
								<tr>
									<th class="buyer-email">
											이메일
									</th>
									<td>
										<div class="input-wrap" style="width: 500px;">
											 <input type="text" required="required" id="buyermail" value=""> <!-- placeholder -->
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
											<ul>
												<li>
											 		<input type="radio" name="choose-one" id="origin-addr"> 기본 배송지
												</li>
												<li>
													<input type="radio" name="choose-one" id="new-addr"> 신규 입력
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
											 <input type="text" required="required" id="receiver-name"> <!-- placeholder -->
										</div>
									</td>
								</tr>
								<tr>
									<th>
											휴대폰번호
									</th>
									<td>
										<div class="input-wrap1" style="width: 500px;">
											 <input type="text" required="required" id="receiver-phone"> <!-- placeholder -->
										</div>
									</td>
								</tr>
								
								<tr>
									<th>
											주소
									</th>
									<td>
										
											<input type="text" id="postcode" name="postcode" placeholder="우편번호">
											<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
											<input type="text" id="address" name="address" placeholder="주소"><br>
											<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소">
										
									</td>
								</tr>
								<tr>
									<th>
											배송시 요청사항
									</th>
									<td>
										<div class="input-wrap1" style="width: 500px;">
											<select class="message">
												<option value="security">부재 시 경비실에 맡겨주세요</option>
												<option value="door">부재 시 문 앞에 놓아주세요</option>
												<option value="call">배송 전에 연락 주세요</option>
												<option value="direct">직접 수령하겠습니다</option>
												<option value="write">직접 입력</option>
											</select><br><br>
											<input type="text" class="direct-msg" placeholder="배송 메시지는 40자내로 입력해주세요">
										</div>
									</td>
								</tr>
							</table>
						</div>
							<details>
								  <summary>주문 동의</summary>
								  <p><input type="checkbox" name="checkAgree" value="주문 내역에 대한 동의"><span class="must">[필수]</span>주문 내역에 대한 동의</p>
							</details>
						
					
					</div>	 <!-- orderinfo div 끝 -->			
				</div>
				
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath }/js/memberJs/daumAPI.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">

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

           $('#receiver-name').val('${members.mem_name}');
           $('#receiver-phone').val('${members.mem_tel}');
           $('#postcode').val('${members.mem_zipcode}');
           $('#address').val('${members.mem_addr1}');
           $('#detailAddress').val('${members.mem_addr2}');
           
           }
        });
			
    
       $("#new-addr").change(function(){
       	  if($("#new-addr").is(":checked")){
      	 
           $('#receiver-name').val(null);
           $('#receiver-phone').val(null);
           $('#postcode').val(null);
           $('#address').val(null);
           $('#detailAddress').val(null);

    	         }
        
           });
           
        });
	
	
</script>
</html>