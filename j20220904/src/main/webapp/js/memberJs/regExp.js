// 유효성 검사 (정규식)
function isId(asValue) { // 아이디 체크 , 영문자로 시작하는 영문자 또는 숫자 6~20자 
	var regExp = /^[a-z]+[a-z0-9]{5,19}$/g; // g : 모두 찾는다. g를 빼면 해당하는 문자 1개만 찾음
	return regExp.test(asValue);
}

function isCorrect(asValue) { // 2~4자 한글만 입력 
	var regExp =  /^[가-힣]{2,4}$/; ///[ㄱ-힣]{2,4}$/g;
	return regExp.test(asValue);
}

function isPassword(asValue) { // 비밀번호 체크, 8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합
	var regExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
	return regExp.test(asValue);
}

function isEmail(asValue) { // 이메일 체크 정규식
	var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	return regExp.test(asValue);
}

function isPhoneNumber(asValue) { // 휴대폰 체크 정규식
	var regExp = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;
	return regExp.test(asValue);
}