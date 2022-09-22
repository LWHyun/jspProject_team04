<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberCss/memPwdFind.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberCss/userUI.css">
</head>
<body>
	<div>
		<jsp:include page="../main/header.jsp"></jsp:include>
	</div>
	
    <div id="memPwdFind-wrap">
        <div id="memPwdFind-inner-contents">
            <div class="memPwdFind-container">
                <!-- 비밀번호 찾기 헤더 -->
                <div class="page-title-wrap">
                    <h2 class="text-head1">비밀번호 찾기</h2>
                </div><!-- page-title-wrap 비밀번호 찾기 헤더-->

                <div class="PwdFind-contents-inner-wrap">
                    <div class="tab-wrap">
                        <!-- 비밀번호 찾기 탭 -->
                        <ul class="tab-ul">
                            <li>
                                비밀번호 찾기
                            </li>
                        </ul>

                        <!-- 비밀번호 찾기 FORM -->
                        <div class="tab-PwdFind-form">
                            <form action="" method="post" id="search-IdFindForm" name="search-IdFindForm">
                                <div class="login-input login-input-name">
                                    <input type="text" id="" name="" placeholder="이름을 입력해주세요.">
                                </div>

                                <div class="login-input login-input-id">
                                    <input type="text" id="" name="" placeholder="아이디를 입력해주세요.">
                                </div>

                                <!-- 유효성 검사 필요 -->
                                <div class="login-input login-input-email">
                                    <input type="text" id="" name="" placeholder="이메일을 입력해주세요.">
                                    <button type="button" class='btn'>인증번호 요청</button>
                                </div>

                                <div class="login-input login-input-authEmail">
                                    <input type="text" id="" name="" placeholder="인증번호 6자리를 입력해주세요."> 
                                    <button type="button" class="btn">확인</button>
                                </div>
                            </form>
                        </div><!-- 비밀번호 찾기 FORM -->
                    </div><!-- tab-wrap -->


                    <div class="PwdFind-form-footer">
                        <div class="footer-item">
                            <span>비밀번호를 잊으셨나요?</span>
                            <a href="#" class="btn btn-sm white">비밀번호 찾기</a>
                        </div>

                        <div class="footer-item">
                            <span>아직 회원이 아니신가요?</span>
                            <a href="#" class="btn btn-sm gray">회원가입</a>
                        </div>
                    </div>
                </div><!-- idFind-contents-inner-wrap -->
            </div> <!-- memIdFind-container -->
        </div><!-- memIdFind-inner-contents -->
    </div><!-- memIdFind-wrap -->
    
    <div>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
</body>
</html>