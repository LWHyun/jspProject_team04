<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberCss/myPagePrivateInfoUp.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberCss/userUI.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath }/js/memberJs/daumAPI.js"></script>

<form>
    <!-- 회원 가입 -->
    <div class="border-line-box-header">
        <span class="text-head2">개인정보 수정</span>
    </div>
    
    <!-- 회원 가입 테이블 -->
    <div class="border-line-box tbl-form-wrap tbl-input-type2">
        <table class="tbl-form">
            <tbody>
                <tr>
                    <th class="required">이름</th>
                    <td>
                        <div>
                            <input type="text" id="" name="" class="disabledInput" disabled>
                        </div>
                    </td>
                </tr>
                
                <tr>
                    <th class="required">아이디</th>
                    <td>
                        <div>
                            <input type="text" id="" name="" class="disabledInput" disabled>
                        </div>
                    </td>
                </tr>
                
                <tr>
                    <th class="required">이메일</th>
                    <td>
                        <div class="formEmailDiv">
                            <input type="text" id="mem_email1" name="mem_email1" placeholder="이메일을 입력해 주세요.">
                            <!-- <input type="text" id="" name="email2" list="emailList" placeholder="이메일 주소를 입력해 주세요."> 
                            <datalist id="emailList">
                                <option value="google.co.kr">google.co.kr</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="naver.com">naver.com</option>
                                <option value="nate.com">nate.com</option>
                                <option value="yahoo.co.kr">yahoo.co.kr</option>
                                <option value="hanmail.net">hanmail.net</option>
                            </datalist> -->
                            <!-- <select name="email2">
                                <option value="">직접 입력</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="naver.com">naver.com</option>
                                <option value="nate.com">nate.com</option>
                                <option value="yahoo.co.kr">yahoo.co.kr</option>
                                <option value="hanmail.net">hanmail.net</option>
                            </select> -->
                            
                        </div>
                    </td>
                    
                </tr>
                
                <tr>
                    <th class="required">휴대폰 번호</th>
                    <td>
                        <div class="formTelDiv">
                            <input type="text" id="" name="" placeholder="휴대폰 번호를 '-'없이 입력해주세요.">
                            <!-- <button type="button" class='btn'>인증번호 요청</button> -->
                        </div>
                    </td>
                </tr>
                
                <tr>
                    <th class="required">주소</th>
                    <td>
                        <div>
                            <input type="text" name="mem_zipcode"  id="mem_zipcode" placeholder="우편번호" readonly>
                            <button type="button" id="zipcodeBtn" onclick="checkPost()">우편번호 검색</button>
                            <input type="text" name="mem_addr1" id="mem_addr1" placeholder="주소" size="50" readonly>
                            <input type="text" name="mem_addr2" id="mem_addr2" placeholder="상세주소" size="50">
                        </div>
                    </td>
                </tr>

                <tr>
                    <th class="required">비밀번호 확인</th>
                    <td>
                        <div>
                            <input type="password" id="" name="">
                        </div>
                    </td>
                </tr>
            </tbody>
        </table> <!-- 개인정보 수정 테이블 -->
    </div> <!-- tbl-form-wrap 개인정보 수정 테이블 div-->

    <!-- 변경 버튼 -->
    <div class="btn-wrap">
        <button class="btn-accept-black">
            변경
        </button>
    </div>
</form> <!-- 개인정보 수정 폼-->
               