<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberCss/memIdFindResult.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberCss/userUI.css">
</head>
<body>
	<div>
		<jsp:include page="../main/header.jsp"></jsp:include>
	</div>
	
    <div id="memIdFindResult-wrap">
        <div id="memIdFindResult-inner-contents">
            <div class="memIdFindResult-container">
                <!-- 아이디 찾기 결과 헤더 -->
                <div class="page-title-wrap">
                    <h2 class="text-head1">아이디 찾기</h2>
                </div><!-- page-title-wrap 아이디 찾기 결과 헤더-->

                <!-- 아이디 찾기 결과 -->
                <div class="FindResult-contents">
                    <!-- 아이디 표시 창 -->
                    <div class="contents-flex">
                        <div class="dialog-contents-inner">
                            <span class="icon-pictogram success"></span>
                            <p class="pictogram-text size-2">회원님의 정보와 일치하는 아이디입니다.</p>
                            <div class="find-id-result-box">
                                <div class="find-id-result-box-inner">
                                    <form id="findForm" name="findForm">
                                    <c:forEach var="memberDTO" items="${list }">
	                                    <div class="rdo-list-item">
	                                        <span class="ui-rdo">
	                                            <input id="rdoList0" name="mem_id" type="radio" value="${memberDTO.mem_id }">
	                                            <label for="rdoList0">
	                                                ${memberDTO.mem_id }
	                                            </label>
	                                        </span>
	                                        
	                                        <span class="rdo-option">
	                                        	<span class="join-info">
	                                       		<fmt:formatDate value="${memberDTO.mem_rogDate }" pattern="yyyy년MM월dd일 가입"/>
	                                       		 </span>
                                       		 </span>
	                                    </div><!-- rdo-list-item -->
                                    </c:forEach>
                                    </form>
                                </div><!-- find-id-result-box-inner -->
                            </div><!-- find-id-result-box -->

                            <div class="btn-wrap">
                                <button id="popLoginBtn" class="btn-login-pwdFind">로그인</button>
                                <button id="popPwSearchBtn" class="btn-login-pwdFind btn-line">비밀번호 찾기</button>
                            </div>

                        </div><!-- dialog-contents-inner -->
                    </div><!-- contents-flex -->

                    <!-- 로그인 / 비밀번호 찾기 버튼 -->
                    <div class="btn-wrap">

                    </div>
                </div><!-- FindResult-contents -->
            </div><!-- memIdFindResult-container -->
        </div><!-- memIdFindResult-inner-contents -->
    </div><!-- memIdFindResult-wrap -->
    
    <div>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script>
$(function() {
	$('#popLoginBtn').click(function() {
		$('#findForm').attr('action', '${pageContext.request.contextPath}/member/loginForm.do');
		$('#findForm').attr('method', 'post');
		$('#findForm').submit();
	});
	
	$('#popPwSearchBtn').click(function() {
		$('#findForm').attr('action', '${pageContext.request.contextPath}/member/memPwdFindForm.do');
		$('#findForm').attr('method', 'post');
		$('#findForm').submit();
	});
});
</script>
</body>
</html>