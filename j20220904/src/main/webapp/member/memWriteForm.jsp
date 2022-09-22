<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberCss/memWriteForm.css">
    <!-- <link rel="stylesheet" href="reset.css"> -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberCss/userUI.css">

</head>
<body>
	<div>
		<jsp:include page="../main/header.jsp"/>
	</div>
    <div id="memWrite-wrap">
        <div id="memWrite-inner-contents">
            <div class="memWrite-container">
                <form id="memJoinForm" class="memJoinForm" method="post">
                    <!-- 온라인 회원 가입 -->
                    <div class="page-title-wrap">
                        <h2 class="text-head1">온라인회원 가입</h2>
                    </div>
                    <div class="contents-inner join-wrap">
                        <div class="border-line-box-header">
                            <span class="text-head2">약관동의</span>
                        </div>
                        <!-- border-line-box fold-box-list-wrap 약관 동의 전체 구조 -->
                        <div class="border-line-box fold-box-list-wrap">
                            <!-- 전체 약관 동의 -->
                            <div class="term-check-all-wrap">
                                <span class="ui-chk text-medium">
                                    <input type="checkbox" id="foldCheckAll">
                                    <label for="foldCheckAll">
                                        전체 약관에 동의합니다.
                                    </label>
                                </span>
                            </div>
                            <!-- fold-box-list 필수 약관 동의 구조 -->
                            <ul class="fold-box-list" data-type="single">
                                <!--<li class="fold-box expanded"> -->
                                <li class="fold-box">
                                    <div class="fold-box-header">
                                        <span class="ui-chk">
                                            <input type="checkbox" id="foldTermCheck1" class="foldTermCheck" name="" value="Y">
                                            <label for="foldTermCheck1">
                                                <span class="spot">[필수] </span>
                                                <span>사이트 이용 약관</span>
                                                
                                            </label>
                                            <!-- 화살표 버튼 -->
                                            <span class="arrow-bottom"><img class="arrowImg1" src="${pageContext.request.contextPath }/img/memberImg/arrow_up.svg"></span>
                                        </span>
                                    </div>
                                    <div class="fold-box-contents">
                                        <div class="text-term">
                                            <div class="term-detail-wrap">
                                                <ol class="term-list">
                                                    <li>
                                                        <span class="term-head">제1조 (목적) </span>
                                                        <ul class="term-sub-list">
                                                            <li>이 약관은 (주)에이비씨마트코리아 회사(이하 "회사"라 함)가 운영하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 회사와 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.</li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <span class="term-head">제2조 (정의)</span>
                                                        <ul class="term-sub-list">
                                                            <li>1. "사이트"란 회사가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터, 모바일 등 정보통신 설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장 또는 회사가 운영하는 웹사이트, 모바일 웹, 앱 등의 서비스를 제공하는 모든 매체를 통칭하며, 통합된 하나의 회원 계정(아이디 및 비밀번호)을 이용하여 서비스를 제공받을 수 있는 아래의 사이트를 말합니다.</li>
                                                            <li>- www.a-rt.com</li>
                                                            <li>- www.onthespot.co.kr</li>
                                                            <li>- m.a-rt.com</li>
                                                            <li>- m.onthespot.co.kr</li>
                                                            <li>2. "이용자"란 "사이트"에 접속하여 이 약관에 따라 "사이트"가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.</li>
                                                            <li>3. ‘회원’이라 함은 "사이트"에 회원 등록을 한 자로서, "사이트"의 정보를 지속적으로 제공받으며, "사이트"가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.</li>
                                                            <li>4. ‘비회원’이라 함은 회원에 가입하지 않고 "사이트"가 제공하는 서비스를 이용하는 자를 말합니다.</li>
                                                        </ul>
                                                    </li>
                                                </ol>
                                            </div>
                                        </div>
                                    </div>
                                </li> <!-- fold-box 사이트 이용 약관 -->
                                <!-- <li class="fold-box expanded"> -->
                                <li class="fold-box">
                                    <div class="fold-box-header">
                                        <span class="ui-chk">
                                            <input type="checkbox" id="foldTermCheck2" class="foldTermCheck" name="" value="Y">
                                            <label for="foldTermCheck2">
                                                <span class="spot">[필수]</span>
                                                전자상거래 이용 약관
                                                
                                            </label>
                                            <!-- 화살표 버튼 -->
                                            <span class="arrow-bottom"><img class="arrowImg2" src="${pageContext.request.contextPath }/img/memberImg/arrow_up.svg"></span>
                                        </span>
                                    </div>
                                    <div class="fold-box-contents">
                                        <div class="text-term">
                                            <div class="term-detail-wrap">
                                                <ol class="term-list">
                                                    <li>
                                                        <span class="term-head">제1조 (목적) </span>
                                                        <ul class="term-sub-list">
                                                            <li>이 약관은 ㈜에이비씨마트코리아(이하 "당사"라 함)가 운영하는 통합 사이버몰인 A-RT닷컴(http://www.a-rt.com) (이하 "닷컴"이라 함)을 통하여 제공하는 전자지급결제대행서비스, 결제대금예치서비스 및 선불전자지급수단(‘포인트’, ‘쿠폰’)의 발행 및 관리 서비스(이하 통칭하여 ‘전자금융거래서비스’라 합니다)를 이용자가 이용하는 경우, ‘회사’와 이용자간 전자금융거래의 법률관계를 정함에 그 목적이 있습니다.</li>
                                                        </ul>
                                                    </li> 
                                                    <li>
                                                        <span class="term-head">제2조 (정의)</span>
                                                        <ul class="term-sub-list">
                                                            <li>1. 본 약관에서 정하는 용어의 정의는 다음과 같습니다.</li>
                                                            <li>① ‘전자금융거래’라 함은 ‘회사’가 전자적 장치를 통하여 전자금융업무를 제공하고, 이용자가 ‘회사’의 종사자와 직접 대면하거나 의사소통을 하지 아니하고 자동화된 방식으로 이를 이용하는 거래를 말합니다.</li>
                                                            <li>② ‘전자지급거래’라 함은 자금을 주는 자(이하’지급인’이라 합니다)가 ‘회사’로 하여금 전자지급수단을 이용하여 자금을 받는 자(이하 ’수취인’이라 합니다)에게 자금을 이동하게 하는 전자금융거래를 말합니다.</li>
                                                            <li>③ ‘전자적 장치’라 함은 전자금융거래정보를 전자적 방법으로 전송하거나 처리하는데 이용되는 장치로서 현금자동지급기, 자동입출금기, 지급용단말기, 컴퓨터, 전화기 그 밖에 전자적 방법으로 정보를 전송하거나 처리하는 장치를 말합니다.</li>
                                                            <li>④ ‘접근매체’라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를 포함한다), ‘전자서명법’ 상의 인증서, 금융기관 또는 전자금융업자에 등록된 이용자번호, 이용자의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등 전자금융거래법 제2조 제10호에서 정하고 있는 것을 말합니다.</li>
                                                            <li>⑤ ‘이용자’라 함은 ‘회사’와 본 약관에 동의하고 본 약관에 따라 사이트 전자금융거래 서비스를 이용하는 사이트 회원을 말합니다.</li>
                                                            <li>⑥ ‘이용자번호’란 이용자의 동일성 식별과 서비스 이용을 위하여 이용자가 설정하고 ‘회사’가 승인한 숫자와 문자의 조합을 말합니다.</li>
                                                            <li>⑦ ‘비밀번호’란 이용자의 동일성 식별과 회원정보의 보호를 위하여 이용자가 설정하고 ‘회사’가 승인한 숫자와 문자의 조합을 말합니다.</li>
                                                            <li>⑧ ‘거래지시’라 함은 이용자가 본 약관에 따라 ‘회사’에게 전자금융거래의 처리를 지시하는 것을 말합니다.</li>
                                                            <li>⑨ ‘오류’라 함은 이용자의 고의 또는 과실 없이 전자금융거래가 본 약관 또는 이용자의 거래지시에 따라 이행되지 아니한 경우를 말합니다.</li>
                                                            <li>2. 본 조 및 본 약관의 다른 조항에서 정의한 것을 제외하고는 전자금융거래법 등 관련법령에 정한 바에 따른다.</li>
                                                        </ul>
                                                    </li>
                                                </ol>
                                            </div>
                                        </div>
                                    </div>
                                </li> <!-- fold-box 전자상거래 이용약관 -->
                                <!-- <li class="fold-box expanded"> -->
                                <li class="fold-box">
                                    <div class="fold-box-header">
                                        <span class="ui-chk">
                                            <input type="checkbox" id="foldTermCheck3" class="foldTermCheck" name="" value="Y">
                                            <label for="foldTermCheck3">
                                                <span class="spot">[필수]</span>
                                                개인정보 수집 및 이용 동의
                                                
                                            </label>
                                            <!-- 화살표 버튼 -->
                                            <span class="arrow-bottom"><img class="arrowImg3" src="${pageContext.request.contextPath }/img/memberImg/arrow_up.svg"></span>
                                        </span>
                                    </div>
                                    <div class="fold-box-contents">
                                        <div class="text-term">
                                            <p>&nbsp</p>
                                                <ul>
                                                    <li class="tbl-wrap tbl-col tbl-term">
                                                        <table>
                                                            <colgroup>
                                                                <col>
                                                                <col>
                                                            </colgroup>
                                                            <thead>
                                                                <tr>
                                                                    <th scope="col">이용 목적</th>
                                                                    <th scope="col">수집 항목</th>
                                                                    <th scope="col" style="font-weight:bold;">수집 목적</th>
                                                                    <th scope="col" style="font-weight:bold;">보유 기간</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td>회원가입</td>
                                                                    <td>성명, 아이디, 비밀번호, 이메일</td>
                                                                    <td style="font-weight:bold;">개인식별, 불량회원의 부정 이용 방지와 비인가 사용방지, 불만처리 등 민원처리, 고지사항 전달</td>
                                                                    <td rowspan="4" style="font-weight:bold;">회원 탈퇴 시까지 또는 법정 의무 보유 기간까지</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>주문/결제/배송</td>
                                                                    <td>성명, 휴대폰번호, 전자우편주소, 배송정보(주문자 및 수취인주소, 수취인명, 수취인연락처 등), 결제정보(계좌정보, 신용카드정보, 기프트카드 번호, 현금영수증 발행여부 등)</td>
                                                                    <td style="font-weight:bold; border-right:1px solid #e5e5e5;">물품/서비스 주문, 상품 제공, 구매 및 요금결제, 물품배송 또는 청구지 등 발송, 현금영수증 발행, 금융거래 본인 인증 및 금융서비스</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>선물하기 서비스 이용 시</td>
                                                                    <td>수령자의 이름, 휴대폰 번호, 주소</td>
                                                                    <td style="font-weight:bold; border-right:1px solid #e5e5e5;">배송지 정보 확보, 불만처리 의사소통 경로 확보</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>환불 시</td>
                                                                    <td>환불 계좌 정보(예금주, 은행명, 계좌번호)</td>
                                                                    <td style="font-weight:bold; border-right:1px solid #e5e5e5;">환불 처리</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </li>
                                                </ul>
                                            <p>&nbsp</p>
                                        </div>
                                    </div>
                                </li> <!-- fold-box 개인정보 동의  -->
                            </ul> <!-- fold-box-list 필수 약관 동의 구조 -->
                        </div> <!-- border-line-box fold-box-list-wrap 약관 동의 전체 구조 -->
                        
                        <div class="border-line-box-desc">
                            <span class="text-error has-icon">만 14세 미만은 회원가입이 불가합니다.</span>
                        </div><!-- border-line-box-desc 만 14세 경고 문구 -->
                        
                        <!-- 회원 가입 -->
                        <div class="border-line-box-header">
                            <span class="text-head2">회원정보</span>
                           </div>
                           
                           <!-- 회원 가입 테이블 -->
                           <div class="border-line-box tbl-form-wrap tbl-input-type2">
                               <table class="tbl-form">
                                <tbody>
                                    <tr>
                                        <th class="required">이름</th>
                                        <td>
                                            <div>
                                                <input type="text" id="mem_name" name="" placeholder="이름을 입력해주세요.">
                                                <div id="Val_nameDiv" class="valid"></div>
                                            </div>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <th class="required">아이디</th>
                                        <td>
                                            <div>
                                                <input type="text" id="mem_id" name="" placeholder="아이디를 입력해주세요.(영문자로 시작, 숫자 사용 6~20자)">
                                                <div id="Val_idDiv" class="valid"></div>
                                            </div>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <th class="required">비밀번호</th>
                                        <td>
                                            <div>
                                                <input type="password" id="mem_pwd" name="" placeholder="비밀번호를 입력해주세요.(영문, 숫자, 특수문자 포함 8~16자)">
                                                <div id="Val_pwdDiv" class="valid"></div>
                                            </div>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <th class="required">비밀번호확인</th>
                                        <td>
                                            <div>
                                                <input type="password" id="mem_rePwd" name="" placeholder="비밀번호를 재입력해 주세요.">
                                                <div id="Val_pwdReDiv" class="valid"></div>
                                            </div>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <th class="required">이메일</th>
                                        <td>
                                            <div class="formEmailDiv">
                                                <input type="text" id="mem_email1" name="mem_email1" placeholder="이메일을 입력해 주세요.">
                                                <!-- <input type="text" id="mem_email2" name="mem_email2" list="emailList" placeholder="이메일 주소를 입력해 주세요." disabled> 
                                                
                                                <datalist id="emailList">
                                                    <option value="google.co.kr">google.co.kr</option>
                                                    <option value="gmail.com">gmail.com</option>
                                                    <option value="naver.com">naver.com</option>
                                                    <option value="nate.com">nate.com</option>
                                                    <option value="yahoo.co.kr">yahoo.co.kr</option>
                                                    <option value="hanmail.net">hanmail.net</option>
                                                </datalist> -->
                                                <!-- <select name="email2">
                                                    <option value="gmail.com">google.co.kr</option>
                                                    <option value="gmail.com">gmail.com</option>
                                                    <option value="naver.com">naver.com</option>
                                                    <option value="nate.com">nate.com</option>
                                                    <option value="yahoo.co.kr">yahoo.co.kr</option>
                                                    <option value="hanmail.net">hanmail.net</option>
                                                </select> -->
                                                
                                                <button type="button" id="emailBtn" class='btn'>인증번호 요청</button>
                                                <div id="emailAuth" style="display:none">
                                                    <input type="text" name="authEmail" id="authEmail" placeholder="이메일 인증 번호 클릭" disabled="disabled"> <!-- 사용자가 이메일에 인증번호를 받고 입력하는 부분 -->
					                                <input type="text" name="authEmailCheck" id="authEmailCheck" value="1234" readonly> <!-- 서버에서 만들어진 인증번호를 받는 부분 -->
                                                </div>
                                                <div id="Val_emailDiv" class="valid"></div>
                                            </div>
                                        </td>
                                        
                                    </tr>
                                    
                                    <tr>
                                        <th class="required">휴대폰 번호</th>
                                        <td>
                                            <div class="formTelDiv">
                                                <input type="text" id="mem_tel" name="" placeholder="휴대폰 번호를 '-'없이 입력해주세요.">
                                                <button type="button" class='btn'>인증번호 요청</button>
                                                <div id="Val_telDiv" class="valid"></div>
                                            </div>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <th class="required">주소</th>
                                        <td>
                                            <div>
                                                <input type="text" name="mem_zipcode"  id="mem_zipcode" placeholder="우편번호" readonly disabled>
                                                <button type="button" id="zipcodeBtn" onclick="checkPost()">우편번호 검색</button>
                                                <input type="text" name="mem_addr1" id="mem_addr1" placeholder="주소" size="50" readonly disabled>
                                                <input type="text" name="mem_addr2" id="mem_addr2" placeholder="상세주소" size="50">
                                                <div id="Val_addrDiv" class="valid"></div>
                                            </div>
                                        </td>
                                    </tr>
            
                                </tbody>
                            </table> <!-- 회원가입 테이블 -->
                           </div> <!-- tbl-form-wrap 회원 가입 테이블 div-->
                    </div> <!-- contents-inner join-wrap 약관 컨테이너 전체 구조 -->

                    <!-- 가입 / 취소 버튼 -->
                    <div class="btn-wrap">
                        <button class="btn-cancel-gray" id="btn-not-accept">
                            취소
                        </button>

                        <button class="btn-accept-black" id="btn-accept">
                            회원가입
                        </button>
                    </div>
                </form> <!-- form  -->
            </div>
        </div>
    </div> <!-- contents -->
	
	<div>
		<jsp:include page="../main/footer.jsp"/>
	</div>
<!-- 얘가 먼저와야함 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="${pageContext.request.contextPath }/js/memberJs/regExp.js"></script>
<script src="${pageContext.request.contextPath }/js/memberJs/memWriteForm.js"></script>
<script src="${pageContext.request.contextPath }/js/memberJs/daumAPI.js"></script>
</body>
</html>