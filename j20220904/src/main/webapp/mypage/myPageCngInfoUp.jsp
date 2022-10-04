<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberCss/myPagePrivateInfo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberCss/userUI.css">


                    <!-- form -->
                    <form id="checkPasswordForm">
                        <!-- 개인정보 수정 타이틀 -->
                        <div class="border-line-box-header">
                            <span class="text-head2">비밀번호 변경</span>
                        </div>

                        <!-- 개인정보 수정  -->
                        <div class="border-line-box tbl-form-wrap form-small">
							<table class="tbl-form">
								<tbody>
									<tr>
										<th scope="row">
                                            <label for="pswdText" class="required">새 비밀번호</label>
                                        </th>
										<td>
											<div class="input-wrap" style="width:350px;">
												<input id="mem_pwd" name="mem_pwd" type="password" class="ui-input" placeholder="비밀번호 입력해 주세요.">
												<div id="Val_pwdDiv" class="valid"></div>
											</div>
										</td>
									</tr>

                                    <tr>
										<th scope="row">
                                            <label for="pswdText" class="required">새 비밀번호 확인</label>
                                        </th>
										<td>
											<div class="input-wrap" style="width:350px;">
												<input id="mem_rePwd" name="mem_rePwd" type="password" class="ui-input" placeholder="비밀번호 입력해 주세요.">
												<div id="Val_pwdReDiv" class="valid"></div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
                        </div>

                        <!-- 버튼 - userUI.css -->
                        <div class="btn-wrap page-bottom">
							<button type="button" id="checkPwdBtn" class="btn btn-lg">확인</button>
						</div>

                        <!-- 비밀번호 재확인 박스 - userUI.css -->
                        <div class="gray-box notice-box">
							<span class="text-notice">비밀번호 변경 안내</span>
							<ul class="bullet-text-list">
								<li class="bullet-text">쉬운 비밀번호나 자주 쓰는 사이트의 비밀번호가 같은 경우, 도용되기 쉬우므로 고객님의 정보보호를 위해 비밀번호는 정기적으로 변경하여 주시기 바랍니다.</li>
								<li class="bullet-text">영문, 숫자, 특수문자 2개 이상 조합 10~20자로 설정해야 합니다. 3자 이상 중복되는 영문, 숫자, 특수문자는 사용할 수 없으며, 공백도 사용할 수 없습니다.</li>
								<li class="bullet-text">아이디와 주민등록번호, 생일, 전화번호 등 개인정보와 관련된 숫자, 연속된 숫자, 반복된 문자 등 다른 사람이 쉽게 알아 낼 수 있는 비밀번호는 개인정보 유출의
                                    위험이 높으므로 사용을 자제해 주시기 바랍니다.</li>
							</ul>
						</div>
                    </form><!-- form -->
               
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="${pageContext.request.contextPath }/js/memberJs/regExp.js"></script>
<script>
$(function() {
	let check = false;
	let check2 = false;
	// 비밀번호
    $('#mem_pwd').on('blur',function() {
        let mem_pwd = $('#mem_pwd').val();

        if(mem_pwd == '' || !isPassword(mem_pwd)) {
            $('#Val_pwdDiv').css('display', '');
            $('#Val_pwdDiv').text('비밀번호를 입력해주세요.(영문, 숫자, 특수문자 포함 8~16자)');
            $('#mem_pwd').val('');
            //$('#mem_pwd').focus();
        } else {
            $('#Val_pwdDiv').css('display', 'none');
            check = true;
        }
    });
    //비밀번호 확인
    $('#mem_rePwd').on('blur',function() {
        let mem_pwd = $('#mem_pwd').val();
        let mem_rePwd = $('#mem_rePwd').val();

        if((mem_rePwd == '') || (mem_pwd !== mem_rePwd)) {
            $('#Val_pwdReDiv').css('display', '');
            $('#Val_pwdReDiv').text('비밀번호가 일치하지 않습니다.');
            $('#mem_pwd').val('');
            $('#mem_rePwd').val('');
            //$('#mem_pwd').focus();
        } else {
            $('#Val_pwdReDiv').css('display', 'none');
            check2 = true;
        }
    });
    
    $('#checkPwdBtn').click(function() {
    	if(check && check2) {
	    	$.ajax({
	    		url : '${pageContext.request.contextPath}/mypage/updatePwd.do',
	    		type : 'post',
	    		data : 'mem_pwd='+$('#mem_pwd').val(),
	    		dataType : 'text',
	    		success : function(data) {
	    			console.log(data);
	    			if(data == 1) {
	    				alert("비밀번호가 수정되었습니다.");
	    				location.href="${pageContext.request.contextPath}/member/loginForm.do";
	    			} else if(data == 0) {
	    				alert("동일한 비밀번호로는 수정될 수 없습니다.");
	    				$('#mem_pwd').val('');
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
    	} else {
    		alert("새 비밀번호를 입력해주세요.");
    	}
    });
})
</script>