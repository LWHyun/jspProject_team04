<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberCss/memIdFind.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberCss/userUI.css">
</head>
<body>
	<div>
		<jsp:include page="../main/header.jsp"></jsp:include>
	</div>

    <div id="memIdFind-wrap">
        <div id="memIdFind-inner-contents">
            <div class="memIdFind-container">
                <!-- 아이디 찾기 헤더 -->
                <div class="page-title-wrap">
                    <h2 class="text-head1">아이디 찾기</h2>
                </div><!-- page-title-wrap 아이디 찾기 헤더-->

                <div class="idFind-contents-inner-wrap">
                    <div class="tab-wrap">
                        <!-- 아이디 찾기 탭 -->
                        <ul class="tab-ul">
                            <li>
                                아이디 찾기
                            </li>
                        </ul>

                        <!-- 아이디 찾기 FORM -->
                        <div class="tab-IdFind-form">
                            <form action="${pageContext.request.contextPath }/member/memIdFindResult.do" method="post" id="search-IdFindForm" name="search-IdFindForm">
                                <div class="login-input login-input-name">
                                    <input type="text" id="mem_name" name="mem_name" placeholder="이름을 입력해주세요.">
                                </div>
                               	<div id="Val_nameDiv" class="valid"></div>

                                <!-- 유효성 검사 필요 -->
                                <div class="login-input login-input-email">
                                    <input type="text" id="mem_email1" name="mem_email" placeholder="이메일을 입력해주세요.">
                                    <button type="button" id="emailBtn" class='btn'>인증번호 요청</button>
                                </div>
                                <div id="emailAuth" style="display:none">
					                <input type="hidden" name="authEmailCheck" id="authEmailCheck" readonly> <!-- 서버에서 만들어진 인증번호를 받는 부분 -->
					                
					                <div class="login-input login-input-authEmail">
	                                    <input type="text" id="authEmail" name="authEmail" placeholder="인증번호 6자리를 입력해주세요." disabled="disabled">  <!-- 사용자가 이메일에 인증번호를 받고 입력하는 부분 -->
	                                    <button type="button" id="acceptBtn" class="btn">확인</button>
                               		</div>
                                </div>
                                <div id="Val_emailDiv" class="valid"></div>
                            </form>
                        </div><!-- 아이디 찾기 FORM -->
                    </div><!-- tab-wrap -->


                    <div class="IdFind-form-footer">
                        <div class="footer-item">
                            <span>비밀번호를 잊으셨나요?</span>
                            <a href="${pageContext.request.contextPath }/member/memPwdFindForm.do" class="btn btn-sm white">비밀번호 찾기</a>
                        </div>

                        <div class="footer-item">
                            <span>아직 회원이 아니신가요?</span>
                            <a href="${pageContext.request.contextPath }/member/writeForm.do" class="btn btn-sm gray">회원가입</a>
                        </div>
                    </div>
                </div><!-- idFind-contents-inner-wrap -->
            </div> <!-- memIdFind-container -->
        </div><!-- memIdFind-inner-contents -->
    </div><!-- memIdFind-wrap -->
    
    <div>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="${pageContext.request.contextPath }/js/memberJs/regExp.js"></script>
