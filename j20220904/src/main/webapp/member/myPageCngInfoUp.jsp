<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberCss/myPagePrivateInfo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberCss/userUI.css">
</head>
<body>
	<div>
		<jsp:include page="../main/header.jsp"></jsp:include>
	</div>
	
    <div class="contents-wrap">
        <div class="myPage-inner-contents">
            <!-- top bar -->
            <div class="breadcrumb-wrap">
                <ol class="breadcrumb-list">
                    <li class="crumb home"><a href="/">HOME</a></li>
                    <li class="crumb">마이페이지</li>
                </ol>
            </div>

            <!-- 마이페이지 타이틀 -->
            <div class="page-title-wrap mypage">
                <h2 class="text-head1 text-left">마이페이지</h2>
            </div>

            <div class="contents-inner contents-aside mypage-wrap">
                <div class="aside-wrap">
                    <ol class="mypage-lnb">
                        <li>
                            <span class="mypage-lnb-title">마이 페이지</span>
                            <ol>
                                <li class="mypage-lnb-item">
                                    <a href="#">마이 페이지</a>
                                </li>
                            </ol>
                        </li>

                        <li>
                            <span class="mypage-lnb-title">쇼핑수첩</span>
                            <ol>
                                <li class="mypage-lnb-item">
                                    <a href="#">찜한상품</a>
                                </li>
                                <li class="mypage-lnb-item">
                                    <a href="#">상품 Q&A</a>
                                </li>
                            </ol>
                        </li>

                        <li>
                            <span class="mypage-lnb-title">개인정보</span>
                            <ol>
                                <li class="mypage-lnb-item">
                                    <a href="#">개인정보 수정</a>
                                </li>
                                <li class="mypage-lnb-item">
                                    <a href="#">비밀번호 변경</a>
                                </li>
                                <li class="mypage-lnb-item">
                                    <a href="#">회원 탈퇴</a>
                                </li>
                            </ol>
                        </li>
                    </ol>
                </div><!-- aside-wrap -->

                <div class="aside-contents">
                    <div class="member-grade-box">
                        <div class="grade-info-box">
                            <span class="grade-info"><span>김성현</span> 님은 <span class="bold">온라인 회원</span>입니다.</span>
                        </div>

                        <div class="grade-box-contents shopinfo">
                            <div class="shopping-info">
                                <div class="info-item">
                                    <span class="info-title"><i class="icon-cart"></i> 장바구니</span>
                                    <span class="info-data"><a href="#">0<span class="unit">개</span></a></span>
                                </div>
                                <div class="info-item">
                                    <span class="info-title"><i class="icon-favorite"></i> 찜한상품</span>
                                    <span class="info-data"><a href="#">0<span class="unit">개</span></a></span>
                                </div>
                            </div>
                        </div><!-- grade-box-contents shopinfo -->
                    </div><!-- member-grade-box -->

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
												<input id="pswdText" name="pswdText" type="password" class="ui-input" placeholder="비밀번호 입력해 주세요.">
											</div>
										</td>
									</tr>

                                    <tr>
										<th scope="row">
                                            <label for="pswdText" class="required">새 비밀번호 확인</label>
                                        </th>
										<td>
											<div class="input-wrap" style="width:350px;">
												<input id="pswdText" name="pswdText" type="password" class="ui-input" placeholder="비밀번호 입력해 주세요.">
											</div>
										</td>
									</tr>
								</tbody>
							</table>
                        </div>

                        <!-- 버튼 - userUI.css -->
                        <div class="btn-wrap page-bottom">
							<button type="button" id="checkPswdBtn" class="btn btn-lg">확인</button>
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
                </div><!-- aside-contents -->
            </div><!-- mypage-wrap -->

        </div><!-- myPage-inner-contents -->
    </div><!-- myPage-wrap -->
    
    <div>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
</body>
</html>