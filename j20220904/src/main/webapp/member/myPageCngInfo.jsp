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
                                            <label for="pswdText" class="required">비밀번호</label>
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
							<span class="text-notice">비밀번호 재확인</span>
							<ul class="bullet-text-list">
								<li class="bullet-text">고객님의 소중한 개인정보를 보호하기 위해 비밀번호를 다시 한번 확인합니다.</li>
								<li class="bullet-text">비밀번호 입력 시 타인에게 노출되지 않도록 주의해 주시기 바랍니다.</li>
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