<script>
$(function() {
	// 이름
    $('#mem_name').on('blur',function() {
        let mem_name = $('#mem_name').val();

        if(mem_name == '' || !isCorrect(mem_name)) {
            $('#Val_nameDiv').css('display', '');
            $('#Val_nameDiv').text('2~4자 한글 이름만 입력해주세요.');
            $('#mem_name').val('');
            //$('#mem_name').focus();
        } else {
            $('#Val_nameDiv').css('display', 'none');
        }
    });
   	
	let emailChk = false;
    
 	// 이메일 형식 확인 및 정보확인
    $('#mem_email1').on('blur', function() {
    	$('#emailAuth').css('display', 'none');
    	
        if($('#mem_email1').val() == '') {
            $('#Val_emailDiv').css('display','');
            $('#Val_emailDiv').text('이메일을 입력해주세요');
            $('#mem_email1').val('');
			emailChk = false;
        } else {
            if(!isEmail($('#mem_email1').val())) {
                $('#Val_emailDiv').css('display','');
                $('#Val_emailDiv').text('이메일을 형식에 맞게 입력해주세요');
                $('#mem_email1').val('');
				emailChk = false;
            } else {
            	$('#Val_emailDiv').css('display', 'none');

            }
        }
    });

    // 이메일 인증 번호 확인
    $('#authEmail').on('blur', function() {
        if($('#authEmail').val() == '' || $('#authEmail').val() != $('#authEmailCheck').val()) {
            $('#Val_emailDiv').css({
                'display' : '',
                'color' : 'red'
            });
            $('#Val_emailDiv').text('인증번호가 틀렸습니다. 다시 확인해주세요.');
            $('#authEmail').val('');
        } else {
            $('#Val_emailDiv').css({
                'display' : '',
                'color' : 'green'
            });
            $('#Val_emailDiv').text('인증번호가 일치합니다.');
        }
    });
	
	// 인증번호를 클릭 했을 때 visiable 처리 & 서버 인증번호 처리
	$('#emailBtn').on('click', function() {
		if($('#mem_email1').val() == '') {
			alert('이메일을 알맞게 입력해주세요.');
		} else {
			// 입력한 이메일과 맞는지에 대한 ajax
        	$.ajax({
        		url : '${pageContext.request.contextPath}/member/memFindEmailCheck.do',
        		type : 'get',
        		data : {
        			'mem_name' : $('#mem_name').val(),
        			'mem_email' : $('#mem_email1').val()
        		},
        		dataType : 'text',
        		success : function(data) {
        			//alert(data);
        			if(data == '1') {
        				/* $('#Val_emailDiv').css('display','none');
                        $('#emailAuth').css('display', ''); */
        				emailChk = true;
                        
                        if(emailChk) {
	        				$('#authEmail').prop('disabled', false);
	        				
	        				// 인증번호 생성 ajax
	        				$.ajax({
	        					url : '/j20220904/member/emailAuth.do',
	        					type : 'post',
	        					data : "mem_email="+$('#mem_email1').val(),
	        					dataType : 'text',
	        					success : function(data) {
	        						$('#authEmailCheck').val(data);
	        					},
	        					error : function(err) {
	        						console.log(err);
	        					}
	        				});
	        				
	        			    alert("입력하신 정보가 일치합니다.\n인증번호가 전송되었습니다.(1~2분 소요될 수 있습니다.)");
	        			    
	        			    // 인증번호 칸 보이기
	            		    $('#emailAuth').css('display', '');
                        }
        			} else {
        				$('#Val_emailDiv').css('display','');
                        $('#Val_emailDiv').text('입력하신 이메일 정보가 일치하지 않습니다.');
                        $('#mem_email1').val('');
        				emailChk = false;
        			}
        		},
        		error : function(err) {
        			console.log(err);
        		}
        	});

		}
	});
	
	// 확인 버튼 클릭 시
	$('#acceptBtn').click(function() {
		if(!$('#mem_name').val()) {
            alert("이름을 입력해주세요");
            $('#mem_name').focus();
            return false;
        } else if(!$('#mem_email1').val()){
            alert("이메일을 입력해주세요");
            $('#mem_email1').focus();
            return false;
        } else if(!$('#authEmail').val()) {
            alert("이메일 인증을 해주세요.");
            $('#emailBtn').focus();
            return false;
        } else if($('#Val_emailDiv').css('color') == 'rgb(255, 0, 0)') {
        	alert("인증번호 요청을 다시 부탁드립니다.");
		} else {
			$('#search-IdFindForm').submit();
		}
	});
});
</script>
</body>
</html>