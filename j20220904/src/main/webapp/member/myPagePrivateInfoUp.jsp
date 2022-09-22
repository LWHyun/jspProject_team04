<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberCss/myPagePrivateInfoUp.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberCss/userUI.css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${pageContext.request.contextPath }/js/memberJs/daumAPI.js"></script>
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
                                                <input type="text" id="" name="">
                                                <input type="text" id="" name="email2" list="emailList" placeholder="이메일 주소를 입력해 주세요."> 
                                                <datalist id="emailList">
                                                    <option value="google.co.kr">google.co.kr</option>
                                                    <option value="gmail.com">gmail.com</option>
                                                    <option value="naver.com">naver.com</option>
                                                    <option value="nate.com">nate.com</option>
                                                    <option value="yahoo.co.kr">yahoo.co.kr</option>
                                                    <option value="hanmail.net">hanmail.net</option>
                                                </datalist>
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
                                                <button type="button" class='btn'>인증번호 요청</button>
                                            </div>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <th class="required">주소</th>
                                        <td>
                                            <div>
                                                <input type="text" id="zipcode" name="zipcode" placeholder="우편번호" readonly disabled>
                                                <button type="button" onclick="checkPost()">우편번호 검색</button>
                                                <input type="text" name="addr1" id="addr1" placeholder="주소" size="50" readonly disabled>
                                                <input type="text" name="addr2" id="addr2" placeholder="상세주소" size="50">
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th class="required">비밀번호확인</th>
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
                </div><!-- aside-contents -->
            </div><!-- mypage-wrap -->
        </div><!-- myPage-inner-contents -->
    </div><!-- myPage-wrap -->
    
    <div>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
</body>
</html>