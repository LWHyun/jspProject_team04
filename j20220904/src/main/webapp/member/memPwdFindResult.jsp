<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberCss/memPwdFindResult.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberCss/userUI.css">
</head>
<body>
	<div>
		<jsp:include page="../main/header.jsp"></jsp:include>
	</div>
	
    <div id="memPwdFindResult-wrap">
        <div id="memPwdFindResult-inner-contents">
            <div class="memPwdFindResult-container">
                <!-- 비밀번호 찾기 결과 헤더 -->
                <div class="page-title-wrap">
                    <h2 class="text-head1">비밀번호 찾기</h2>
                </div><!-- page-title-wrap 비밀번호 찾기 결과 헤더-->

                <!-- 비밀번호 찾기 결과 -->
                <div class="FindResult-contents">
                    <!-- 비밀번호 찾기 결과 표시 창 -->
                    <div class="contents-flex">
                        <div class="dialog-contents-inner">
                            <span class="icon-pictogram password-confirm"></span>
                            <p class="pictogram-text size-3 text-medium">
                                인증되었습니다.<br>
                                <span class="spot">새로운 비밀번호</span>를 설정해 주세요.
                            </p>

                            <!-- 비밀번호 입력 박스 -->
                            <div class="find-pwd-result-box">
                                <form action="${pageContext.request.contextPath }/member/memRePwd.do" method="post" id="rePwdForm" name="rePwdForm">
                                	<input type="hidden" name="mem_id" id="mem_id" value="${requestScope.mem_id }">
                                    <div class="find-pwd-result-Pwd">
                                        <input type="password" id="mem_pwd" name="mem_pwd" placeholder="새 비밀번호를 입력해주세요.(영문, 숫자, 특수문자 포함 8~16자)">
                                       	<div id="Val_pwdDiv" class="valid"></div>
                                    </div>

                                    <div class="find-pwd-result-rePwd">
                                        <input type="password" id="mem_rePwd" name="mem_rePwd" placeholder="새 비밀번호를 재입력해 주세요.">
                                        <div id="Val_pwdReDiv" class="valid"></div>
                                    </div>
                                </form>

                                <div class="btn-wrap">
                                    <button id="popLoginBtn" class="btn-login-pwdFind">확인</button>
                                </div>
                            </div><!-- find-id-result-box -->
                        </div><!-- dialog-contents-inner -->
                    </div><!-- contents-flex -->
                </div><!-- FindResult-contents -->
            </div><!-- memIdFindResult-container -->
        </div><!-- memIdFindResult-inner-contents -->
    </div><!-- memIdFindResult-wrap -->
    
    <div>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
	
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>	
<script src="${pageContext.request.contextPath }/js/memberJs/regExp.js"></script>
<script>
$(function() {
	// 비밀번호
    $('#mem_pwd').on('blur',function() {
        let mem_pwd = $('#mem_pwd').val();

        if(mem_pwd == '' || !isPassword(mem_pwd)) {
            $('#Val_pwdDiv').css('display', '');
            $('#Val_pwdDiv').text('새 비밀번호를 입력해주세요.(영문, 숫자, 특수문자 포함 8~16자)');
            $('#mem_pwd').val('');
            //$('#mem_pwd').focus();
        } else {
            $('#Val_pwdDiv').css('display', 'none');
        }
    });
    // 비밀번호 확인
    $('#mem_rePwd').on('blur',function() {
        let mem_pwd = $('#mem_pwd').val();
        let mem_rePwd = $('#mem_rePwd').val();

        if((mem_rePwd == '') || (mem_pwd !== mem_rePwd)) {
            $('#Val_pwdReDiv').css('display', '');
            $('#Val_pwdReDiv').text('비밀번호가 일치하지 않습니다.');
            $('#mem_rePwd').val('');
            //$('#mem_pwd').focus();
        } else {
            $('#Val_pwdReDiv').css('display', 'none');
        }
    });
    
    // 확인 버튼 클릭 시 
    $('#popLoginBtn').click(function() {
    	if(!$('#mem_pwd').val()) {
    		alert("새 비밀번호를 입력해주세요.");
            $('#mem_name').focus();
            return false;
    	} else if(!$('#mem_rePwd').val()) {
    		alert("새 비밀번호를 확인해주세요.");
            $('#mem_name').focus();
            return false;
    	} else {
    		$('#rePwdForm').submit();
    	}
    	
    });
});
</script>
</body>
</html>