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
