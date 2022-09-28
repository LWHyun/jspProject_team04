<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문정보</title>
<style type="text/css">

	.order-basket {
						display : block;
			
	}
	.order-wrap {
					margin-top: 79px;
				    padding-left: 150px;
				    padding-right: 150px
				}
				
	.order-title {
			
		font-size : 32px;
		font-weight : bold;
	
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

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
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
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
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
 			<div class="order-basket">
					
					
					<table class="order-body">
					
						<tbody>
							<tr>
								<td class="pd_img"><img src="images/shoe.jpg" width="100px" float="center"></td>
								<td>DAYSOF DUAL THONG<br> MELON </td>
								<td>27,000원</td>
							</tr>
						</tbody>
					</table>
 			</div>	
 				<div class="price-cal">
					<table class="cal-tbl">
						<tr><td>결제 예정 금액</td></tr>
						<tr><td>27,000원</td></tr>
					</table>
				</div>
				
				<!-- 여기부터 주문 정보 디테일 -->
				
				<div class="order-info">
						
						<div class="order-payment-box" id="orderPaymentBox">
							<h4>결제 정보 </h4>
							<ul>
								<li></li>
							
							</ul>
						</div>
						
						
				<div class="order-form">
						<span class="order-user">주문 고객정보</span>
						<table class="tbl-form">
							<tbody>
								<tr>
									<th class="buyer-name">
											이름
									</th>
									<td>
										<div class="input-wrap" style="width: 500px;">
											 <input type="text" required="required" id="buyername"> <!-- placeholder -->
										</div>
									</td>
								</tr>
								<tr>
									<th class="buyer-phone">
											휴대폰번호
									</th>
									<td>
										<div class="input-wrap" style="width: 500px;">
											 <input type="text" required="required" id="buyerphone"> <!-- placeholder -->
										</div>
									</td>
								</tr>
								<tr>
									<th class="buyer-email">
											이메일
									</th>
									<td>
										<div class="input-wrap" style="width: 500px;">
											 <input type="text" required="required" id="buyermail"> <!-- placeholder -->
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
													<input type="radio" name="choose-one" id="recent-addr"> 최근 배송지
												</li>
												<li>
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
										
											<input type="text" id="sample6_postcode" placeholder="우편번호">
											<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
											<input type="text" id="sample6_address" placeholder="주소"><br>
											<input type="text" id="sample6_detailAddress" placeholder="상세주소">
										
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
						<div class="agree-fold-box-wrap">
							<span class="order-agree">주문 동의</span>
							<div class="agree-box"  style="width: 500px;">
								<ul class="fold-box-list" data-type="single">
									<li>
										<div class="fold-box-header">
											<span class="ui-chk">
												<label>
													<input type="checkbox" name="checkAgree" value="주문 내역에 대한 동의">
													<span class="must">[필수]</span> 
													주문 내역에 대한 동의
												</label>
											</span>
										</div>
									</li>
									
								</ul>
							</div>
						</div>
					</div>	 <!-- orderinfo div 끝 -->			
				







				</div>
				
 	</div>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath }/js/memberJs/daumAPI.js"></script>
</html>