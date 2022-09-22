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
                                <form>
                                    <div class="find-pwd-result-Pwd">
                                        <input type="password" placeholder="새 비밀번호를 입력해주세요.(영문, 숫자, 특수문자 포함 10~20자)">
                                    </div>

                                    <div class="find-pwd-result-rePwd">
                                        <input type="password" placeholder="새 비밀번호를 재입력해주세요.">
                                    </div>
                                </form>

                                <div class="btn-wrap">
                                    <a href="#" id="popLoginBtn" class="btn-login-pwdFind">확인</a>
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
</body>
</html>