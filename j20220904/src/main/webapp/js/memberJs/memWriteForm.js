// 화살표 클릭 이벤트, fold-box / fold-box expanded 변환
$(function() {
    $('.arrowImg1').click(function() {
        let foldbox = $('.fold-box-list').children().eq(0); // li.fold-box
        
        if($('.arrowImg1').attr('src') == './img/arrow_up.svg') {
            foldbox.attr('class', 'fold-box expanded');
            $('.arrowImg1').attr('src', './img/arrow_down.svg');
        } else {
            foldbox.attr('class', 'fold-box');
            $('.arrowImg1').attr('src', './img/arrow_up.svg');
        }
    });

    $('.arrowImg2').click(function() {
        let foldbox = $('.fold-box-list').children().eq(1); // li.fold-box
        
        if($('.arrowImg2').attr('src') == './img/arrow_up.svg') {
            foldbox.attr('class', 'fold-box expanded');
            $('.arrowImg2').attr('src', './img/arrow_down.svg');
        } else {
            foldbox.attr('class', 'fold-box');
            $('.arrowImg2').attr('src', './img/arrow_up.svg');
        }
    });

    $('.arrowImg3').click(function() {
        let foldbox = $('.fold-box-list').children().eq(2); // li.fold-box
        
        if($('.arrowImg3').attr('src') == './img/arrow_up.svg') {
            foldbox.attr('class', 'fold-box expanded');
            $('.arrowImg3').attr('src', './img/arrow_down.svg');
        } else {
            foldbox.attr('class', 'fold-box');
            $('.arrowImg3').attr('src', './img/arrow_up.svg');
        }
    });
});

// 전체 약관 / 개별 약관
$(function() {
    // 전체 약관을 눌렀을 때 모두 선택 / 모두 취소
    $('#foldCheckAll').on('click', function() {
        let checked = $(this).is(":checked");
        
        if(checked) {
            $('.foldTermCheck').prop('checked', true);
        } else {
            $('.foldTermCheck').prop('checked', false);
        }
        
    });

    // 전체선택 후 하나만 해제했을 때, 전체 선택도 해체해주기
    $($('.foldTermCheck')).on('click', function() {
        let is_checked = true;
        
        $('.foldTermCheck').each(function() {
            is_checked = is_checked && $(this).is(":checked");
        });

        $('#foldCheckAll').prop('checked', is_checked);
    });
});

let pass = false;
let emailChk = false;

// blur 됐을 때 유효성 검사
$(function() {
    let authEmail = $('#authEmail').val();
    let authEmailCheck = $('#authEmailCheck').val();
    let mem_tel = $('#mem_tel').val();
    let mem_zipcode = $('#mem_zipcode').val();

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
    // 아이디
    $('#mem_id').on('blur',function() {
        let mem_id = $('#mem_id').val();

        if(mem_id == '' || !isId(mem_id)) {
            $('#Val_idDiv').css('display', '');
            $('#Val_idDiv').text('아이디를 입력해주세요.(영문자로 시작, 숫자 가능 6~20자)');
            $('#mem_id').val('');
            //$('#mem_id').focus();
        } else {
            $('#Val_idDiv').css('display', 'none');

            // 중복 검사 ajax
			$.ajax({
				url : '/j20220904/member/memCheckId.do',
				type : 'post',
				data : 'mem_id='+$('#mem_id').val(),
				dataType : 'text',
				success : function(data) {
					console.log(data);
					$('#mem_idCheck').val(data);
					
					if($('#mem_idCheck').val() == 'exist') {
						$('#Val_idDiv').css('display', '');
			            $('#Val_idDiv').text('이미 존재하는 아이디 입니다.');
			            $('#mem_id').val('');
					} else {
					 	$('#Val_idDiv').css('display', 'none');
					}
				},
				error : function(err) {
					console.log(err);
				}
			});
        }
    });
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
        }
    });
    //비밀번호 확인
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
    // 이메일 형식 확인
    $('#mem_email1').on('blur', function() {
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
                $('#Val_emailDiv').css('display','none');
                $('#emailAuth').css('display', '');
				emailChk = true;
            }
        }
    });

    // 이메일 인증 번호 확인
    $('#authEmail').on('blur', function() {
        if($('#authEmail').val() != $('#authEmailCheck').val()) {
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
    
    // 휴대폰 확인
    $('#mem_tel').on('blur', function() {
        if($('#mem_tel').val() == '' || !isPhoneNumber($('#mem_tel').val())) {
            $('#Val_telDiv').css('display', '');
            $('#Val_telDiv').text('휴대폰 번호를 형식에 맞게 작성해주세요');
            $('#mem_tel').val('');
        } else {
            $('#Val_telDiv').css('display', 'none');
        }
    });

});

// 인증번호를 클릭 했을 때 visiable 처리 & 서버 인증번호 처리
$('#emailBtn').on('click', function() {
	if($('#mem_email1').val() == '' || !emailChk) {
		alert('이메일을 알맞게 입력해주세요.');
	} else {
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
		
	    alert("인증번호가 전송되었습니다.(1~2분 소요될 수 있습니다.)");
	}
});

// 확인 버튼 클릭 시 체크 
$(function() {
    $('#btn-accept').on('click', function() {
        let checked = $('#foldCheckAll').is(":checked");

        if(!checked) {
            alert("필수 약관을 체크해주세요");
            $('#foldCheckAll').focus();
            return pass;
        } else if(!$('#mem_name').val()) {
            alert("이름을 입력해주세요");
            $('#mem_name').focus();
            return pass;
        } else if(!$('#mem_id').val()){
            alert("아이디를 입력해주세요");
            $('#mem_id').focus();
            return pass;
        } else if(!$('#mem_pwd').val()){
            alert("비밀번호를 입력해주세요");
            $('#mem_pwd').focus();
            return pass;
        } else if(!$('#mem_rePwd').val()){
            alert("비밀번호를 확인해주세요");
            $('#mem_rePwd').focus();
            return pass;
        } else if(!$('#mem_rePwd').val()){
            alert("비밀번호를 확인해주세요");
            $('#mem_rePwd').focus();
            return pass;
        } else if(!$('#mem_email1').val()){
            alert("이메일을 입력해주세요");
            $('#mem_email1').focus();
            return pass;
        } else if(!$('#authEmail').val()) {
            alert("이메일 인증을 해주세요.");
            $('#emailBtn').focus();
            return pass;
        } else if(!$('#mem_tel').val()) {
            alert("휴대폰 번호를 입력해주세요");
            $('#mem_tel').focus();
            return pass;
        } else if(!$('#mem_zipcode').val()) {
            alert("주소를 검색해주세요");
            $('#zipcodeBtn').focus();
            return pass;
        } else {
            $('#memJoinForm').submit();
        }
    });

	
})




