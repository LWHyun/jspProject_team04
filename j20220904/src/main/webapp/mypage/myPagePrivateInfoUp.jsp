<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberCss/myPagePrivateInfoUp.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberCss/userUI.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath }/js/memberJs/daumAPI.js"></script>

<form id="updateForm">
	<input type="hidden" name="toURI" value="${requestScope.toURI }">
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
                            <input type="text" id="mem_name" name="mem_name" class="disabledInput" value="${sessionScope.mem_name }" disabled>
                        </div>
                    </td>
                </tr>
                
                <tr>
                    <th class="required">아이디</th>
                    <td>
                        <div>
                            <input type="text" id="mem_id" name="mem_id" class="disabledInput" value="${sessionScope.mem_id }" disabled>
                        </div>
                    </td>
                </tr>
                
                <tr>
                    <th class="required">이메일</th>
                    <td>
                        <div class="formEmailDiv">
                            <input type="text" id="mem_email1" name="mem_email1" value="${memberDTO.mem_email1 }@${memberDTO.mem_email2}" placeholder="이메일을 입력해 주세요.">
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
                            <div id="Val_emailDiv" class="valid"></div>
                        </div>
                    </td>
                    
                </tr>
                
                <tr>
                    <th class="required">휴대폰 번호</th>
                    <td>
                        <div class="formTelDiv">
                            <input type="text" id="mem_tel" name="mem_tel" value="${memberDTO.mem_tel }" placeholder="휴대폰 번호를 '-'없이 입력해주세요.">
                            <!-- <button type="button" class='btn'>인증번호 요청</button> -->
                            <div id="Val_telDiv" class="valid"></div>
                        </div>
                    </td>
                </tr>
                
                <tr>
                    <th class="required">주소</th>
                    <td>
                        <div>
                            <input type="text" name="mem_zipcode"  id="mem_zipcode" value="${memberDTO.mem_zipcode }" placeholder="우편번호" readonly>
                            <button type="button" id="zipcodeBtn" onclick="checkPost()">우편번호 검색</button>
                            <input type="text" name="mem_addr1" id="mem_addr1" value="${memberDTO.mem_addr1 }" placeholder="주소" size="50" readonly>
                            <input type="text" name="mem_addr2" id="mem_addr2" value="${memberDTO.mem_addr2 }" placeholder="상세주소" size="50">
                            <div id="Val_addrDiv" class="valid"></div>
                        </div>
                    </td>
                </tr>

                <tr>
                    <th class="required">비밀번호 확인</th>
                    <td>
                        <div>
                            <input type="password" id="mem_rePwd" name="mem_rePwd" placeholder="비밀번호를 재입력해 주세요.">
                        </div>
                    </td>
                </tr>
            </tbody>
        </table> <!-- 개인정보 수정 테이블 -->
    </div> <!-- tbl-form-wrap 개인정보 수정 테이블 div-->

    <!-- 변경 버튼 -->
    <div class="btn-wrap">
        <button type="button" class="btn-accept-black">
            변경
        </button>
    </div>
</form> <!-- 개인정보 수정 폼-->
          
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="${pageContext.request.contextPath }/js/memberJs/regExp.js"></script>
<script>
$(function() {
	// 유효성 검증
	// 이메일 형식 확인
    $('#mem_email1').on('blur', function() {
        if($('#mem_email1').val() == '') {
            $('#Val_emailDiv').css('display','');
            $('#Val_emailDiv').text('이메일을 입력해주세요');
            $('#mem_email1').val('');
        } else {
            if(!isEmail($('#mem_email1').val())) {
                $('#Val_emailDiv').css('display','');
                $('#Val_emailDiv').text('이메일을 형식에 맞게 입력해주세요');
                $('#mem_email1').val('');
            } else {
                $('#Val_emailDiv').css('display','none');
            }
        }
    });
	// 휴대폰 확인
    $('#mem_tel').on('blur', function() {
        if($('#mem_tel').val() == '' || !isPhoneNumber($('#mem_tel').val())) {
            $('#Val_telDiv').css('display', '');
            $('#Val_telDiv').text('휴대폰 번호를 형식에 맞게 작성해주세요');
            $('#mem_tel').val('');
        } else {
            $('#Val_telDiv').css('display', 'none');
        }
    });
    
	
	// 변경버튼 클릭 시
	$('.btn-accept-black').click(function () {
		if(!$('#mem_email1').val()) {
			alert("이메일을 입력해주세요");
			$('#mem_email1').focus();
		} else if(!$('#mem_tel').val()) {
			alert("휴대폰 번호를 입력해주세요");
			$('#mem_tel').focus();
		} else if(!$('#mem_zipcode').val()) {
            alert("주소를 검색해주세요");
            $('#zipcodeBtn').focus();
        } else if(!$('#mem_rePwd').val()) {
        	alert("비밀번호를 입력해주세요");
        	$('#mem_rePwd').focus();
        } else {
        	// 비밀번호 확인 ajax
            $.ajax({
            	url : '${pageContext.request.contextPath}/mypage/checkPwd.do',
				type : 'post',
				data : 'mem_pwd='+$('#mem_rePwd').val(),
				dataType : 'text',
				success : function(data) {
					if(data == '1') {
						// 비밀번호가 알맞으면 회원정보가 업데이트 되는 ajax
						$.ajax({
							url : '${pageContext.request.contextPath }/mypage/update.do',
							type : 'post',
							data : $('#updateForm').serialize(),
							dataType : 'text',
							success : function(data) {
								if(data == 1) {
									alert('회원정보가 수정되었습니다.');
									location.href="${pageContext.request.contextPath}/mypage/updateForm.do";
								} else if(data == 0){
									alert('회원정보 수정에 실패했습니다.\n다시 시도해주세요.');
								} else {
									alert("로그인을 해주세요.");
									location.href='${pageContext.request.contextPath}/member/loginForm.do?toURI=${requestScope.toURI}';
								}
							}, 
							error : function(err) {
								console.log(err);
							}
						})
						
					} else if (data == '0'){
						alert("정확하지 않은 비밀번호입니다.");
						$('#mem_rePwd').val('');
					} else {
						alert("로그인을 해주세요.");
						location.href='${pageContext.request.contextPath}/member/loginForm.do?toURI=${requestScope.toURI}';
					}
				},
				error : function(err) {
					console.log(err);
				}
            });
        }
	});
});
</script>